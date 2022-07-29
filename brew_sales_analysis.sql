/*Within the space of the last three years, what was the profit worth of the brewies, inclusive of the anglophone and the francophone territories*/
SELECT SUM(profit) profit
FROM sales

/*Compare the total profit between these two territories in order for the territory manager to make a strategic decision that will aid profit maximization*/ 
SELECT DISTINCT territories, SUM(profit) profit
FROM sales
GROUP BY 1

/*What country generated the highest profit in 2019*/
SELECT DISTINCT countries, SUM(profit) profit
FROM sales
WHERE years =2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*which year has the highest profit*/
SELECT years, SUM(profit) profit
FROM sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*Which month was the least profit generated*/
SELECT months, SUM(profit) profit
FROM sales
GROUP BY 1
ORDER BY 2
LIMIT 1

/*What was the minimum profit in the month of December 2018*/
SELECT months,years,MIN(profit) min_profit
FROM sales
WHERE months='December' AND years=2018
GROUP BY 1,2

/*Compare the profit for each of the months in 2019*/
SELECT DISTINCT months, SUM(profit) profit
FROM sales
WHERE years=2019
GROUP BY 1
ORDER BY 2 DESC

/*Which particular brand generated the highest profit in senegal*/
SELECT countries,brands, SUM(profit)
FROM sales
WHERE countries='Senegal'
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1

/*Display the top three brands consumed in the last two years in the francophone countries*/
SELECT brands,SUM(quantity) quantity_consumed
FROM sales
WHERE years IN (2018,2019) AND territories ='Francophone'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3

/*find out the top two choice of consumer brands in Ghana*/
SELECT brands, SUM(quantity) quantity
FROM sales
WHERE countries ='Ghana'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2

/*find out the details of beers consumed in the past three years in the most oil reached country in West Africa*/
SELECT *
FROM sales
WHERE brands IN ('hero','budweiser','trophy','castle lite','eagle lager') AND countries = 'Nigeria'

/*display the consumer favorite malt brand in Anglophone region betwwen 2018 and 2019*/
SELECT brands, SUM(quantity) quantity
FROM sales
WHERE brands IN ('beta malt','grand malt') AND years BETWEEN 2018 AND 2019 AND territories = 'Anglophone'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*Which brands sold the highest in 2019 in Nigeria*/
SELECT DISTINCT brands,SUM(unit_price * quantity) price
FROM sales
WHERE years= 2019 AND countries = 'Nigeria'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*Dispaly the favorite brand in the southsouth region in Nigeria*/
SELECT brands,SUM(quantity) quantity,region
FROM sales
WHERE region LIKE '%south' AND countries = 'Nigeria'
GROUP BY 1,3
ORDER BY 2 DESC
LIMIT 1

/*Display the beer consumption in Nigeria*/
SELECT SUM(quantity) bottle_consumption
FROM
(SELECT brands,SUM(quantity) quantity
FROM sales
WHERE brands IN ('hero','budweiser','trophy','castle lite','eagle lager') AND countries = 'Nigeria'
GROUP BY 1) t1

/*level of consumption of budweiser in Nigeria*/
SELECT brands,SUM(quantity) bottle_consumed
FROM sales
WHERE brands = 'budweiser' AND countries = 'Nigeria'
GROUP BY 1

/*countries with the highest consumption of beer*/
SELECT  DISTINCT countries,SUM(quantity) bottles_consumed
FROM sales
WHERE brands IN ('hero','budweiser','trophy','castle lite','eagle lager')
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*highest sales personnel in senegal*/
SELECT  DISTINCT sales_rep, SUM(unit_price * quantity) total_sales
FROM sales
WHERE countries ='Senegal'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*country with the highest profit of the fourth quarter in 2019*/
SELECT DISTINCT countries, SUM(profit) total_profit
FROM sales
WHERE months IN ('October','November','December') AND years = 2019
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1



