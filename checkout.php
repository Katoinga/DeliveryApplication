<!DOCTYPE html>
<html lang="en">
<?php
include("connection/connect.php");
include_once 'product-action.php';
error_reporting(0);
session_start();
if(empty($_SESSION["user_id"]))
{
	header('location:login.php');
}
else{


												foreach ($_SESSION["cart_item"] as $item)
												{

												$item_total += ($item["price"]*$item["quantity"]);

													if($_POST['submit'])
													{

													$SQL="insert into users_orders(u_id,title,quantity,price) values('".$_SESSION["user_id"]."','".$item["title"]."','".$item["quantity"]."','".$item["price"]."')";

														mysqli_query($db,$SQL);

														$success = "Gracias! Tu pedido fue recibido!";



													}
												}
?>


<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="#">
    <title>Secure Food</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animsition.min.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet"> </head>
<body>

    <div class="site-wrapper">
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
            <div class="top-links">
                <div class="container">
                    <ul class="row links">

                        <li class="col-xs-12 col-sm-4 link-item"><span>1</span><a href="restaurants.php">Escoge un restaurante</a></li>
                        <li class="col-xs-12 col-sm-4 link-item "><span>2</span><a href="#">Elige tu comida favorita</a></li>
                        <li class="col-xs-12 col-sm-4 link-item active" ><span>3</span><a href="checkout.php">Ordena y paga!</a></li>
                    </ul>
                </div>
            </div>

                <div class="container">

					   <span style="color:green;">
								<?php echo $success; ?>
										</span>

                </div>




            <div class="container m-t-30">
			<form action="" method="post">
                <div class="widget clearfix">

                    <div class="widget-body">
                        <form method="post" action="#">
                            <div class="row">

                                <div class="col-sm-12">
                                    <div class="cart-totals margin-b-20">
                                        <div class="cart-totals-title">
                                            <h4>Resumen del carrito</h4> </div>
                                        <div class="cart-totals-fields">

                                            <table class="table">
											<tbody>



                                                    <tr>
                                                        <td>Subtotal</td>
                                                        <td> <?php echo "S/".$item_total; ?></td>
                                                    </tr>

                                                    <tr>
                                                        <td class="text-color"><strong>Total</strong></td>
                                                        <td class="text-color"><strong> <?php echo "S/".$item_total; ?></strong></td>
                                                    </tr>
                                                </tbody>




                                            </table>
                                        </div>
                                    </div>
                                    <!--cart summary-->
                                    <div class="payment-option">
                                        <ul class=" list-unstyled">
                                            <li>
                                                <label class="custom-control custom-radio  m-b-20">
                                                    <input name="mod" id="radioStacked1" checked value="COD" type="radio" class="custom-control-input"> <span class="custom-control-indicator"></span> <span class="custom-control-description">Pagar en delivery</span>
                                                    <br> <span>El delivery ira hacia la direccion ingresada en su cuenta</span> </label>
                                            </li>

                                        </ul>
                                        <p class="text-xs-center"> <input type="submit" onclick="return confirm('¿Estas seguro?');" name="submit"  class="btn btn-outline-success btn-block" value="Ordenar!"> </p>
                                    </div>
									</form>
                                </div>
                            </div>

                    </div>
                </div>
				 </form>
            </div>

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
        <!-- end:page wrapper -->
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
