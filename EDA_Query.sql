#Most expensive brands
select Brand, avg(Price) Avg_price
from auction_export.auction_export_cleaned
group by Brand
order by Avg_price desc
limit 5;


#Cheapest brands
select Brand, avg(Price) Avg_price
from auction_export.auction_export_cleaned
group by Brand
order by Avg_price asc
limit 5;

#Count of cars from each year whose price is above the average price
select Year, count(Price) as Car_count
from auction_export.auction_export_cleaned
where Price > (select avg(Price) from auction_export.auction_export_cleaned)
group by Year
order by Car_count desc;


#Percentage of cars from each year whose price is above the average price
Select Year, (COUNT(CASE WHEN Price > (SELECT AVG(Price) FROM auction_export.auction_export_cleaned) Then 1 END) * 100.0 / COUNT(*)) AS Percent
From auction_export.auction_export_cleaned
Group by Year
order by Percent desc;


#Prices by different body types
select Body, avg(Price) Avg_price
from auction_export.auction_export_cleaned
group by Body
order by Avg_price desc;


#Most expensive car in the data
select *
from auction_export.auction_export_cleaned
where Price = (select max(Price) from auction_export.auction_export_cleaned);


#Cheapest car in the data
select *
from auction_export.auction_export_cleaned
where Price = (select min(Price) from auction_export.auction_export_cleaned);


#Comparing prices of the most recent and the oldest car
select Year, avg(Price) as Price
from auction_export.auction_export_cleaned
where Year = (select max(Year) from auction_export.auction_export_cleaned) or Year = (select min(Year) from auction_export.auction_export_cleaned)
group by Year;


#Comparing prices of the car with the most milage and the one with the least
select Milage, Price
from auction_export.auction_export_cleaned
where Milage = (select max(Milage) from auction_export.auction_export_cleaned) or Milage = (select min(Milage) from auction_export.auction_export_cleaned);

