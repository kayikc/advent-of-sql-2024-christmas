# Advent of SQL 2024 - Christmas

<img src="https://camo.githubusercontent.com/cc53dd7fa6d981b5b75256d99315301e1227948c5b80f4a8de43bc22c20ab27c/68747470733a2f2f756e73706c6173682e636f6d2f70686f746f732f74776f2d6669677572696e65732d6e6561722d70696e65636f6e65732d6e4e386331634347735a49" alt="christmas_elf" width="400" />

<img src="https://duckdb.org/images/logo-dl/DuckDB_Logo.pdf" alt="DuckDB Logo" width="200" />

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

## Day 5 Task Description:

- List each day's **production date** and the number of toys produced on that day.
- Include the **previous day's** toy production next to each current day's production.
- Calculate the **change** in the number of toys produced compared to the previous day.
- Calculate the **percentage change** in production compared to the previous day.

#### To submit on Day 1:

- Submit the date of the day with the **largest daily increase in percentage**.


