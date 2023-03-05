SELECT
mu.musica cancao,
COUNT(*) reproducoes
FROM historico hi
JOIN musicas mu
ON mu.musica_id = hi.musica_id
GROUP BY mu.musica_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;