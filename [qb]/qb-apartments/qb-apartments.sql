CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4144 DEFAULT CHARSET=latin1;

-- If table is empty

DROP TABLE IF EXISTS `apartments`

CREATE TABLE `apartments` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`type` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`label` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`citizenid` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`expireddate` CHAR(50) NOT NULL DEFAULT '' COLLATE 'utf8_general_ci',
	`stashinfo` VARCHAR(255) NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `citizenid` (`citizenid`) USING BTREE,
	INDEX `name` (`name`) USING BTREE,
	CONSTRAINT `FK_apartments_players` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE SET NULL
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;

-- If table is NOT EMPTY

ALTER TABLE `apartments`
	ADD COLUMN `expireddate` CHAR(50) NOT NULL AFTER `citizenid`,
    ADD COLUMN `stashinfo` VARCHAR(255) NULL DEFAULT NULL AFTER `expireddate`,
	ADD CONSTRAINT `FK_apartments_players` FOREIGN KEY (`citizenid`) REFERENCES `players` (`citizenid`) ON UPDATE CASCADE ON DELETE SET NULL;