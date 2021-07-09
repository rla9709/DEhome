
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `tr_interest_AFTER_INSERT` AFTER INSERT ON `tr_interest` FOR EACH ROW BEGIN
UPDATE usedtrade T1 ,(select usedtrade.trade_no ,count(trade_interest) as count from tr_interest, usedtrade where usedtrade.trade_no = tr_interest.trade_no group by tr_interest.trade_no ) T2 
SET T1.trade_evalue = t2.count
WHERE T1.trade_no = T2.TRADE_NO;
END //
