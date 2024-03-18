WITH agregat AS (
    SELECT 
        CLI.CODE_CLIENT,
        COM.CODE_COMMERCIAL,
        ART.CODE_ART,
        DAT.DATE_FAC,
        COM.CODE_ETablissement,
        SUM(FAC.QUANTITE_FAC) AS QUANTITE_FAC,
        SUM(FAC.CHIFFRE_AFFAIRE_FAC) AS CHIFFRE_AFFAIRE_FAC
    FROM   
        {{ ref('f_facture') }} AS FAC
        INNER JOIN {{ ref('d_client') }} AS CLI 
        INNER JOIN {{ ref('d_commercial') }} AS COM 
        INNER JOIN {{ ref('d_article') }} AS ART 
        INNER JOIN {{ ref('d_date') }} AS DAT 

   Where FAC.CODE_CLIENT = CLI.CODE_CLIENT,
         FAC.CODE_COMMERCIAL = COM.CODE_COMMERCIAL,
         FAC.CODE_ART = ART.CODE_ART,
         FAC.DATE_FAC = DAT.DATE_FAC,
         Fact.code_etablissement = ETB.code_etablissement

    GROUP BY 
        CLI.CODE_CLIENT,
        COM.CODE_COMMERCIAL,
        ART.CODE_ART,
        DAT.DATE_FAC,
        COM.CODE_ETB
)

SELECT * FROM agregat