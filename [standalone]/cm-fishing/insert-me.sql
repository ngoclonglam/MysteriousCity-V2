
-- tablo yapısı dökülüyor qbtoesx.codem-fishing
CREATE TABLE IF NOT EXISTS `codem-fishing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `level` int(11) DEFAULT 1,
  `xp` int(11) DEFAULT 0,
  `playerimage` longtext DEFAULT '0',
  `playername` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;


-- tablo yapısı dökülüyor qbtoesx.codem-fishing-rewards
CREATE TABLE IF NOT EXISTS `codem-fishing-rewards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` char(50) DEFAULT NULL,
  `5` int(11) DEFAULT 0,
  `10` int(11) DEFAULT 0,
  `15` int(11) DEFAULT 0,
  `20` int(11) DEFAULT 0,
  `25` int(11) DEFAULT 0,
  `30` int(11) DEFAULT 0,
  `35` int(11) DEFAULT 0,
  `40` int(11) DEFAULT 0,
  `45` int(11) DEFAULT 0,
  `50` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

