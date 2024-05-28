DROP DATABASE IF EXISTS `db_hungygame`;
CREATE DATABASE IF NOT EXISTS `db_hungygame` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

USE `db_hungygame`;

CREATE TABLE t_user(
   useEmailAdress VARCHAR(50),
   useNom VARCHAR(50),
   usePassword VARCHAR(50),
   PRIMARY KEY(useEmailAdress),
   UNIQUE(useNom)
);

CREATE TABLE t_damageTypeValues(
   damContestantId INT,
   damPhysical DOUBLE,
   damMagic DOUBLE,
   damBurn DOUBLE,
   damFreeze DOUBLE,
   damBleed DOUBLE,
   PRIMARY KEY(damContestantId)
);

CREATE TABLE t_interaction(
   intId INT,
   intNbMaxOfContestantAffected SMALLINT,
   intText VARCHAR(150),
   PRIMARY KEY(intId)
);

CREATE TABLE t_defenseTypeValues(
   defContestantId INT,
   defPhysic DOUBLE,
   defMagic DOUBLE,
   defBurn DOUBLE,
   defFreeze DOUBLE,
   defBleed DOUBLE,
   PRIMARY KEY(defContestantId)
);

CREATE TABLE t_contestant(
   conId INT AUTO_INCREMENT,
   conLinkedEmail VARCHAR(50),
   conName VARCHAR(50) NOT NULL,
   conState SMALLINT,
   conNameLength SMALLINT,
   conSpeed DOUBLE,
   conHealth DOUBLE,
   conReach DOUBLE,
   conFriendlinessMultiplier DOUBLE,
   conSocialMultiplier DOUBLE,
   conAgressivenessMultiplier DOUBLE,
   conCharisma DOUBLE,
   conLuck DOUBLE,
   conNumberOfInteractionAllowed SMALLINT,
   damContestantId INT NOT NULL,
   useEmailAdress VARCHAR(50) NOT NULL,
   defContestantId INT NOT NULL,
   PRIMARY KEY(conId, conLinkedEmail),
   UNIQUE(damContestantId),
   UNIQUE(useEmailAdress),
   UNIQUE(defContestantId),
   FOREIGN KEY(damContestantId) REFERENCES t_damageTypeValues(damContestantId),
   FOREIGN KEY(useEmailAdress) REFERENCES t_user(useEmailAdress),
   FOREIGN KEY(defContestantId) REFERENCES t_defenseTypeValues(defContestantId)
);

CREATE TABLE t_specificInteraction(
   speId INT AUTO_INCREMENT,
   speTemplateId INT,
   speSpecificInteractionDayId INT,
   speDayId INT,
   speNbMaxOfContestantAffected SMALLINT,
   speMadeBy SMALLINT,
   conId INT NOT NULL,
   conLinkedEmail VARCHAR(50) NOT NULL,
   intId INT NOT NULL,
   PRIMARY KEY(speId),
   FOREIGN KEY(conId, conLinkedEmail) REFERENCES t_contestant(conId, conLinkedEmail),
   FOREIGN KEY(intId) REFERENCES t_interaction(intId)
);
