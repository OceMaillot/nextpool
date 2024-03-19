WITH agregat_com AS (
       SELECT YEAR(DATE_FAC) AS ANNEE
        , code_commercial
        , CODE_ETABLISSEMENT  
        , SUM(objectif) as objectif
        , SUM(CHIFFRE_AFFAIRE_FAC) as CHIFFRE_AFFAIRE_FAC      
from (
    SELECT 
        FAC.CODE_COMMERCIAL,
        FAC.DATE_FAC,
        SUM(FAC.chiffre_affaire_fac) AS chiffre_affaire_fac,
        CODE_ETABLISSEMENT,
        OBJ.objectif
    FROM   
        {{ ref('f_agregat')}} AS FAC
    INNER JOIN {{ ref('f_objectif')}} AS OBJ ON OBJ.OBJECTIF = OBJECTIF
    GROUP BY 
        COM.CODE_COMMERCIAL,
        DAT.DATE_FAC,
        OBJ.objectif,
        COM.CODE_ETABLISSEMENT
) AGR
GROUP BY YEAR(DATE_FAC)
        , CODE_COMMERCIAL
        , code_etablissement
)
SELECT * FROM agregat_com
ORDER BY ANNEE DESC

SELECT * FROM   {{ ref('f_agregat')}} AS FAC

SELECT * FROM {{ ref('f_objectif')}} 