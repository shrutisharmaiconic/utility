-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO

-- CREATE VIEW [lum].[quickview] AS 

-- SELECT
-- 	ia.[ArtistName] AS [ArtistsName],
-- 	ic.[ArtistName] AS [Artist],
--  datepart(week, ia.CreatedOn) AS [Week],
--  DATENAME(month, ia.CreatedOn) AS [Month],
--  DATENAME(year, ia.CreatedOn) AS [Year]


-- FROM 
-- [lum].[Artist] ia LEFT JOIN [iconic].[Artist] ic  ON ia.IconicArtistID = ic.ID 

-- GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [lum].[quickview] AS 

SELECT
isd.ISRC,
isd.CountryID,
isd.WeekID,
isd.InvocationID,
isc.MetricsName,
ic.[Year],
ic.StartDate,
ic.EndDate,
con.CountryName,
song.SongID,
son.ArtistID,
la.ArtistName,
la.IconicArtistID,
ico.ArtistName AS [OriginalArtist]

FROM 
[lum].[ISRCData] isd LEFT JOIN [lum].[ISRCMetrics] isc  ON isd.ISRC = isc.ISRC
LEFT JOIN [iconic].[Week] ic ON isd.WeekID = ic.ID
LEFT JOIN [lum].Country con ON isd.CountryID= con.ID
LEFT JOIN [lum].[SongISRC] song ON isd.ISRC = song.ISRC
LEFT JOIN [lum].[Song] son ON song.SongID=son.ID
LEFT JOIN [lum].Artist la ON son.ArtistID = la.ID 
LEFT JOIN [iconic].Artist ico ON ico.ID = la.IconicArtistID
 

GO
