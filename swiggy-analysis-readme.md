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

## Query Examples

Here's an example of how to find the top 3 cities with the highest average restaurant ratings:

```sql
SELECT city, ROUND(AVG(rating), 2) AS average_rating
FROM swiggy
GROUP BY city
ORDER BY average_rating DESC
LIMIT 3;
```

To find restaurants with the most expensive items:

```sql
SELECT city, restaurant_name, MAX(CAST(price AS UNSIGNED)) AS max_price
FROM swiggy
GROUP BY city, restaurant_name
ORDER BY city;
```

## Database Schema
The analysis uses the following main table:
- `swiggy`
  - restaurant_name
  - city
  - rating
  - cost_per_person
  - cuisine
  - menu_category
  - item
  - price
  - veg_or_nonveg
  - address

======================
