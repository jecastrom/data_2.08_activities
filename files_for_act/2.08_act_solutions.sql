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
-- 2) Do the same but group by region.