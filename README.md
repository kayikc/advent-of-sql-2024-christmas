# Advent of SQL 2024 - Christmas

![christmas_elf](asset/paige-cody.jpg)

I used [**DuckDB**](https://duckdb.org/) to do the queries.

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
---
## Day 5 Task Description:

- List each day's **production date** and the number of toys produced on that day.
- Include the **previous day's** toy production next to each current day's production.
- Calculate the **change** in the number of toys produced compared to the previous day.
- Calculate the **percentage change** in production compared to the previous day.

#### To submit on Day 1:

- Submit the date of the day with the **largest daily increase in percentage**.


