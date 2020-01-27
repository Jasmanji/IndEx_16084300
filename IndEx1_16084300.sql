/*
Write SQL queries that can be executed on the chinook.sqlite database to provide answers the following questions.
Save your SQL to this .sql file. Do not include the query results.
In PyCharm you can right click on the file name in the Project pane and select Refactor > Rename, and replace STU_NUM with your student number.
*/

--1. Which employees have 'IT' in their job title? (list their EmployeeId, FirstName, LastName and Title)
SELECT employeeid, FirstName, LastName, Title
FROM Employee
WHERE Title LIKE '%IT%';

--2. List the names of all Artists and the titles of their albums
SELECT Name, Title
FROM Artist
        JOIN Album ON Artist.ArtistID = Album.ArtistID
        ORDER BY Name ASC;

--3. Which track(s) features the greatest number of times in playlists and how many times is it/are they included? (list Track name and the total number of appearances in playlists).
SELECT Track.Name, COUNT(PlaylistTrack.TrackID) AS NumberOfApperances
FROM PlaylistTrack
        LEFT JOIN Track ON PlaylistTrack.TrackID = Track.TrackID
        GROUP BY Name
        ORDER BY COUNT(PlaylistTrack.TrackID) DESC;

--4. Provide a list of the number of tracks by each artist
SELECT Artist.Name, COUNT(Track.AlbumId) AS NumberOfTracks
FROM Track
        JOIN Album ON Track.AlbumId = Album.AlbumId
        JOIN Artist ON Album.ArtistId = Artist.ArtistId
        GROUP BY Artist.Name
        ORDER BY Artist.Name ASC;

--5. How much money has been invoiced for the artist Deep Purple? (For this you can create two queries, one that shows the line item from the invoices and the total amount per line, and another that sums the totals from each line)

SELECT Artist.Name, SUM(InvoiceLine.UnitPrice) AS InvoicedTotal
FROM InvoiceLine
        JOIN Track ON InvoiceLine.TrackId = Track.TrackId
        JOIN Album ON Track.AlbumId = Album.AlbumId
        JOIN Artist ON Album.ArtistId = Artist.ArtistId
WHERE Artist.Name LIKE '%Deep Purple%'
