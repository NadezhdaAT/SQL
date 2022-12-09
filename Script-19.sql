---Сколько всего песен
SELECT * FROM Track t 
SELECT COUNT(*) FROM Track t2  

---Сколько всего клиентов
SELECT * FROM Customer c 
SELECT COUNT(*) FROM Customer c2 

--- Показать список клиентов из Бразилии
SELECT * FROM Customer c 
SELECT Country  FROM Customer c 
SELECT Country  FROM Customer c WHERE Country ='Brazil'
SELECT COUNT(*)  FROM Customer c WHERE Country ='Brazil'
SELECT FirstName, LastName, Country  FROM Customer c WHERE Country ='Brazil'

---Показать список клиентов из Южной и Северной Америки
SELECT * FROM Customer c 
SELECT FirstName, LastName, Country  FROM Customer c WHERE Country IN ('Argentina','Brazil','Canada', 'USA', 'Chile')

---Вывести фамилию, Имя и номер телефона клиентов, у которых номер начинается на '+44'
SELECT * FROM Customer c 
SELECT FirstName as 'Имя', LastName as 'Фамилия', Phone as 'Телефон' FROM Customer c2 WHERE phone LIKE '+44%'

---Вывести всех клиентов, кто использует почтовый ящик от yahoo (yahoo.com, yahoo.it, yahoo.nl и т.д.)
SELECT * FROM Customer c 
SELECT FirstName as 'Имя', LastName as 'Фамилия', Phone as 'Телефон', Email  FROM Customer c2 
WHERE Email  LIKE '%@%yahoo%.%'

---Найти все треки в жанре Jazz и вывести их в порядке уменьшения продолжительности (милисекунды)
SELECT * FROM Track t 
SELECT * FROM Genre g WHERE Name ='Jazz'
SELECT * FROM Track t WHERE GenreId =2

SELECT t.name, Milliseconds, GenreId  FROM Track t WHERE GenreId =2 ORDER BY Milliseconds DESC 

---Напишите скрипт добавления нового артиста
SELECT * FROM Artist a 
INSERT INTO Artist  (ArtistId, Name) VALUES ('276', 'Great Gatsby')
INSERT INTO Artist  (ArtistId, Name) VALUES ('277', 'Mike Shinoda')

--- Напишите скрипт добавления нового альбома. ArtistId должен быть равен только что созданному.
SELECT * FROM Album a 
INSERT INTO Album (AlbumId, Title, ArtistId, Column1) VALUES ('348', 'I am a great', '276', NULL)
INSERT INTO Album (AlbumId, Title, ArtistId, Column1) VALUES ('349', 'About You feat. blackbear', '277', NULL)
INSERT INTO Album (AlbumId, Title, ArtistId, Column1) VALUES ('350', 'FINE', '277', NULL)

--- Напишите скрипт переименования альбома. Поменять Title всем записям , где ArtistId равен 276.
SELECT * FROM Album a 
UPDATE Album
SET Title = 'Victory'
WHERE ArtistId=276

---Напишите скрипт удаления артиста, где в названии есть подстрока "feat."
SELECT * FROM Artist a 
SELECT * FROM Artist a WHERE Name LIKE '%Feat.%'
DELETE FROM Artist  WHERE Name LIKE '%Feat.%'

---Напишите скрипт удаления всех альбомов для артиста 276
DELETE FROM Artist  WHERE ArtistId=276

---Вывести название плейлиста, количество треков в нем и суммарную продолжительность песен в нем (миллисекунды).

SELECT * FROM PlaylistTrack pt 
SELECT * FROM Track t 
SELECT * FROM Playlist p 

SELECT p.Name as Name_Playlist, COUNT(t.Name) as Tracks, SUM (Milliseconds) as Milliseconds
FROM Track t 
JOIN PlaylistTrack pt 
ON t.TrackId = pt.TrackId 
JOIN Playlist p 
ON pt.PlaylistId =p.PlaylistId 
GROUP BY p.Name  


---Добавить к предыдущему заданию вывод продолжительности в секундах и вывод продолжительности в минутах
SELECT p.Name as Name_Playlist, COUNT(t.Name) as Tracks, SUM (Milliseconds/1000) as Seconds
FROM Track t 
JOIN PlaylistTrack pt 
ON t.TrackId = pt.TrackId 
JOIN Playlist p 
ON pt.PlaylistId =p.PlaylistId 
GROUP BY p.Name  


SELECT p.Name as Name_Playlist, COUNT(t.Name) as Tracks, SUM ((Milliseconds/1000)/60) as Minutes
FROM Track t 
JOIN PlaylistTrack pt 
ON t.TrackId = pt.TrackId 
JOIN Playlist p 
ON pt.PlaylistId =p.PlaylistId 
GROUP BY p.Name  


---Вывести название самого любимого трека. Это трек, который входит в максимальное число плейлистов


---Если таких треков несколько вывести их все

---Найти у какой группы больше всего песен. Вывести только одну такую группу
