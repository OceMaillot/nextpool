with agregat as (

    select CLI.CODE_CLIENT,
           COM.CODE_COMMERCIAL,
           ART.CODE_ART,
           DAT.DATE_FAC,
           SUM(FAC.QUANTITE_FAC) AS QUANTITE_FAC,
           SUM(FAC.CHIFFRE_AFFAIRE_FAC) AS CHIFFRE_AFFAIRE_FAC
    from   {{ ref('d_client') }}        AS CLI,
           {{ ref('d_commercial') }}    AS COM,
           {{ ref('d_article') }}       AS ART,
           {{ ref('d_date') }}          AS DAT,
           {{ ref('f_facture') }}       AS FAC
    where  FAC.CODE_CLIENT = CLI.CODE_CLIENT
    and    FAC.CODE_COMMERCIAL = COM.CODE_COMMERCIAL
    and    FAC.CODE_ART = ART.CODE_ART
    and    FAC.DATE_FAC = DAT.DATE_FAC
    group by CLI.CODE_CLIENT,
           COM.CODE_COMMERCIAL,
           ART.CODE_ART,
           DAT.DATE_FAC

)

select * from agregat 