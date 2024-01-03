SELECT
    A1.C_LAST_NAME "C_LAST_NAME",
    A1.C_FIRST_NAME "C_FIRST_NAME",
    A0.CA_CITY "CA_CITY",
    A2.C2 "BOUGHT_CITY",
    A2.C0 "SS_TICKET_NUMBER",
    A2.C3 "EXTENDED_PRICE",
    A2.C5 "EXTENDED_TAX",
    A2.C4 "LIST_PRICE"
FROM
    (
        CUSTOMER_ADDRESS A0
        INNER JOIN (
            CUSTOMER A1
            INNER JOIN (
                SELECT
                    A4.SS_TICKET_NUMBER C0,
                    A4.SS_CUSTOMER_SK C1,
                    A3.CA_CITY C2,
                    SUM(A4.SS_EXT_SALES_PRICE) C3,
                    SUM(A4.SS_EXT_LIST_PRICE) C4,
                    SUM(A4.SS_EXT_TAX) C5
                FROM
                    (
                        CUSTOMER_ADDRESS A3
                        INNER JOIN (
                            (
                                (
                                    STORE_SALES A4
                                    INNER JOIN DATE_DIM A5 ON (A4.SS_SOLD_DATE_SK = A5.D_DATE_SK)
                                )
                                INNER JOIN STORE A6 ON (A4.SS_STORE_SK = A6.S_STORE_SK)
                            )
                            INNER JOIN HOUSEHOLD_DEMOGRAPHICS A7 ON (A4.SS_HDEMO_SK = A7.HD_DEMO_SK)
                        ) ON (A4.SS_ADDR_SK = A3.CA_ADDRESS_SK)
                    )
                WHERE
                    (A5.D_YEAR IN (2000, 2001, 2002))
                    AND (1 <= A5.D_DOM)
                    AND (A5.D_DOM <= 2)
                    AND (A6.S_CITY IN ('Midway', 'Fairview'))
                    AND (
                        (A7.HD_DEP_COUNT = 8)
                        OR (A7.HD_VEHICLE_COUNT = 3)
                    )
                GROUP BY
                    A4.SS_TICKET_NUMBER,
                    A4.SS_CUSTOMER_SK,
                    A4.SS_ADDR_SK,
                    A3.CA_CITY
            ) A2 ON (A2.C1 = A1.C_CUSTOMER_SK)
        ) ON (
            CAST(A1.C_CURRENT_ADDR_SK AS BIGINT) = A0.CA_ADDRESS_SK
        )
        AND (A0.CA_CITY <> A2.C2)
    )
ORDER BY
    1 ASC,
    5 ASC
limit
    100;