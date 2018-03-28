CREATE DATABASE reverseProxy;
CREATE TABLE ThreatList (
    Ip varchar(20),
    LastReport datetime,
    Count int(11)
)

CREATE TABLE ThreatList (
    Ip varchar(20),
    LastReport datetime
)
CREATE TRIGGER threatcount BEFORE UPDATE
ON ThreatList FOR EACH ROW
BEGIN
IF NEW.Count > 4 THEN
    INSERT INTO BlackList VALUES (NEW.ip , NEW.LastReport) ON DUPLICATE KEY UPDATE `LastReport` = NOW();
END IF;
END