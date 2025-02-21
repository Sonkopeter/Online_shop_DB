WITH banks_ranked_by_transactions AS (
    SELECT
        o.buyer_id,
        p.bank_id,
        ROW_NUMBER() OVER (
            PARTITION BY o.buyer_id
            ORDER BY COUNT(*) DESC, MAX(p.payment_date) DESC -- дает рейтинг банку, в приоритете количество транзакций 
        ) AS bank_rank
    FROM Payment p
    	INNER JOIN "Order" o ON p.payment_id = o.payment_id
    GROUP BY o.buyer_id, p.bank_id
)
SELECT
    buyer_id,
    bank_id
FROM banks_ranked_by_transactions
WHERE bank_rank = 1;
