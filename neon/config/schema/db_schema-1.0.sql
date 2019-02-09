CREATE TABLE `NeonShipment` (
  `shipmentPK` INT NOT NULL AUTO_INCREMENT,
  `shipmentID` VARCHAR(25) NOT NULL,
  `domainID` VARCHAR(10) NULL,
  `dateShipped` DATE NOT NULL,
  `shippedFrom` VARCHAR(150) NULL,
  `senderID` VARCHAR(45) NOT NULL,
  `destinationFacility` VARCHAR(150) NULL,
  `sentToID` VARCHAR(45) NOT NULL,
  `shipmentService` VARCHAR(45) NULL,
  `shipmentMethod` VARCHAR(45) NULL,
  `trackingNumber` VARCHAR(45) NULL,
  `receivedDate` DATETIME NULL,
  `receivedBy` VARCHAR(45) NULL,
  `receiptstatus` VARCHAR(45) NULL,
  `notes` VARCHAR(250) NULL,
  `importUid` INT UNSIGNED NOT NULL,
  `checkinUid` INT UNSIGNED NULL,
  `checkinTimestamp` DATETIME NULL,
  `modifiedByUid` INT UNSIGNED NULL,
  `modifiedTimestamp` DATETIME NULL,
  `initialtimestamp` TIMESTAMP NULL DEFAULT current_timestamp,
  PRIMARY KEY (`shipmentpk`),
  CONSTRAINT `FK_neon_ship_importuid` FOREIGN KEY (`importUid`)  REFERENCES `users` (`uid`)  ON DELETE RESTRICT  ON UPDATE CASCADE,
  CONSTRAINT `FK_neon_ship_checkinUid` FOREIGN KEY (`checkinUid`)  REFERENCES `users` (`uid`)  ON DELETE RESTRICT  ON UPDATE CASCADE,
  CONSTRAINT `FK_neon_ship_moduid` FOREIGN KEY (`modifiedByUid`)  REFERENCES `users` (`uid`)  ON DELETE RESTRICT  ON UPDATE CASCADE);
  
ALTER TABLE `NeonShipment` 
  ADD UNIQUE INDEX `UNIQUE_INDEX` (`shipmentID` ASC),
  ADD INDEX `FK_neon_ship_importUid_idx` (`importUid` ASC),
  ADD INDEX `FK_neon_ship_checkinUid_idx` (`checkinUid` ASC),
  ADD INDEX `FK_neon_ship_modifiedByUid_idx` (`modifiedByUid` ASC);


CREATE TABLE `NeonSample` (
  `samplePK` INT NOT NULL AUTO_INCREMENT,
  `shipmentPK` INT NOT NULL,
  `sampleID` VARCHAR(45) NULL,
  `sampleCode` VARCHAR(45) NULL,
  `sampleClass` VARCHAR(45) NULL,
  `taxonID` VARCHAR(45) NULL,
  `individualCount` INT NULL,
  `filterVolume` INT NULL,
  `namedLocation` VARCHAR(45) NULL,
  `domainRemarks` VARCHAR(250) NULL,
  `collectDate` DATE NULL,
  `quarantineStatus` VARCHAR(4) NULL,
  `acceptedForAnalysis` INT UNSIGNED NULL,
  `sampleCondition` VARCHAR(45) NULL,
  `dynamicProperties` TEXT NULL,
  `notes` VARCHAR(250) NULL,
  `occid` INT UNSIGNED NULL,
  `checkinUid` INT UNSIGNED NULL,
  `checkinTimestamp` DATETIME NULL,
  `initialtimestamp` TIMESTAMP NULL DEFAULT current_timestamp,
  PRIMARY KEY (`samplePK`),
  INDEX `FK_samples_shipmentid_idx` (`shipmentPK` ASC),
  INDEX `FK_neon_sample_occid_idx` (`occid` ASC),
  UNIQUE INDEX `UNIQUE_sampleID` (`sampleID` ASC),
  UNIQUE INDEX `UNIQUE_occid` (`occid` ASC),
  CONSTRAINT `FK_neon_sample_checkinuid` FOREIGN KEY (`checkinUid`)  REFERENCES `users` (`uid`)  ON DELETE RESTRICT  ON UPDATE CASCADE,
  CONSTRAINT `FK_neon_samples_shipmentid`  FOREIGN KEY (`shipmentPK`)  REFERENCES `NeonShipment` (`shipmentPK`)  ON DELETE CASCADE  ON UPDATE CASCADE,
  CONSTRAINT `FK_neon_sample_occid`  FOREIGN KEY (`occid`)  REFERENCES `omoccurrences` (`occid`)  ON DELETE RESTRICT  ON UPDATE CASCADE);

