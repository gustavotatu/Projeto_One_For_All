SELECT
ar.artista,
al.album
FROM artistas ar
JOIN albuns al
ON ar.artista_id = al.artista_id
WHERE artista = 'Elis Regina'
ORDER BY album;