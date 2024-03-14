with d_pays as (
    select distinct pays as pays
    from {{source('google_sheets','factures') }} as factures
    order by pays
)

select * from d_pays