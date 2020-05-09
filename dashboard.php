<?php
include_once("./database/constants.php");
if (!isset($_SESSION["userid"])) {
	header("location:".DOMAIN."/");
}
$username = $_SESSION["username"];
$usertype = $_SESSION["usertype"];
$reg = $_SESSION["last_login"];
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Inventory Management System</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
 	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 	<script type="text/javascript" src="./js/main.js"></script>
 </head>
<body>
	<!-- Navbar -->
	<?php include_once("./templates/header.php"); ?>
	<br/><br/>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="card mx-auto">
				  <img class="card-img-top mx-auto" style="width:60%;" src="./images/profile.png" alt="Card image cap">
				  <div class="card-body">
                      <h3 class="card-title"><u>Profile Info</u></h3>
                      <p>
                
                    <h6><?php echo "Username : " .$username; ?></h6>
                      <h6><?php echo "Last Login : ".$reg; ?></h6>
                      <h6><?php echo "User Type : ".$usertype; ?></h6>
                      
				  </div>
				</div>
			</div>
			<div class="col-md-8">
				<div class="jumbotron" style="width:100%;height:95%;">
					<h1><?php echo "Welcome ". $username.","; ?></h1>
					<div class="row">
						<div class="col-sm-6">
							<iframe src="http://free.timeanddate.com/clock/i616j2aa/n1993/szw160/szh160/cf100/hnce1ead6" frameborder="0" width="160" height="160"></iframe>

						</div>
						<div class="col-sm-6">
							<div class="card">
						      <div class="card-body">
						        <h4 class="card-title">New Orders</h4>
						        <p class="card-text">Here you can make invoices and create new orders</p>
						        <a href="new_order.php" class="btn btn-primary">New Orders</a>
						      </div>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<p></p>
    
    <?php
    
        if ($usertype == "Admin")
        {
    ?>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                                <div class="card-body">
                                <h4 class="card-title">Categories</h4>
                                <p class="card-text">Here you can manage your categories and you add new parent and sub categories</p>
                                <a href="#" data-toggle="modal" data-target="#form_category" class="btn btn-primary">Add</a>
                                <a href="manage_categories.php" class="btn btn-primary">Manage</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4">
                        <div class="card">
                                <div class="card-body">
                                <h4 class="card-title">Brands</h4>
                                <p class="card-text">Here you can manage your brand and you add new brand</p>
                                <a href="#" data-toggle="modal" data-target="#form_brand" class="btn btn-primary">Add</a>
                                <a href="manage_brand.php" class="btn btn-primary">Manage</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card">
                                <div class="card-body">
                                <h4 class="card-title">Products</h4>
                                <p class="card-text">Here you can manage your prpducts and you add new products</p>
                                <a href="#" data-toggle="modal" data-target="#form_products" class="btn btn-primary">Add</a>
                                <a href="manage_product.php" class="btn btn-primary">Manage</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     <?php
        }
    ?>
	<?php
	//Categpry Form
	include_once("./templates/category.php");
	 ?>
	 <?php
	//Brand Form
	include_once("./templates/brand.php");
	 ?>
	 <?php
	//Products Form
	include_once("./templates/products.php");
	 ?>


</body>
</html>