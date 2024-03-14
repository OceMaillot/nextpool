with f_facture as (
    select code_client as code_client,
           code_art as code_art,
           code_commercial as code_commercial,
           TO_DATE(date_fac, 'DD/MM/YYYY') AS date_fac,
           qte_fac as quantite_fac,
           ca_ligne as chiffre_affaire_fac
    FROM {{source('google_sheets', 'factures')}} AS factures

)

select * from f_facture