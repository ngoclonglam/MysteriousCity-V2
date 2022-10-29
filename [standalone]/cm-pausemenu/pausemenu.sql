


CREATE TABLE IF NOT EXISTS `codem_battlepass_dailymissions` (
  `missions` longtext DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `codem_battlepass_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` longtext NOT NULL,
  `level` int(11) NOT NULL DEFAULT 1,
  `xp` int(11) NOT NULL DEFAULT 0,
  `purchased` int(11) NOT NULL DEFAULT 0,
  `claimedLevels` longtext NOT NULL DEFAULT '{}',
  `missions` longtext DEFAULT '{}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `codem_battlepass_day_counter` (
  `counter` int(11) DEFAULT 30
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `codem_battlepass_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tbx_id` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;



CREATE TABLE IF NOT EXISTS `codem_daily_awards` (
  `identifier` longtext DEFAULT NULL,
  `claimedDays` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



CREATE TABLE IF NOT EXISTS `codem_daily_awards_day_counter` (
  `counter` int(11) DEFAULT NULL,
  `updatedAt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `codem_livecall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `playername` varchar(50) DEFAULT NULL,
  `message` longtext NOT NULL,
  `date` char(50) DEFAULT NULL,
  `time` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
