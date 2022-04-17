create database Spotify
use Spotify
create table Musics(
id int primary key identity,
name nvarchar(200),
totalSecond int,
albumsId int references Albums(id),
)
alter table Musics  add listnerCount int

create table Artists(
id int primary key identity,
name nvarchar(200)
)

create table Albums(
id int primary key identity,
name nvarchar(200),
musicCount int,
artistId int references Artists(id))

create view GetMusicInfo
as
select m.name 'Music name',m.totalSecond 'Total second',a.name 'Artist name',ab.name 'Album name' from Musics as m
join Albums as ab on m.albumsId = ab.id
join Artists as a on ab.artistId = a.id
select *from  GetMusicInfo

create view GetAlbumInfo
as
select * from Albums
select * from GetALbumInfo

alter procedure GetInfoMusic (@listenerCount int)
as
select Musics.name,Albums.name,Musics.listnerCount from Musics 
join Albums on Musics.AlbumsId = Albums.id
where @listenerCount < Musics.listnerCount
exec GetInfoMusic 1


