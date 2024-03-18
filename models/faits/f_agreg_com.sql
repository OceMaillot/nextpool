with agregat_com as (

    select COM.CODE_COMMERCIAL,
           DAT.DATE_FAC,
           SUM(FAC.QUANTITE_FAC) AS QUANTITE_FAC,
           SUM(FAC.CHIFFRE_AFFAIRE_FAC) AS CHIFFRE_AFFAIRE_FAC
           SUM(OBJ.OBJECTIF) as OBJECTIF
    from   {{ ref('d_commercial') }}    AS COM,
           {{ ref('d_date') }}          AS DAT,
           {{ ref('f_facture') }}       AS FAC
           {{ ref('f_objectif')}}       AS OBJ
    where  FAC.CODE_COMMERCIAL = COM.CODE_COMMERCIAL
    and    FAC.DATE_FAC = DAT.DATE_FAC    
    group by COM.CODE_COMMERCIAL,
             DAT.DATE_FAC

)

select * from agregat_com