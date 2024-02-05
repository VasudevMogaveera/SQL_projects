SELECT * FROM sharktankproject.`shark tank dataas.2`;

-- Tortal Episodes
select max(`Ep. No.`) from `sharktankproject`.`shark tank dataas.2`;
select count(distinct `Ep. No.`) from `sharktankproject`.`shark tank dataas.2`;

-- Pitches
select count(distinct Brand) from `sharktankproject`.`shark tank dataas.2`;

-- Pitches Converted
select cast(sum(a.converted_not_converted) as float) /cast(count(*) as float) from (
select `Amount Invested lakhs` , case when `Amount Invested lakhs`>0 then 1 else 0 end as converted_not_converted from `sharktankproject`.`shark tank dataas.2`) a;
 
-- Total Male 
select sum(male) from `sharktankproject`.`shark tank dataas.2`;

-- Total Female 
select sum(female) from `sharktankproject`.`shark tank dataas.2`;

-- Gender ratio
select sum(female)/sum(male) from `sharktankproject`.`shark tank dataas.2`;

-- Total invested Amount
select sum(`Amount Invested lakhs`) from `sharktankproject`.`shark tank dataas.2`;

-- Avg Equity taken

-- Highest deal taken
select max(`Amount Invested lakhs`) from `sharktankproject`.`shark tank dataas.2`;

-- Higheest equity taken
select max(EquityTaken) from `sharktankproject`.`shark tank dataas.2`;

-- startups having at least women
select sum(a.female_count) startups having at least women from (
select female,case when female>0 then 1 else 0 end as female_count from `sharktankproject`.`shark tank dataas.2`) a

-- -- pitches converted having atleast ne women
select * from `sharktankproject`.`shark tank dataas.2`

SELECT SUM(b.female_count) FROM (
    SELECT a.*, CASE WHEN a.female > 0 THEN 1 ELSE 0 END AS female_count FROM (
        SELECT * FROM `sharktankproject`.`shark tank dataas.2` WHERE deal != 'No Deal') a) b;

select a.*, case when a.female>0 then 1 else 0 end as female_count from (
(select * from `sharktankproject`.`shark tank dataas.2` where deal!= 'No Deal')) a;
	
-- avg team members
select avg(teammembers) from sharktankproject.`shark tank dataas.2`;
    
-- amount invested per deal
select avg(a.amountinvestedlakhs) amount_invested_per_deal from
(select * from sharktankproject.`shark tank dataas.2` deal ! = 'No Deal') a

-- Avg age group of contestants 
select 'Avg', count('Avg') from sharktankproject.`shark tank dataas.2` group by 'Avg' order by 'cnt' desc

-- location group of contestants
select location,count(location) cnt from sharktankproject.`shark tank dataas.2` group by location order by 'cnt' desc

-- sector group of contestants
select sector,count(sector) 'cnt' from sharktankproject.`shark tank dataas.2` group by sector order by 'cnt' desc

-- partner deals
select partners,count(partners) 'cnt' from sharktankproject.`shark tank dataas.2`  where partners!='-' group by partners order by 'cnt' desc

-- making the matrix
select * from  sharktankproject.`shark tank dataas.2`

select 'Ashnner' as keyy,count(ashneeramountinvested) from sharktankproject.`shark tank dataas.2` where ashneeramountinvested is not null
select 'Ashnner' as keyy,count(ashneeramountinvested) from  sharktankproject.`shark tank dataas.2` where ashneeramountinvested is not null AND ashneeramountinvested!=0
SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED),AVG(C.ASHNEEREQUITYTAKENP) 
FROM (SELECT * FROM PROJECT..DATA  WHERE ASHNEEREQUITYTAKENP!=0 AND ASHNEEREQUITYTAKENP IS NOT NULL) C

select m.keyy,m.total_deals_present,m.total_deals,n.total_amount_invested,n.avg_equity_taken from
(select a.keyy,a.total_deals_present,b.total_deals from(
select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals_present from  sharktankproject.`shark tank dataas.2` where ashneeramountinvested is not null) a

inner join (
select 'Ashneer' as keyy,count(ashneeramountinvested) total_deals from  sharktankproject.`shark tank dataas.2`
where ashneeramountinvested is not null AND ashneeramountinvested!=0) b 

on a.keyy=b.keyy) m

inner join 
(SELECT 'Ashneer' as keyy,SUM(C.ASHNEERAMOUNTINVESTED) total_amount_invested,
AVG(C.ASHNEEREQUITYTAKENP) avg_equity_taken
FROM (SELECT * FROM sharktankproject.`shark tank dataas.2` WHERE ASHNEEREQUITYTAKENP!=0 AND ASHNEEREQUITYTAKENP IS NOT NULL) C) n
on m.keyy=n.keyy

-- which is the startup in which the highest amount has been invested in each domain/sector
select c.* from 
(select brand,sector,amountinvestedlakhs,rank() over(partition by sector order by amountinvestedlakhs desc) rnk 
from sharktankproject.`shark tank dataas.2`) c

where c.rnk=1









