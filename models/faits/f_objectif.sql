with f_objectif as (
    select code_commercial as code_commercial,
           nom_commercial as nom_commercial,
           TO_DATE(date_fac_, 'DD/MM/YYYY') AS date_fac,
           objectif as objectif
    FROM {{source('google_sheets', 'objectifs')}} AS "objectifs"

)

select * from f_objectif