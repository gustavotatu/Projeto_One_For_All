SELECT
ar.artista,
al.album,
COUNT(*) pessoas_seguidoras
FROM artistas ar
JOIN albuns al
ON ar.artista_id = al.artista_id
JOIN seguidores se
ON ar.artista_id = se.seguindo_artista
GROUP BY ar.artista, al.album, se.seguindo_artista
ORDER BY pessoas_seguidoras DESC, artista, album;