CREATE TABLE `tblsales` (
  `SalesId` int(11) NOT NULL,
  `TRANSDATE` date NOT NULL,
  `Product` varchar(90) NOT NULL,
  `TotalSales` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
 
--
-- Dumping data for table `tblsales`
--
 
INSERT INTO `tblsales` (`SalesId`, `TRANSDATE`, `Product`, `TotalSales`) VALUES
(1, '2018-01-30', 'Surf Powder', 1400),
(2, '2018-02-28', 'Surf Powder', 800),
