WITH d_date AS (
    SELECT DISTINCT TO_DATE(date_fac, 'DD/MM/YYYY') AS date_fac
    FROM {{source('google_sheets', 'factures')}} AS factures
    ORDER BY date_fac
)

SELECT * FROM d_date