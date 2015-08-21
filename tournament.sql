-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.


-- These lines were helpful when it came to testing out the code a lot for
-- debugging purposes. By dropping everything at the very beginning, I could
-- always guarantee that the database would contain the correct objects every
-- time I ran the "tournament.sql" file.

drop database tournament;
-- drop view current_standings;
-- drop view swiss_pair;
-- drop view ranking;
-- drop table players;
-- drop table matches;


create database tournament;
-- Will contain 2 tables for containing the main data and 3 views for
-- manipulation of that data.
\c tournament


create table players(
    id serial NOT NULL PRIMARY KEY UNIQUE,
    name text,
    wins integer NOT NULL,
    losses integer NOT NULL
);


create table matches(
    match_id serial NOT NULL PRIMARY KEY UNIQUE,
    round_number serial,
    player_one_id serial NOT NULL REFERENCES players (id),
    player_two_id serial NOT NULL REFERENCES players (id),
    winner_id serial NOT NULL REFERENCES players (id)
);


-- Quick view to keep track of where all the players are at.
create view current_standings as
    select
        id,
        name,
        wins,
        (wins + losses) as match_total
    from
        players
    order by
        wins;


-- ranking view will help build the swiss pairing by ordering players first by
-- how many wins they have and then by their id.
create view ranking as
    select
        id,
        name,
        wins,
        RANK() OVER (ORDER BY wins DESC, id ASC) as rank
    from
        players
    order by
        rank;

-- The swiss_pair view is created by joining the ranking view against itself
-- and matching up every player with the rank just following it.
create view swiss_pair as
    select
        a.id,
        a.name,
        b.id as opp_id,
        b.name as opp_win
    from
        ranking as a,
        ranking as b
    where
        a.id != b.id
        and
        a.rank = (b.rank - 1)
        and
        mod(a.rank, 2) = 1
    order by
        a.rank,
        a.id;
