with d_commercial as (
    select distinct code_etb as code_etb ,
                    code_commercial as code_commercial , 
                    nom_commercial as nom_commercial
    from {{source('google_sheets','factures') }} as factures
    order by code_commercial
)

select * from d_commercial