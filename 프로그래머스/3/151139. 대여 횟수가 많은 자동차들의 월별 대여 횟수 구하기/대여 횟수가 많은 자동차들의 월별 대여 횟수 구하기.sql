-- 코드를 입력하세요
SELECT
    EXTRACT(MONTH FROM S.START_DATE) AS MONTH,  -- 월을 숫자로 바로 추출
    S.CAR_ID,
    COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY S
JOIN (
    SELECT 
        CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
    WHERE DATE_FORMAT(START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
    GROUP BY CAR_ID
    HAVING COUNT(*) >= 5
) R ON S.CAR_ID = R.CAR_ID
WHERE DATE_FORMAT(S.START_DATE, '%Y-%m') BETWEEN '2022-08' AND '2022-10'
GROUP BY EXTRACT(MONTH FROM S.START_DATE), S.CAR_ID
ORDER BY EXTRACT(MONTH FROM S.START_DATE) ASC, S.CAR_ID DESC;

-- (CASE WHEN START_DATE >= 2022-08-01 AND
     --   END_DATE < 2022-09-01 THEN MONTH = 8,
      --  WHEN START_DATE >= 2022-09-01 AND
      --  END_DATE < 2022-10-01 THEN MONTH = 9,
      --  WHEN START_DATE >= 2022-10-01 AND
      --  END_DATE < 2022-11-01 THEN MONTH = 10
      --  END)