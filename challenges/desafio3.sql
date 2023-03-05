SELECT pu.nome_pessoa_usuaria AS pessoa_usuaria, COUNT(*) AS musicas_ouvidas, ROUND(SUM(mu.duracao) / 60, 2) AS total_minutos
FROM historico AS hi
JOIN pessoas_usuarias AS pu
ON pu.pessoa_usuaria_id = hi.pessoa_usuaria_id
JOIN musicas AS mu
ON hi.musica_id = mu.musica_id
GROUP BY pu.nome_pessoa_usuaria
ORDER BY pu.nome_pessoa_usuaria;