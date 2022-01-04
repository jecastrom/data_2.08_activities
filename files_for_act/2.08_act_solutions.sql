-- Activity 1
-- 1) Rank districts by different variables.
-- No of inhabitants
SELECT
    a2 AS district_name,
    a4 AS no_of_inhabitants,
    rank() over(
        ORDER BY
            a4 DESC
    ) AS ranking
FROM
    district;
-- No of cities
SELECT
    a2 AS district_name,
    a9 AS no_of_cities,
    rank() over(
        ORDER BY
            a9 DESC
    ) AS ranking
FROM
    district;
/*
 Notice that the number of cities can repeat. When this occures rank gives the same 
 rank to the repeated values and skips one level. The Rank() functions ranks in a 
 "olimpic medaling style", if two people share the gold, there is no silver medalist.
 
 If I didnt want the "skiping" of levels, then I should use the Dense_rank() function, 
 so no olilimpic medaling style of ranking with Dense_rank().
 
 */
SELECT
    a2 AS district_name,
    a9 AS no_of_cities,
    dense_rank() over(
        ORDER BY
            a9 DESC
    ) AS ranking
FROM
    district;
-- A10: the ratio of urban inhabitants
SELECT
    a2 AS district_name,
    a10 AS ratio_of_urban_inhabitants,
    rank() over(
        ORDER BY
            a10 DESC
    ) AS ranking
FROM
    district;
-- A11: average salary
SELECT
    a2 AS district_name,
    a11 AS average_salary,
    rank() over(
        ORDER BY
            a11 DESC
    ) AS ranking
FROM
    district;
-- A12: the unemployment rate
SELECT
    a2 AS district_name,
    a12 AS unemployment_rate,
    rank() over(
        ORDER BY
            a12 DESC
    ) AS ranking
FROM
    district;
-- Overview by unemployment rate:
SELECT
    a2 AS district_name,
    a12 AS unemployment_rate,
    rank() over(
        ORDER BY
            a12 DESC
    ) AS ranking,
    a4 AS no_of_inhabitants,
    rank() over(
        ORDER BY
            a4 DESC
    ) AS ranking,
    a9 AS no_of_cities,
    rank() over(
        ORDER BY
            a9 DESC
    ) AS ranking,
    a10 AS ratio_of_urban_inhabitants,
    rank() over(
        ORDER BY
            a10 DESC
    ) AS ranking,
    a11 AS average_salary,
    rank() over(
        ORDER BY
            a11 DESC
    ) AS ranking
FROM
    district
ORDER BY
    unemployment_rate DESC;
-- 2) Do the same but group by region.
SELECT
    a3 AS region,
    sum(a4) AS no_of_inhabitants,
    rank() over(
        ORDER BY
            sum(a4) DESC
    ) AS ranking,
    sum(a9) AS no_of_cities,
    rank() over(
        ORDER BY
            sum(a9) DESC
    ) AS ranking,
    avg(a10) AS ratio_of_urban_inhabitants,
    rank() over(
        ORDER BY
            avg(a10) DESC
    ) AS ranking,
    avg(a11) AS average_salary,
    rank() over(
        ORDER BY
            avg(a11) DESC
    ) AS ranking,
    avg(a12) AS unemployment_rate,
    rank() over(
        ORDER BY
            avg(a12) DESC
    ) AS ranking
FROM
    district
GROUP BY
    1
ORDER BY
    no_of_inhabitants DESC;
-- ACTIVITY 2: 
-- Use the transactions table in the `bank` database to find the Top 20 `account_ids` based on the `amount`.
SELECT
    account_id,
    amount,
    rank() over(
        ORDER BY
            amount DESC
    ) AS top_20_transactions
FROM
    trans
LIMIT
    20;
--Activity 3
-- 1. Get a rank of districts ordered by the number of customers
SELECT
    district_id,
    district.a2 AS district_name,
    count(*) AS total_number_of_customers,
    rank() over(
        ORDER BY
            count(*) DESC
    ) AS ranking
FROM
    client
    INNER JOIN district ON `client`.district_id = district.a1
GROUP BY
    1;