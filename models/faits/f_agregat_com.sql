with calc_ca as (
    select code_commercial
          ,sum(chiffre_affaire_fac) as CA
          ,annee 
    from {{ref('f_agregat')}}
group by code_commercial
        ,annee
),
calc_obj as (
    select code_commercial
          ,sum(OBJECTIF) as objectif
          ,year(date_fac) as annee 
    from {{ref('f_objectif')}}
group by code_commercial
        ,year(date_fac)
)
    select a.code_commercial
      ,a.ca
      ,b.objectif
      ,a.annee
    from calc_ca a 
    inner join calc_obj b on a.code_commercial = b.code_commercial and a.annee=b.annee
