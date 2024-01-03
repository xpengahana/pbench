SELECT
    A2.SS_CUSTOMER_SK "SS_CUSTOMER_SK",
    SUM(
        CASE
            WHEN (A0.SR_RETURN_QUANTITY IS NOT NULL) THEN (
                (A2.SS_QUANTITY - A0.SR_RETURN_QUANTITY) * A2.SS_SALES_PRICE
            )
            ELSE (A2.SS_QUANTITY * A2.SS_SALES_PRICE)
        END
    ) "SUMSALES"
FROM
    (
        (
            STORE_RETURNS A0
            INNER JOIN REASON A1 ON (A1.R_REASON_SK = A0.SR_REASON_SK)
        )
        INNER JOIN STORE_SALES A2 ON (A0.SR_TICKET_NUMBER = A2.SS_TICKET_NUMBER)
        AND (A0.SR_ITEM_SK = A2.SS_ITEM_SK)
    )
WHERE
    ('Did not get it on time' = A1.R_REASON_DESC)
GROUP BY
    A2.SS_CUSTOMER_SK
ORDER BY
    2 ASC,
    1 ASC
limit
    100;