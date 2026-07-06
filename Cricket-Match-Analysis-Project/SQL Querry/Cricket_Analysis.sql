create database Cricket;
use Cricket;
show tables;

 -- Q1: Total matches played
SELECT 
    COUNT(*) AS Total_Match
FROM
    cricket_data;

-- Q2: Total matches played per season
SELECT 
    season, COUNT(*) AS season_matches
FROM
    cricket_data
GROUP BY season;

-- Q3: Most winning team
SELECT 
    winner, COUNT(*) AS wins
FROM
    cricket_data
GROUP BY winner
ORDER BY wins DESC
LIMIT 1;

-- Q4: Top 5 winning teams
SELECT 
    winner, COUNT(*) AS wins
FROM
    cricket_data
GROUP BY winner
ORDER BY wins DESC
LIMIT 5;

-- Q5: Team who wins both toss and match
SELECT 
    COUNT(*) AS toss_matches_win
FROM
    cricket_data
WHERE
    toss_won = winner;

-- Q6: batting vs bowling decision analysis who wins toss
SELECT 
    decision, COUNT(*) AS total
FROM
    cricket_data
GROUP BY decision;

-- Q7: Highest score (1st inning)
SELECT 
    first_inning_score AS high_score
FROM
    cricket_data
ORDER BY high_score DESC
LIMIT 1;

-- Q8: Lowest score (1st inning)
SELECT 
    MIN(first_inning_score) AS high_score
FROM
    cricket_data;

-- Q9: Highest run chase (2nd inning)
SELECT 
    MAX(second_inning_score) AS high_chase
FROM
    cricket_data;

-- Q10: Maximum time Player of the match
SELECT 
    pom, COUNT(*) AS Match_player
FROM
    cricket_data
GROUP BY pom
ORDER BY Match_player DESC
LIMIT 1;

-- Q11: Top 5 Player of the Match
SELECT 
    pom, COUNT(*) AS Match_player
FROM
    cricket_data
GROUP BY pom
ORDER BY Match_player DESC
LIMIT 5;

-- Q12: Home team performance
SELECT 
    home_team, COUNT(*) AS home_matches
FROM
    cricket_data
GROUP BY home_team;

-- Q13: Away team performance
SELECT 
    away_team, COUNT(*) AS home_matches
FROM
    cricket_data
GROUP BY away_team;

-- Q14: Venue who hosts maximum matches
SELECT 
    venue_name, COUNT(*) AS host_venue
FROM
    cricket_data
GROUP BY venue_name
ORDER BY host_venue DESC
LIMIT 1;

-- Q15: Matches where team won by chasing
SELECT 
    COUNT(*) AS chasing_win
FROM
    cricket_data
WHERE
    second_inning_score > first_inning_score;

-- Q16: Matches where team defended score
SELECT 
    COUNT(*) AS defend_score
FROM
    cricket_data
WHERE
    second_inning_score < first_inning_score;

-- Q17: Avg score per match
SELECT 
    AVG(first_inning_score) AS avg_1st,
    AVG(second_inning_score) AS avg_2nd
FROM
    cricket_data;

-- Q18: Close matches(difference < 10 runs)
SELECT 
    season, short_name
FROM
    cricket_data
WHERE
    (first_inning_score - second_inning_score) < 10
limit 10;

-- Q19: Team-wise win percentage
SELECT 
    winner,
    COUNT(*) * 100 / (SELECT 
            COUNT(*)
        FROM
            cricket_data) AS win_percentage
FROM
    cricket_data
GROUP BY winner
ORDER BY win_percentage DESC;