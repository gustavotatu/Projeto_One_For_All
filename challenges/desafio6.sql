SELECT
CAST(MIN(pl.valor) AS DECIMAL(3, 2)) faturamento_minimo,
CAST(MAX(pl.valor) AS DECIMAL(3, 2)) faturamento_maximo,
CAST(AVG(pl.valor) AS DECIMAL(3, 2)) faturamento_medio,
CAST(SUM(pl.valor) AS DECIMAL(4, 2)) faturamento_total
FROM pessoas_usuarias pu
JOIN planos pl
ON pu.plano_id = pl.plano_id;