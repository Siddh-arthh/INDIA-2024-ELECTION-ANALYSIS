select 
	distinct count (parliament_constituency) as TotalSeats
from constituencywise_results

-- what is the total no. of seats available for elections in each state?

select 
	s.State,
	count(distinct cd.constituency_id) as TotalSeats
from constituencywise_details as cd
inner join constituencywise_results as cr
on cd.Constituency_ID=cr.Constituency_ID
inner join statewise_results as sr
on cr.Parliament_Constituency=sr.Parliament_Constituency
inner join states as s
on s.State_ID=sr.State_ID
group by s.State
order by TotalSeats desc



-- TOTAL SEATS WON BY NDA ALLIANCE
SELECT 
    SUM(CASE 
        WHEN party IN (
            'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
        ) THEN [Won]
        ELSE 0
    END) AS Total_Seats_Won_by_NDA
FROM partywise_results;


-- SEATS WON BY NDA ALIANCE PARTIES

SELECT
	PARTY AS Party_name,
	won as Seats_won
from partywise_results 
where party IN (
            'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
       )
order by seats_won desc

-- TOTAL SEATS WON BY I.N.D.I.A  ALLIANCE
 SELECT 
    SUM(CASE 
        WHEN party IN (
            'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
            'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
            'Viduthalai Chiruthaigal Katchi - VCK'
        ) THEN [Won]
        ELSE 0
    END) AS Total_Seats_Won_by_INDI_Alliance
FROM partywise_results;



-- SEATS WON BY I.N.D.I.A ALLIANCE

SELECT 
	party as Party_name,
	won as Seats_won
from partywise_results
where party in(
			'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
            'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
            'Viduthalai Chiruthaigal Katchi - VCK'
        ) 
order by Seats_won desc;


-- ADD NEW COLUMN FIELD IN TABLE partywise_results TO GET PARTY ALLIANZ AS NDA, I.N.D.I.A & OTHER

ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

UPDATE partywise_results
set party_alliance= 'I.N.D.I.A'
WHERE Party in ( 
	
			'Indian National Congress - INC',
            'Aam Aadmi Party - AAAP',
            'All India Trinamool Congress - AITC',
            'Bharat Adivasi Party - BHRTADVSIP',
            'Communist Party of India  (Marxist) - CPI(M)',
            'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
            'Communist Party of India - CPI',
            'Dravida Munnetra Kazhagam - DMK',
            'Indian Union Muslim League - IUML',
            'Jammu & Kashmir National Conference - JKN',
            'Jharkhand Mukti Morcha - JMM',
            'Kerala Congress - KEC',
            'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
            'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
            'Rashtriya Janata Dal - RJD',
            'Rashtriya Loktantrik Party - RLTP',
            'Revolutionary Socialist Party - RSP',
            'Samajwadi Party - SP',
            'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
            'Viduthalai Chiruthaigal Katchi - VCK'
        );

UPDATE partywise_results
set party_alliance= 'NDA'
WHERE Party in (
	'Bharatiya Janata Party - BJP',
            'Telugu Desam - TDP',
            'Janata Dal  (United) - JD(U)',
            'Shiv Sena - SHS',
            'AJSU Party - AJSUP',
            'Apna Dal (Soneylal) - ADAL',
            'Asom Gana Parishad - AGP',
            'Hindustani Awam Morcha (Secular) - HAMS',
            'Janasena Party - JnP',
            'Janata Dal  (Secular) - JD(S)',
            'Lok Janshakti Party(Ram Vilas) - LJPRV',
            'Nationalist Congress Party - NCP',
            'Rashtriya Lok Dal - RLD',
            'Sikkim Krantikari Morcha - SKM'
       );

UPDATE partywise_results 
set party_alliance= 'Other'
where party_alliance is null




--------------------------------------------------------------
select 
	party_alliance,
	sum(won) as Seats_won
from partywise_results
group by party_alliance;
------------------------------------------------------------------------------------------------------------------------------------------------------------------------


-- WINNING CANDIADATE'S NAME, THEIR PARTY NAME, TOTAL VOTES, 
--AND MARGIN OF VICTORY FOR A SPECIFIC STATE AND CONSTITUENCY.
select 
	cr.winning_candidate,
	cr.Constituency_Name,
	pr.party,
	cr.total_votes,
	cr.margin,
	s.state
from constituencywise_results as cr
inner join partywise_results as pr
on pr.Party_ID=cr.Party_ID
inner join statewise_results as sr
on cr.Constituency_Name=sr.Constituency
inner join states as s
on s.State_ID=sr.State_ID
where Constituency_Name='Guntur'
---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- what is the distribution of EVM votes versus postal votes for candidates in a specific constituency
select
	cd.candidate,
	cd.evm_votes,
	cd.postal_votes,
	cd.total_votes,
	cr.constituency_name
from constituencywise_details as cd
inner join constituencywise_results as cr
on cd.Constituency_ID=cr.Constituency_ID
where cr.Constituency_Name='Gwalior'
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- WHICH PARTY WON THE MOST SEATS IN A STATE, AND HOW MANY SEATS DID EACH PARTY WIN:
SELECT 
	p.party,
	count(cr.constituency_id) as seats_won
from 
	constituencywise_results as cr 
join 
	partywise_results p on cr.party_ID=p.party_ID
join 
	statewise_results as sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join 
	states as s on sr.State_ID=s.State_ID
where s.State='Telangana'
group by 
	p.Party
order by 
	seats_won desc

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- WHAT IS THE TOTAL NUMBER OF SEATS WON BY EACH PARTY ALLIANCE (I.N.D.I.A, NDA AND OTHER) 
-- IN EACH STATE FOR THE INDIA ELECTIONS 2024.

select 
	s.state,
	SUM( case when pr.party_alliance= 'NDA' THEN 1 ELSE 0 END) AS NDA,
	SUM( CASE WHEN pr.party_alliance='I.N.D.I.A' THEN 1 ELSE 0 END) AS 'I.N.D.I.A',
	SUM( CASE WHEN pr.party_alliance= 'Other' then 1 else 0 end) as Others
from
	partywise_results as pr
join constituencywise_results as cr  on pr.Party_ID=cr.Party_ID
join statewise_results as sr on sr.Parliament_Constituency=cr.Parliament_Constituency
join states as s on sr.State_ID=s.State_ID
group by s.State;
--------------------------------------------------------------------------------------------------------------------------------------------------------
-- WHICH CANDIDATE RECEIVED THE HIGHEST NUMBER OF EVM VOTES IN EACH CONSTITUENCY (TOP 10)

SELECT TOP 10
	cd.candidate,
	s.state,
	cr.constituency_name,
	cd.Party,
	cd.evm_votes
from constituencywise_details as cd
join constituencywise_results as cr on cd.Constituency_ID=cr.Constituency_ID
join statewise_results as sr on cr.Parliament_Constituency=sr.Parliament_Constituency
join states as s on sr.State_ID=s.State_ID
order by EVM_Votes desc
-------------------------------------------------------------------------------------------------------------------------------------------------------

-- WHICH CANDIDATE WON AND WHICH CANDIDATE WAS THE RUNNER-UP IN EACH CONSTITUENCY OF STATE FOR 2024 ELECTIONS?
select
	cr.Constituency_Name,
	sr.leading_candidate,
	sr.trailing_candidate
from 
	statewise_results as sr 
join 
	constituencywise_results as cr 
	on cr.Parliament_Constituency=sr.Parliament_Constituency
join 
	states as s 
	on sr.State_ID=s.State_ID
where 
	s.state='madhya pradesh'
-----------------------------------------------------------------------------------
with rankedCandidates as (
SELECT
	cd.Constituency_ID,
	cd.Candidate,
	cd.Party,
	cd.EVM_Votes,
	cd.Postal_Votes,
	cd.EVM_Votes + cd.Postal_Votes AS Total_Votes,
	ROW_NUMBER() OVER (PARTITION BY cd.Constituency_ID ORDER BY cd.EVM_Votes + cd.Postal_Votes DESC) AS VoteRank
FROM
	constituencywise_details cd
JOIN
	constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
JOIN
	statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN
	states s ON sr.State_ID = s.State_ID
WHERE
	s.State = 'Maharashtra'
)

SELECT
	cr.Constituency_Name,
	MAX(CASE WHEN rc.VoteRank = 1 THEN rc.Candidate END) AS Winning_Candidate,
	MAX(CASE WHEN rc.VoteRank = 2 THEN rc.Candidate END) AS Runnerup_Candidate
FROM
	RankedCandidates rc
JOIN
	constituencywise_results cr ON rc.Constituency_ID = cr.Constituency_ID
GROUP BY
	cr.Constituency_Name
ORDER BY
	cr.Constituency_Name;

-- FOR THE STATE OF MAHARASHTRA, WHAT ARE THE TOTAL NUMBER OF SEATS, TOTAL NUMBER OF CANDIDATE, TOTAL NUMBER OF PARTIES, TOTAL VOTES AND THE BREAKDOWN OF EVM AND POSTAL VOTES

























