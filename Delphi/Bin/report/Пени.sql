[dsRates]
select
  rs.rate_date
  ,r.refinancing_rate
from (select 
        max(rate_date) rate_date
      from
        fdc_nsi_refinancing_rate_lst
      where
        rate_date <= :Date_From
      union
      select 
        rate_date
      from
        fdc_nsi_refinancing_rate_lst
      where
        rate_date > :Date_From
        and rate_date <= :Date_To
      ) rs
      ,fdc_nsi_refinancing_rate_lst r
where 
  rs.rate_date = r.rate_date
