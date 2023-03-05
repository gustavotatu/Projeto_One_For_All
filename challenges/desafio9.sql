SELECT
COUNT(*) musicas_no_historico
FROM historico hi
JOIN pessoas_usuarias pu
ON pu.pessoa_usuaria_id = hi.pessoa_usuaria_id
GROUP BY pu.nome_pessoa_usuaria
HAVING pu.nome_pessoa_usuaria = 'Barbara Liskov';