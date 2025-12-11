-- Data cleaning with CTE (normalization)
WITH CleanedData AS (
    SELECT 
        product_id,
        product_name,
        -- Extract Main Category (First part before the pipe symbol)
        CASE 
            WHEN CHARINDEX('|', category) > 0 
            THEN LEFT(category, CHARINDEX('|', category) - 1) 
            ELSE category 
        END AS MainCategory,
        
        -- Remove currency symbol '$' and commas ',' then cast to DECIMAL
        CAST(REPLACE(REPLACE(discounted_price, '$', ''), ',', '') AS DECIMAL(10, 2)) AS CleanedDiscountPrice,
        CAST(REPLACE(REPLACE(actual_price, '$', ''), ',', '') AS DECIMAL(10, 2)) AS CleanedActualPrice,
        
        -- Remove '%' and cast to FLOAT
        CAST(REPLACE(discount_percentage, '%', '') AS FLOAT) AS DiscountPercent,
        
        -- Handle dirty data in rating (e.g., '|' symbol) and cast
        CAST(CASE WHEN ISNUMERIC(rating) = 1 THEN rating ELSE NULL END AS FLOAT) AS CleanedRating,
        
        -- Remove commas from rating_count
        CAST(REPLACE(rating_count, ',', '') AS INT) AS CleanedRatingCount
    FROM AmazonProducts
)

-- Q1. What are the Top 5 Categories by Estimated Revenue?
SELECT TOP 5
    MainCategory,
    SUM(CleanedDiscountPrice * CleanedRatingCount) AS EstimatedRevenue,
    COUNT(product_id) AS TotalProducts
FROM CleanedData
GROUP BY MainCategory
ORDER BY EstimatedRevenue DESC;

-- Q2. What is the Average Discount Percentage per Category?
SELECT 
    MainCategory,
    AVG(DiscountPercent) AS AvgDiscountPercentage,
    MAX(DiscountPercent) AS MaxDiscountGiven
FROM CleanedData
GROUP BY MainCategory
ORDER BY AvgDiscountPercentage DESC;

-- Q3. Top 10 "Best Value" Products (High Rating + High Discount)
SELECT TOP 10
    product_name,
    CleanedRating AS Rating,
    DiscountPercent,
    CleanedDiscountPrice AS Price
FROM CleanedData
WHERE CleanedRating >= 4.0 
  AND DiscountPercent > 50
ORDER BY CleanedRating DESC, DiscountPercent DESC;

-- Q4. Price vs. Rating Correlation Bucket
SELECT 
    CASE 
        WHEN CleanedDiscountPrice < 500 THEN 'Budget (< $500)'
        WHEN CleanedDiscountPrice BETWEEN 500 AND 2000 THEN 'Mid-Range ($500-$2k)'
        ELSE 'Premium (> $2k)'
    END AS PriceSegment,
    AVG(CleanedRating) AS AvgRating,
    SUM(CleanedRatingCount) AS TotalEngagement
FROM CleanedData
GROUP BY 
    CASE 
        WHEN CleanedDiscountPrice < 500 THEN 'Budget (< $500)'
        WHEN CleanedDiscountPrice BETWEEN 500 AND 2000 THEN 'Mid-Range ($500-$2k)'
        ELSE 'Premium (> $2k)'
    END
ORDER BY AvgRating DESC;

-- Q5. Top 3 Most Reviewed Products Per Category
SELECT * FROM (
    SELECT 
        MainCategory,
        product_name,
        CleanedRatingCount,
        -- Rank products by review count (popularity) within each category
        DENSE_RANK() OVER(PARTITION BY MainCategory ORDER BY CleanedRatingCount DESC) AS RankInCat
    FROM CleanedData
) AS RankedProducts
WHERE RankInCat <= 3;

-- Q6. Product Price vs. Category Average
SELECT 
    product_name,
    MainCategory,
    CleanedDiscountPrice AS ProductPrice,
    
    -- Calculate average price for the specific category this product belongs to
    AVG(CleanedDiscountPrice) OVER(PARTITION BY MainCategory) AS AvgCategoryPrice,
    
    -- Calculate how much cheaper/expensive this product is compared to the category average
    CleanedDiscountPrice - AVG(CleanedDiscountPrice) OVER(PARTITION BY MainCategory) AS PriceDifference
FROM CleanedData
ORDER BY MainCategory, PriceDifference DESC;

-- Q7. Price Gaps (Previous vs. Current Product)
SELECT 
    MainCategory,
    product_name,
    CleanedDiscountPrice,
    
    -- Get the price of the product ranked just below this one in price
    LAG(CleanedDiscountPrice, 1, 0) OVER(PARTITION BY MainCategory ORDER BY CleanedDiscountPrice) AS PreviousLowerPrice,
    
    -- Calculate the jump in price
    CleanedDiscountPrice - LAG(CleanedDiscountPrice, 1, 0) OVER(PARTITION BY MainCategory ORDER BY CleanedDiscountPrice) AS PriceJump
FROM CleanedData
ORDER BY MainCategory, CleanedDiscountPrice;