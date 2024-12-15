# Advent of SQL 2024 - Christmas

![christmas_elf](asset/paige-cody.jpg)

I used [**DuckDB**](https://duckdb.org/) and [**PostgreSQL**](https://www.postgresql.org/)+[**DataGrip**](https://www.jetbrains.com/datagrip/) to do the queries.

## Day 1 Task Description:

Create a report showing what gifts children want, with difficulty ratings and categorization.

- The **primary wish** will be the first choice.
- The **secondary wish** will be the second choice.
- The **favorite color** is assumed to be the first color in the wish list.
- **Gift complexity** can be mapped from the toy difficulty to make. Assume the following:

Gift complexity can be mapped from the toy difficulty to make. Assume the following:
```sql
    Simple Gift = 1
    Moderate Gift = 2
    Complex Gift >= 3
```
We assign the **workshop** based on the primary wish's toy category. Assume the following:
  ```sql
  outdoor = Outside Workshop
  educational = Learning Workshop
  all other types = General Workshop
```
- Order the list by name in ascending order.
- Limit the result to only 5 rows.

#### To submit on Day 1:
In the inputs below provide one row per input in the format, with no spaces and comma separation:
```sql
name,primary_wish,backup_wish,favorite_color,color_count,gift_co
```
---
## Day 2 Task Description

Decode a child's Christmas wish from two tables affected by magical Northern Lights interference! We need to:
1. Filter out the holiday sparkles (noise)
2. Combine Binky and Blinky's tables
3. Decode the values back into regular letters
4. Make sure everything's in the right order!

### Table Schemas
```sql
-- Binky's Table
CREATE TABLE letters_a (
    id SERIAL PRIMARY KEY,
    value INTEGER
);

-- Blinky's Table
CREATE TABLE letters_b (
    id SERIAL PRIMARY KEY,
    value INTEGER
);
```
#### To submit on Day 2:
Something like this: Dear Santa, I would like a Pony for Christmas, Love Susie

---
## Day 3 Task Description

The challenge is that some records are stored in different XML schemas. Mrs. Claus needs help writing a SQL query that can search through all schema versions to find the most beloved dishes from the busiest celebrations. As she's having more than 78 guests this year, she wants to make sure the dishes are popular with a large crowd, so only use years where she had more than 78 guests.

You will have to do some prep-work before you write your final query, like understanding how many unique schema versions exist and how to parse each schema using SQL.

Help Mrs. Claus write a SQL query that can:

1. Parse through all different schema versions of menu records
2. Find menu entries where the guest count was above 78
3. Extract the food_item_ids from those successful big dinners
4. From this enormous list of items, determine which dish (by food_item_id) appears most frequently across all of the dinners

### Table Schemas
```sql
DROP TABLE IF EXISTS christmas_menus CASCADE;

CREATE TABLE christmas_menus (
  id SERIAL PRIMARY KEY,
  menu_data XML
);
```
#### To submit on Day 3:
Input the food_item_id of the food item that appears the most often.

---
## Day 4 Task Description

Help the elves analyze toy tags by finding:
1. New tags that weren't in previous_tags (call this added_tags)
2. Tags that appear in both previous and new tags (call this unchanged_tags)
3. Tags that were removed (call this removed_tags)

For each toy, return toy_name and these three categories as arrays.

Remember to handle cases where the array is empty, their output should be 0.
### Table Schemas
```sql
DROP TABLE IF EXISTS toy_production CASCADE;
CREATE TABLE toy_production (
  toy_id INT,
  toy_name VARCHAR(100),
  previous_tags TEXT[],
  new_tags TEXT[]
);
```
### Sample Data
```sql
INSERT INTO toy_production VALUES
(1, 'Robot', ARRAY['fun', 'battery'], ARRAY['smart', 'battery', 'educational', 'scientific']),
(2, 'Doll', ARRAY['cute', 'classic'], ARRAY['cute', 'collectible', 'classic']),
(3, 'Puzzle', ARRAY['brain', 'wood'], ARRAY['educational', 'wood', 'strategy']);
```
#### To submit on Day 4:
Find the toy with the most added tags, there is only 1, and submit the following:
- toy_id
- added_tags length
- unchanged_tags length
- removed_tags length
Remember to handle cases where the array is empty, their output should be 0.

---
## Day 5 Task Description:

- List each day's **production date** and the number of toys produced on that day.
- Include the **previous day's** toy production next to each current day's production.
- Calculate the **change** in the number of toys produced compared to the previous day.
- Calculate the **percentage change** in production compared to the previous day.

#### To submit on Day 5:

- Submit the date of the day with the **largest daily increase in percentage**.

---
## Day 6 Task Description

Santa's elves have reported an issue with gift distribution fairness. Some children are receiving gifts far more expensive than others in their neighborhood. Santa wants to ensure a more equitable distribution by identifying these cases. He needs to find all children who received gifts that are more expensive than the average gift price in the North Pole's gift database, so he can review and adjust the distribution plan accordingly.

Write a query that returns the name of each child and the name and price of their gift, but only for children who received gifts more expensive than the average gift price.

The results should be ordered by the gift price in ascending order.
### Table Schemas
```sql
DROP TABLE IF EXISTS children CASCADE;
DROP TABLE IF EXISTS gifts CASCADE;
CREATE TABLE children (
    child_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INTEGER,
    city VARCHAR(100)
);
CREATE TABLE gifts (
    gift_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    child_id INTEGER REFERENCES children(child_id)
);
);
```
### Sample Data
```sql
INSERT INTO children (name, age, city) VALUES
    ('Tommy', 8, 'London'),
    ('Sarah', 7, 'London'),
    ('James', 9, 'Paris'),
    ('Maria', 6, 'Madrid'),
    ('Lucas', 10, 'Berlin');

INSERT INTO gifts (name, price, child_id) VALUES
    ('Robot Dog', 45.99, 1),
    ('Paint Set', 15.50, 2),
    ('Gaming Console', 299.99, 3),
    ('Book Collection', 25.99, 4),
    ('Chemistry Set', 109.99, 5);
```
#### To submit on Day 6:
Give the name of the child with the first gift thats higher than the average.

---

