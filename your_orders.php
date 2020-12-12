<!DOCTYPE html>
<html lang="en">
<?php
include("connection/connect.php");
error_reporting(0);
session_start();

if(empty($_SESSION['user_id']))  //if usser is not login redirected baack to login page
{
	header('location:login.php');
}
else
{
?>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
		<title>FoodPick-y</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
<style type="text/css" rel="stylesheet">


.indent-small {
  margin-left: 5px;
}
.form-group.internal {
  margin-bottom: 0;
}
.dialog-panel {
  margin: 10px;
}
.datepicker-dropdown {
  z-index: 200 !important;
}
.panel-body {
  background: #e5e5e5;
  /* Old browsers */
  background: -moz-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* FF3.6+ */
  background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, #e5e5e5), color-stop(100%, #ffffff));
  /* Chrome,Safari4+ */
  background: -webkit-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* Chrome10+,Safari5.1+ */
  background: -o-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* Opera 12+ */
  background: -ms-radial-gradient(center, ellipse cover, #e5e5e5 0%, #ffffff 100%);
  /* IE10+ */
  background: radial-gradient(ellipse at center, #e5e5e5 0%, #ffffff 100%);
  /* W3C */
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#e5e5e5', endColorstr='#ffffff', GradientType=1);
  /* IE6-9 fallback on horizontal gradient */
  font: 600 15px "Open Sans", Arial, sans-serif;
}
label.control-label {
  font-weight: 600;
  color: #777;
}


table {
	width: 750px;
	border-collapse: collapse;
	margin: auto;

	}

/* Zebra striping */
tr:nth-of-type(odd) {
	background: #eee;
	}

th {
	background: #ff3300;
	color: white;
	font-weight: bold;

	}

td, th {
	padding: 10px;
	border: 1px solid #ccc;
	text-align: left;
	font-size: 14px;

	}

/*
Max width before this PARTICULAR table gets nasty
This query will take effect for any screen smaller than 760px
and also iPads specifically.
*/
@media
only screen and (max-width: 760px),
(min-device-width: 768px) and (max-device-width: 1024px)  {

	table {
	  	width: 100%;
	}

	/* Force table to not be like tables anymore */
	table, thead, tbody, th, td, tr {
		display: block;
	}

	/* Hide table headers (but not display: none;, for accessibility) */
	thead tr {
		position: absolute;
		top: -9999px;
		left: -9999px;
	}

	tr { border: 1px solid #ccc; }

	td {
		/* Behave  like a "row" */
		border: none;
		border-bottom: 1px solid #eee;
		position: relative;
		padding-left: 50%;
	}

	td:before {
		/* Now like a table header */
		position: absolute;
		/* Top/left values mimic padding */
		top: 6px;
		left: 6px;
		width: 45%;
		padding-right: 10px;
		white-space: nowrap;
		/* Label the data */
		content: attr(data-column);

		color: #000;
		font-weight: bold;
	}

}







	</style>

	</head>

<body>

        <!--header starts-->
        <header id="header" class="header-scroll top-header headrom">
            <!-- .navbar -->
            <nav class="navbar navbar-dark">
                <div class="container">
                    <button class="navbar-toggler hidden-lg-up" type="button" data-toggle="collapse" data-target="#mainNavbarCollapse">&#9776;</button>
                    <a class="navbar-brand" href="index.php"> <img class="img-rounded" src="images/food-picky-logo.png" alt=""> </a>
                    <div class="collapse navbar-toggleable-md  float-lg-right" id="mainNavbarCollapse">
                        <ul class="nav navbar-nav">
                            <li class="nav-item"> <a class="nav-link active" href="index.php">Home <span class="sr-only">(current)</span></a> </li>
                            <li class="nav-item"> <a class="nav-link active" href="restaurants.php">Restaurantes <span class="sr-only"></span></a> </li>

							<?php
						if(empty($_SESSION["user_id"]))
							{
								echo '<li class="nav-item"><a href="login.php" class="nav-link active">Iniciar Sesion</a> </li>
							  <li class="nav-item"><a href="registration.php" class="nav-link active">Registrate</a> </li>';
							}
						else
							{


									echo  '<li class="nav-item"><a href="your_orders.php" class="nav-link active">Tus ordenes</a> </li>';
									echo  '<li class="nav-item"><a href="logout.php" class="nav-link active">Cerrar Sesion</a> </li>';
							}

						?>

                        </ul>
                    </div>
                </div>
            </nav>
            <!-- /.navbar -->
        </header>
        <div class="page-wrapper">
            <!-- top Links -->

            <!-- end:Top links -->
            <!-- start: Inner page hero -->
            <div class="inner-page-hero bg-image" data-image-src="images/img/res.jpeg">
                <div class="container"> </div>
                <!-- end:Container -->
            </div>
            <div class="result-show">
                <div class="container">
                    <div class="row">


                    </div>
                </div>
            </div>
            <!-- //results show -->
            <section class="restaurants-page">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-3">


                            
                            <!-- end:Widget -->
                        </div>
                        <div class="col-xs-12 col-sm-7 col-md-7 ">
                            <div class="bg-gray restaurant-entry">
                                <div class="row">

							<table >
						  <thead>
							<tr>

							  <th>Item</th>
							  <th>Cantidad</th>
							  <th>Precio</th>
							   <th>Estado</th>
							     <th>Fecha</th>
								   <th>Acciones</th>

							</tr>
						  </thead>
						  <tbody>


							<?php
						// displaying current session user login orders
						$query_res= mysqli_query($db,"select * from users_orders where u_id='".$_SESSION['user_id']."'");
												if(!mysqli_num_rows($query_res) > 0 )
														{
															echo '<td colspan="6"><center>No tienes ordenes pendientes :( </center></td>';
														}
													else
														{

										  while($row=mysqli_fetch_array($query_res))
										  {

							?>
												<tr>
														 <td data-column="Item"> <?php echo $row['title']; ?></td>
														  <td data-column="Quantity"> <?php echo $row['quantity']; ?></td>
														  <td data-column="price">S/.<?php echo $row['price']; ?></td>
														   <td data-column="status">
														   <?php
																			$status=$row['status'];
																			if($status=="" or $status=="NULL")
																			{
																			?>
																			<button type="button" class="btn btn-info" style="font-weight:bold;">Pedido</button>
																		   <?php
																			  }
																			   if($status=="in process")
																			 { ?>
																				<button type="button" class="btn btn-warning"><span class="fa fa-cog fa-spin"  aria-hidden="true" ></span>En camino!</button>
																			<?php
																				}
																			if($status=="closed")
																				{
																			?>
																			 <button type="button" class="btn btn-success" ><span  class="fa fa-check-circle" aria-hidden="true">Enviado</button>
																			<?php
																			}
																			?>
																			<?php
																			if($status=="rejected")
																				{
																			?>
																			 <button type="button" class="btn btn-danger"> <i class="fa fa-close"></i>Cancelado</button>
																			<?php
																			}
																			?>






														   </td>
														  <td data-column="Date"> <?php echo $row['date']; ?></td>
														   <td data-column="Action"> <a href="delete_orders.php?order_del=<?php echo $row['o_id'];?>" onclick="return confirm('¿Estas seguro de que quieres cancelar tu orden?');" class="btn btn-danger btn-flat btn-addon btn-xs m-b-10"><i class="fa fa-trash-o" style="font-size:16px"></i></a>
															</td>

												</tr>


														<?php }} ?>




						  </tbody>
					</table>



                                </div>
                                <!--end:row -->
                            </div>



                            </div>



                        </div>
                    </div>
                </div>
            </section>
						<!-- start: FOOTER -->
		        <footer class="footer">
		            <div class="container">
		                <!-- top footer statrs -->
		                <div class="row top-footer">
		                    <div class="col-xs-12 col-sm-3 footer-logo-block color-gray">
		                        <a href="#"> <img src="images/food-picky-logo.png" alt="Footer logo"> </a> <span>Sistema de pedidos delivery</span> </div>
		                     
		                    <div class="col-xs-12 col-sm-2 how-it-works-links color-gray">
		                        <h5>¿Como funciona?</h5>
		                        <ul>
		                            <li><a href="#">Pon tu ubicacion</a> </li>
		                            <li><a href="#">Escoge un restaurante</a> </li>
		                            <li><a href="#">Escoge tu pedido</a> </li>
		                            <li><a href="#">Espera por el delivery</a> </li>
		                            <li><a href="#">Paga con efectivo </a> </li>
		                        </ul>
		                    </div>
		                    <div class="col-xs-12 col-sm-3 popular-locations color-gray">
		                        <h5>Llegamos a</h5>
		                        <ul>
		                            <li><a href="#">Cerro Coloradao</a> </li>
		                            <li><a href="#">Selva Alegre</a> </li>
		                            <li><a href="#">Arequipa</a> </li>
		                            <li><a href="#">Cayma</a> </li>
		                            <li><a href="#">Characato</a> </li>
		                            <li><a href="#">Jacobo hunter</a> </li>
		                            <li><a href="#">Miraflores</a> </li>
		                            <li><a href="#">Yanahuara</a> </li>
		                        </ul>
		                    </div>
		                </div>
		                <!-- top footer ends -->

		                <!-- bottom footer ends -->
		            </div>
		        </footer>
		        <!-- end:Footer -->
        </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <script src="js/jquery.min.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/animsition.min.js"></script>
    <script src="js/bootstrap-slider.min.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/headroom.js"></script>
    <script src="js/foodpicky.min.js"></script>
</body>

</html>
<?php
}
?>
