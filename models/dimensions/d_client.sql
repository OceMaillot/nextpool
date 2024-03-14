with d_client as (
    select distinct code_client as code_client , 
                    ccu as ccu ,
                    cl as cl ,
                    codestat_1_client as code_stat_client ,
                    cp_client as cp_client , 
                    nom_client as nom_client , 
                    enseigne as enseigne , 
                    pays as pays
    from {{source('google_sheets','factures') }} as factures
    order by code_client
)

select * from d_client