# Restaurant & City Insights

# Swiggy Restaurant Data Analysis 🍽️

## Overview
This repository contains SQL queries for analyzing restaurant data from Swiggy, a food delivery platform. The analysis covers various aspects including restaurant distributions, ratings, menu offerings, pricing, and customer preferences.

## Analysis Categories

### 1. Restaurant & City Insights
- City-wise restaurant distribution
- High-rated restaurants analysis (>4.5 rating)
- Top cities by average restaurant ratings
- Vegetarian restaurant distribution
- Address length analysis

### 2. Menu & Cuisine Analysis
- Top 5 cuisine distribution
- Menu variety analysis
- Restaurant menu category diversity
- Vegetarian restaurant listings
- City-wise price maximums

### 3. Cost & Pricing Analysis
- Above-average cost analysis
- Minimum price analysis
- Premium menu items
- Non-Indian cuisine cost analysis
- City-wise cost spread

### 4. Customer Preferences
- City-wise rating analysis
- Pizza restaurant analysis
- Popular menu categories
- Vegetarian menu analysis
- Non-vegetarian restaurant item counts

### 5. Complex Analysis
- Multi-category restaurant analysis
- City cost analysis
- Premium item analysis
- Vegetarian percentage by city
- Rating comparison within cuisines

1. **Which city has the most restaurants listed in the dataset?**
   ```sql
   SELECT city, COUNT(DISTINCT restaurant_name) AS restaurant_count
   FROM swiggy
   GROUP BY city
   ORDER BY restaurant_count DESC
   LIMIT 1;
   ```

2. **How many restaurants have a rating greater than 4.5?**
   ```sql
   SELECT COUNT(DISTINCT restaurant_name) AS high_rating_restaurants
   FROM swiggy
   WHERE rating > 4.5;
   ```

3. **List the top 3 cities with the highest average restaurant ratings.**
   ```sql
   SELECT city, ROUND(AVG(rating), 2) AS average_rating
   FROM swiggy
   GROUP BY city
   ORDER BY average_rating DESC
   LIMIT 3;
   ```

4. **What is the total number of restaurants offering vegetarian-only menus in each city?**
   ```sql
   SELECT city, COUNT(DISTINCT restaurant_name) AS veg_restaurants
   FROM swiggy
   WHERE veg_or_nonveg = 'Veg'
   GROUP BY city
   ORDER BY veg_restaurants DESC;
   ```

5. **Which restaurant has the longest address?**
   ```sql
   SELECT restaurant_name, LENGTH(address) AS address_length
   FROM swiggy
   ORDER BY address_length DESC
   LIMIT 1;
   ```

---

### **Menu & Cuisine Analysis**
6. **Which are the top 5 cuisines offered across all restaurants?**
   ```sql
   SELECT cuisine, COUNT(*) AS cuisine_count
   FROM swiggy
   GROUP BY cuisine
   ORDER BY cuisine_count DESC
   LIMIT 5;
   ```

7. **Which restaurant offers the largest variety of items under the "Main Course" menu category?**
   ```sql
   SELECT restaurant_name, COUNT(DISTINCT item) AS item_count
   FROM swiggy
   WHERE menu_category = 'Main Course'
   GROUP BY restaurant_name
   ORDER BY item_count DESC
   LIMIT 1;
   ```

8. **Which restaurants have the highest number of distinct menu categories?**
   ```sql
   SELECT restaurant_name, COUNT(DISTINCT menu_category) AS category_count
   FROM swiggy
   GROUP BY restaurant_name
   ORDER BY category_count DESC
   LIMIT 5;
   ```

9. **List all vegetarian restaurants sorted in alphabetical order by name.**
   ```sql
   SELECT DISTINCT restaurant_name
   FROM swiggy
   WHERE veg_or_nonveg = 'Veg'
   ORDER BY restaurant_name ASC;
   ```

10. **Find the restaurant offering the most expensive item in each city.**
    ```sql
    SELECT city, restaurant_name, MAX(CAST(price AS UNSIGNED)) AS max_price
    FROM swiggy
    GROUP BY city, restaurant_name
    ORDER BY city;
    ```

---

### **Cost & Pricing Analysis**
11. **Which restaurants have a cost per person higher than the average cost?**
    ```sql
    SELECT restaurant_name, cost_per_person
    FROM swiggy
    WHERE cost_per_person > (SELECT AVG(cost_per_person) FROM swiggy)
    ORDER BY cost_per_person DESC;
    ```

12. **What is the lowest average price of items among all restaurants?**
    ```sql
    SELECT restaurant_name, ROUND(AVG(CAST(price AS UNSIGNED)), 2) AS avg_price
    FROM swiggy
    GROUP BY restaurant_name
    ORDER BY avg_price ASC
    LIMIT 1;
    ```

13. **Which restaurant offers the highest-priced item under the "Recommended" menu category?**
    ```sql
    SELECT restaurant_name, MAX(CAST(price AS UNSIGNED)) AS max_price
    FROM swiggy
    WHERE menu_category = 'Recommended'
    GROUP BY restaurant_name
    ORDER BY max_price DESC
    LIMIT 1;
    ```

14. **Find the top 5 restaurants with the highest cost per person for non-Indian cuisines.**
    ```sql
    SELECT restaurant_name, cost_per_person, cuisine
    FROM swiggy
    WHERE cuisine != 'Indian'
    ORDER BY cost_per_person DESC
    LIMIT 5;
    ```

15. **Calculate the difference between the highest and lowest cost per person in each city.**
    ```sql
    SELECT city,
           MAX(cost_per_person) - MIN(cost_per_person) AS cost_difference
    FROM swiggy
    GROUP BY city;
    ```

---

### **Customer Preferences**
16. **What is the average restaurant rating in each city?**
    ```sql
    SELECT city, ROUND(AVG(rating), 2) AS average_rating
    FROM swiggy
    GROUP BY city
    ORDER BY average_rating DESC;
    ```

17. **How many restaurants have the word "Pizza" in their name?**
    ```sql
    SELECT COUNT(DISTINCT restaurant_name) AS pizza_restaurants
    FROM swiggy
    WHERE restaurant_name LIKE '%Pizza%';
    ```

18. **List the 3 most popular menu categories based on item count.**
    ```sql
    SELECT menu_category, COUNT(*) AS item_count
    FROM swiggy
    GROUP BY menu_category
    ORDER BY item_count DESC
    LIMIT 3;
    ```

19. **Which restaurant has the most vegetarian items on its menu?**
    ```sql
    SELECT restaurant_name, COUNT(item) AS veg_item_count
    FROM swiggy
    WHERE veg_or_nonveg = 'Veg'
    GROUP BY restaurant_name
    ORDER BY veg_item_count DESC
    LIMIT 1;
    ```

20. **List all non-vegetarian restaurants and the total number of items they offer.**
    ```sql
    SELECT restaurant_name, COUNT(item) AS nonveg_item_count
    FROM swiggy
    WHERE veg_or_nonveg = 'Non-Veg'
    GROUP BY restaurant_name
    ORDER BY nonveg_item_count DESC;
    ```

---

### **Complex & Advanced Queries**
21. **Which restaurants have more than 3 distinct menu categories, and what are those categories?**
    ```sql
    SELECT restaurant_name, GROUP_CONCAT(DISTINCT menu_category) AS categories
    FROM swiggy
    GROUP BY restaurant_name
    HAVING COUNT(DISTINCT menu_category) > 3;
    ```

22. **Which city has the highest average cost per person?**
    ```sql
    SELECT city, ROUND(AVG(cost_per_person), 2) AS avg_cost
    FROM swiggy
    GROUP BY city
    ORDER BY avg_cost DESC
    LIMIT 1;
    ```

23. **Find the restaurant with the highest number of items priced above ₹200.**
    ```sql
    SELECT restaurant_name, COUNT(item) AS high_price_items
    FROM swiggy
    WHERE price > 200
    GROUP BY restaurant_name
    ORDER BY high_price_items DESC
    LIMIT 1;
    ```

24. **What is the percentage of vegetarian restaurants in each city?**
    ```sql
    SELECT city,
           ROUND((COUNT(CASE WHEN veg_or_nonveg = 'Veg' THEN 1 END) * 100.0 / COUNT(*)), 2) AS veg_percentage
    FROM swiggy
    GROUP BY city;
    ```

25. **List restaurants that offer the same cuisine but have more than a 1-point difference in ratings.**
    ```sql
    SELECT t1.restaurant_name AS restaurant_1, t2.restaurant_name AS restaurant_2, t1.cuisine
    FROM swiggy t1
    JOIN swiggy t2 ON t1.cuisine = t2.cuisine AND t1.restaurant_name != t2.restaurant_name
    WHERE ABS(t1.rating - t2.rating) > 1;
    ```
