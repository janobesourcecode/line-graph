//Creating Database
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
(3, '2018-03-31', 'Surf Powder', 5052),
(4, '2019-04-30', 'Surf Powder', 8030),
(5, '2019-05-31', 'Surf Powder', 10000);

<?php
$con  = mysqli_connect("localhost","root","","salesdb");
 if (!$con) {
     # code...
    echo "Problem in database connection! Contact administrator!" . mysqli_error();
 }else{
         $sql ="SELECT * FROM tblsales";
         $result = mysqli_query($con,$sql);
         $chart_data="";
         while ($row = mysqli_fetch_array($result)) { 
 
            $productname=$row['Product'];
            $month[]  = date_format(date_create( $row['TRANSDATE']),"M d, Y")  ;
            $sales[] = $row['TotalSales'];
        }
 
 
 }
 
 
?>
<!DOCTYPE html>
<html lang="en"> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Graph</title> 
    </head>
    <body>
        <div style="width:50%;hieght:20%;text-align:center">
            <h2 class="page-header" >Analytics Sales Report </h2>
            <div><?php echo $productname; ?> </div>
            <canvas  id="chartjs_line"></canvas> 
        </div>    
    </body>
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script type="text/javascript">
      var ctx = document.getElementById("chartjs_line").getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels:<?php echo json_encode($month); ?>,
                        datasets: [{
                            backgroundColor: [
                               "#5969ff",
                                "#ff407b",
                                "#25d5f2",
                                "#ffc750",
                                "#2ec551",
                                "#7040fa",
                                "#ff004e"
                            ],
                            data:<?php echo json_encode($sales); ?>,
                        }]
                    },
                    options: {
                           legend: {
                        display: true,
                        position: 'bottom',
 
                        labels: {
                            fontColor: '#71748d',
                            fontFamily: 'Circular Std Book',
                            fontSize: 14,
                        }
                    },
 
 
                }
                });
    </script>
</html>
