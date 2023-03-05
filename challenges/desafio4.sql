SELECT
pu.nome_pessoa_usuaria pessoa_usuaria,
IF(MAX(YEAR(data_reproducao)) > 2020, 'Ativa', 'Inativa') status_pessoa_usuaria
FROM historico hi
LEFT JOIN pessoas_usuarias pu
ON pu.pessoa_usuaria_id = hi.pessoa_usuaria_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria;
