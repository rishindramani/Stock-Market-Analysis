-- create schema Assignment;
-- use Assignment;

/*The Stock price data provided is from 1-Jan-2015 to 31-July-2018 for six stocks: 
Eicher Motors, Hero, Bajaj Auto, TVS Motors, Infosys and TCS.

A new schema called 'Assignment' is created.
The CSV files are imported in MySQL, naming the tables as the name of the stocks. 

*/

-- ***************Part 1******************************************************

/* Create a new table named 'bajaj1' 
containing the date, close price, 20 Day MA and 50 Day MA from table bajaj auto (This has to be done for all 6 stocks)
*/

-- STR_TO_DATE() function is used for conversion of Date from type text to standard date format

#                                             bajaj1

create view t1 as(                                 --  view to convert date to standard format from text type
Select STR_TO_DATE(Date,'%d-%M-%Y') as Date,           
`Close Price` from `bajaj auto`
order by Date ASC);

 
create view t2 as(                                -- view to introduce new column `introw` to store current row no 
Select Date,`Close Price`,
ROW_NUMBER() OVER () AS intRow,    
if(ROW_NUMBER() OVER ()>19,                --  to set previous 19 rows moving average as null
AVG(`Close Price`) OVER (ROWS 19 PRECEDING),NULL)MA20,   -- window function to calculate 20 and 50 day moving averages
if(ROW_NUMBER() OVER ()>49,						--  to set previous 49 rows moving average as null
AVG(`Close Price`) OVER (ROWS 49 PRECEDING),NULL)MA50
from t1
order by Date ASC);


create table bajaj1 as(		   -- Create table 'bajaj1' containing the date, close price, 20 Day MA and 50 Day MA. 
Select Date,`Close Price`,
MA20 as `20 Day MA`,MA50 as `50 Day MA`
from t2);

# select * from bajaj1;


#									eicher1

drop view t1;      --  remove previously created view t1
drop view t2;      --  remove previously created view t2

create view t1 as(                         --  view to convert date to standard format from text type
Select STR_TO_DATE(Date,'%d-%M-%Y') as Date,
`Close Price` from `eicher motors`
order by Date ASC);


create view t2 as(				-- view to introduce new column `introw` to store current row no 
Select Date,`Close Price`,
ROW_NUMBER() OVER () AS intRow,
if(ROW_NUMBER() OVER ()>19,					--  to set previous 19 rows moving average as null
AVG(`Close Price`) OVER (ROWS 19 PRECEDING),NULL)MA20,   -- window function to calculate 20 and 50 day moving averages
if(ROW_NUMBER() OVER ()>49,						--  to set previous 49 rows moving average as null
AVG(`Close Price`) OVER (ROWS 49 PRECEDING),NULL)MA50
from t1
order by Date ASC);


create table eicher1 as(       -- Create table 'eicher1' containing the date, close price, 20 Day MA and 50 Day MA.
Select Date,`Close Price`,
MA20 as `20 Day MA`,MA50 as `50 Day MA`
from t2);

#select * from eicher1;

#									hero1

drop view t1;      --  remove previously created view t1
drop view t2;      --  remove previously created view t2

create view t1 as(							--  view to convert date to standard format from text type
Select STR_TO_DATE(Date,'%d-%M-%Y') as Date,
`Close Price` from `hero motocorp`
order by Date ASC);


create view t2 as(					-- view to introduce new column `introw` to store current row no 
Select Date,`Close Price`,
ROW_NUMBER() OVER () AS intRow,
if(ROW_NUMBER() OVER ()>19,			--  to set previous 19 rows moving average as null
AVG(`Close Price`) OVER (ROWS 3 PRECEDING),NULL)MA20,    -- window function to calculate 20 and 50 day moving averages
if(ROW_NUMBER() OVER ()>49,			--  to set previous 49 rows moving average as null
AVG(`Close Price`) OVER (ROWS 5 PRECEDING),NULL)MA50
from t1
order by Date ASC);


create table hero1 as(		-- Create table 'hero1' containing the date, close price, 20 Day MA and 50 Day MA.
Select Date,`Close Price`,
MA20 as `20 Day MA`,MA50 as `50 Day MA`
from t2);

#select * from hero1;

#										infosys1

drop view t1;    --  remove previously created view t1
drop view t2;    --  remove previously created view t2


create view t1 as(				--  view to convert date to standard format from text type
Select STR_TO_DATE(Date,'%d-%M-%Y') as Date,
`Close Price` from `infosys`
order by Date ASC);


create view t2 as(				-- view to introduce new column `introw` to store current row no 
Select Date,`Close Price`,
ROW_NUMBER() OVER () AS intRow,
if(ROW_NUMBER() OVER ()>19,     --  to set previous 19 rows moving average as null
AVG(`Close Price`) OVER (ROWS 19 PRECEDING),NULL)MA20,   -- window function to calculate 20 and 50 day moving averages
if(ROW_NUMBER() OVER ()>49,             --  to set previous 49 rows moving average as null
AVG(`Close Price`) OVER (ROWS 49 PRECEDING),NULL)MA50
from t1
order by Date ASC);


create table infosys1 as(		-- Create table 'infosys1' containing the date, close price, 20 Day MA and 50 Day MA.
Select Date,`Close Price`,
MA20 as `20 Day MA`,MA50 as `50 Day MA`
from t2);

#select * from infosys1;


#									tcs1

drop view t1;   --  remove previously created view t1
drop view t2;   --  remove previously created view t2


create view t1 as(            --  view to convert date to standard format from text type
Select STR_TO_DATE(Date,'%d-%M-%Y') as Date,
`Close Price` from `tcs`
order by Date ASC);


create view t2 as(					-- view to introduce new column `introw` to store current row no 
Select Date,`Close Price`,
ROW_NUMBER() OVER () AS intRow,
if(ROW_NUMBER() OVER ()>19,			--  to set previous 19 rows moving average as null
AVG(`Close Price`) OVER (ROWS 19 PRECEDING),NULL)MA20,   -- window function to calculate 20 and 50 day moving averages
if(ROW_NUMBER() OVER ()>49,				--  to set previous 49 rows moving average as null
AVG(`Close Price`) OVER (ROWS 49 PRECEDING),NULL)MA50
from t1
order by Date ASC);


create table tcs1 as(	        -- Create table 'tcs1' containing the date, close price, 20 Day MA and 50 Day MA.
Select Date,`Close Price`,
MA20 as `20 Day MA`,MA50 as `50 Day MA`
from t2);

#select * from tcs1;


#									tvs1

drop view t1; 		--  remove previously created view t1
drop view t2;		--  remove previously created view t2


create view t1 as(         		--  view to convert date to standard format from text type
Select STR_TO_DATE(Date,'%d-%M-%Y') as Date,
`Close Price` from `tvs motors`
order by Date ASC);


create view t2 as(					-- view to introduce new column `introw` to store current row no 
Select Date,`Close Price`,
ROW_NUMBER() OVER () AS intRow,
if(ROW_NUMBER() OVER ()>19,				--  to set previous 19 rows moving average as null
AVG(`Close Price`) OVER (ROWS 3 PRECEDING),NULL)MA20,   -- window function to calculate 20 and 50 day moving averages
if(ROW_NUMBER() OVER ()>49, 			--  to set previous 49 rows moving average as null
AVG(`Close Price`) OVER (ROWS 5 PRECEDING),NULL)MA50
from t1
order by Date ASC);


create table tvs1 as(		     -- Create table 'tvs1' containing the date, close price, 20 Day MA and 50 Day MA.
Select Date,`Close Price`,
MA20 as `20 Day MA`,MA50 as `50 Day MA`
from t2);

#select * from tvs1;

drop view t1;    --  remove previously created view t1
drop view t2;	 --  remove previously created view t2


-- ***************Part 2******************************************************

/* Create a master table containing the date and close price of all the six stocks.
 (Column header for the price is the name of the stock)
*/

create table mastertable as(      
SELECT b.Date,b.`Close Price` as Bajaj, 
e.`Close Price`as Eicher, 
h.`Close Price` as Hero,
 i.`Close Price` as Infosys,
tcs1.`Close Price` as TCS, 
t.`Close Price` as TVS
FROM `bajaj1` as b LEFT JOIN `eicher1` as e ON b.Date= e.Date   -- LEFT JOIN joins two tables and fetches rows 
LEFT JOIN `hero1` as h ON e.date = h.date			 -- based on a condition, which is matching in both the tables and the 
LEFT JOIN `infosys1` as i ON h.date = i.date 			     -- unmatched rows will also be available from the table 
LEFT JOIN `tcs1` ON i.date = tcs1.date					     -- written before the JOIN clause.
LEFT JOIN `tvs1` as t ON tcs1.date = t.date);

#select * from mastertable;


-- ***************Part 3******************************************************

/* Use the tables created in Part(1) to generate buy and sell signal.  
Store this in another table named 'bajaj2'. Perform this operation for all stocks.
*/

/*When the shorter-term moving average crosses above the longer-term moving average,
 it is a signal to BUY, as it indicates that the trend is shifting up. 
On the opposite when the shorter term moving average crosses below the longer term moving average, 
it is a signal to SELL, as it indicates the trend is shifting down. 

***************
A signal is generated only when the moving averages cross each other.
Merely being above or below is not sufficient to generate a signal.
For example, if in continuos dates 20 day moving average is greater than 50 day moving average
then signal is 'hold' but 
if on previous date 20 day moving average is greater than 50 day moving average 
and the next day it becomes lower than 50 day becoming average then signal is generated to sell the stock
Similarly, if on previous date 20 day moving average is less than 50 day moving average 
and the next day it becomes greater than 50 day becoming average then signal is generated to buy the stock
In all other cases, it is advised to hold.
*/
/* The LAG() function is used in tables bajaj2,eicher2,hero2,infosys2,tcs2 and tvs2
 to get value from row that precedes the current row 
 and check the crossing over of moving averages
*/
#											bajaj2

create table bajaj2 as(
SELECT Date,`Close Price`,
if(`20 Day MA`>`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING)< lag(`50 Day MA`) -- checks the previous values of moving averages (BUY SIGNAL)
OVER (ROWS 1 PRECEDING)),"Buy",								-- for crossing over of `20 Day Ma` and `50 Day Ma`
if(`20 Day MA`<`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING) > lag(`50 Day MA`) --  checks the previous values of moving averages (SELL SIGNAL)
OVER (ROWS 1 PRECEDING)),"Sell","Hold"))`Signal`			--  for crossing over of `20 Day Ma` and `50 Day Ma`
from bajaj1);

#select * from bajaj2;


#									eicher2

create table eicher2 as(
SELECT Date,`Close Price`,
if(`20 Day MA`>`50 Day MA` and
 (lag(`20 Day MA`) OVER (ROWS 1 PRECEDING)< lag(`50 Day MA`) 
 OVER (ROWS 1 PRECEDING)),"Buy",
 if(`20 Day MA`<`50 Day MA` and 
 (lag(`20 Day MA`) OVER (ROWS 1 PRECEDING) > lag(`50 Day MA`) 
 OVER (ROWS 1 PRECEDING)),"Sell","Hold"))`Signal`
from eicher1);

#select * from eicher2;


#										hero2

create table hero2 as(
SELECT Date,`Close Price`,
if(`20 Day MA`>`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING)< lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Buy",
if(`20 Day MA`<`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING) > lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Sell","Hold"))`Signal`
from hero1);

#select * from hero2;

#										infosys2					

create table infosys2 as(
SELECT Date,`Close Price`,
if(`20 Day MA`>`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING)< lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Buy",
if(`20 Day MA`<`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING) > lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Sell","Hold"))`Signal`
from infosys1);

#select * from infosys2;

#												tcs2				
create table tcs2 as(
SELECT Date,`Close Price`,
if(`20 Day MA`>`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING)< lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Buy",
if(`20 Day MA`<`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING) > lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Sell","Hold"))`Signal`
from tcs1);

#select * from tcs2;

#												tvs2

create table tvs2 as(SELECT Date,`Close Price`,
if(`20 Day MA`>`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING)< lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Buy",
if(`20 Day MA`<`50 Day MA` and 
(lag(`20 Day MA`) OVER (ROWS 1 PRECEDING) > lag(`50 Day MA`) 
OVER (ROWS 1 PRECEDING)),"Sell","Hold"))`Signal`
from tvs1);

#select * from tvs2;

-- ***************Part 4******************************************************

/* Create a User defined function, that takes the date as input and 
returns the signal for that particular day (Buy/Sell/Hold) for the Bajaj stock
*/

DELIMITER |
CREATE FUNCTION return_signal(input_date DATE)     -- date as parameter in User defined function
  RETURNS VARCHAR(4)
   DETERMINISTIC
    BEGIN
     DECLARE signal_value VARCHAR(4);
        select `Signal` from bajaj2 
        where `Date`=input_date into signal_value;
     RETURN signal_value;
    END|

select return_signal(Date) as `Signal` from bajaj2   -- function returning signal for particular day
where `Date`='2015-06-02';                           -- particular date can be specified in where clause














