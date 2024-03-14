with d_article as (
    select distinct code_art as code_art, 
                    code_branche as code_branche , 
                    code_sousbranche as code_sous_branche , 
                    code_famille_1 as code_famille , 
                    designation as designation , 
                    libelle_sousbranche as libelle_sous_branche , 
                    libelle_famille_1_ as libelle_famille
    from {{source('google_sheets','factures') }} as factures
    order by code_art
)

select * from d_article