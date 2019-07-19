<?php
    session_start();
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<html lang="en-US">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="keywords" content="..........................................................................." />
	<meta name="description" content="........................................................................" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
	<link rel="shortcut icon" type="image/x-icon" href="favicon.ico..........................................." />
	<link rel="apple-touch-icon" type="image/x-icon" href="apple-touch-icon.png..............................." />
	<title>Medicine Guide</title>
	<link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" media="all" />
	<link rel="stylesheet" type="text/css" href="css/normalize.css" media="all" />
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all" />
	<link rel="stylesheet" type="text/css" href="style.css" media="all" />
	<link rel="shortcut icon" href="img/Graphicloads-Medical-Health-Medicine-box-2.ico">
	<script type="text/javascript" src="js/modernizr.js"></script>
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</head>


<body>
<!--
	<div class="header-area"> 
		<div class="header-top"> 
			<div class="container"> 
				<div class="logo col-md-5"> 
					<img src="images/logo.png" alt="" />
				</div>
				<div class="menu col-md-5"> 
					<ul class="list-unstyled list-inline pull-right">
						<li><a href="#">Home</a></li>
						<li><a href="#">Cart</a></li>
						<li><a href="#">Logout</a></li>
						
					</ul>
				</div>
				
			</div>
		</div>
		
		
	</div>
-->
	
		
		
		
		
		<div class="login"> 
			<form class="col-md-4 col-sm-offset-4 text-center" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" style="margin: 2%;background-color: #e3e8ef;border: 1px #e3e8ef;border-radius: 5%; opacity:0.6;filter: alpha(opacity=60);text-align: center;margin-left: 35%;padding-top: 2%;padding-bottom: 2%;box-shadow: 5px 10px #989ba0;">
			  <div class="form-group center" >
				<label for="uname" style="font-weight: bold;color: #000000;">Username:</label>
				<input type="text" class="form-control" id="email" name="uname" style="width:50%;margin-left: 24%;" required>
			  </div>
			  <div class="form-group">
				<label for="pwd" style="font-weight: bold;color: #000000;">Password:</label>
				<input type="password" class="form-control" id="pwd" name="upass" style="width:50%;margin-left: 24%" required>
			  </div>
			  <div class="checkbox">
				<label style="font-weight: bold;color: #000000;"><input type="checkbox"> Remember me</label>
			  </div>
			  
			  
			  <button type="submit" class="btn btn-default" style="font-weight: bold;color: #000000;">Login</button>
			  <br>
			  <br>
			  <label style="font-weight: bold;color: #000000;">Don't have an account? Sign Up!</label>
			  <br>
			  <a href="cussignup.php" style="font-weight: bold;color: blue;">As Customer</a>
			  <br>
			  <a href="pharsignup.php" style="font-weight: bold;color: blue;">As Pharmacist</a>
			</form>
            <?php
                if ($_SERVER["REQUEST_METHOD"] == "POST")
                {   
                    $_SESSION["uname"]= $_POST["uname"];
                    $_SESSION["upass"]= $_POST["upass"];
                    $username = $_POST["uname"];
                    $password = $_POST["upass"];
                    // Connect to the database
                        $con=mysqli_connect("localhost","root","");
                        // Make sure we connected successfully
                        if(! $con)
                        {
                            die('Connection Failed'.mysql_error());
                        }

                        // Select the database to use
                        mysqli_select_db($con,'medicineguide');

                        $result = mysqli_query($con,"SELECT * FROM customerlogin where cuUserName='".$username."' and cuPassword='".$password."';") or die("Failed to Login".mysql_error());

                        $row = mysqli_fetch_array($result);

                        if($row["cuUserName"]==$username && $row["cuPassword"]==$password)
                        {
                            header("Location:cushome.php");
                        }

                        else
                        {
                            
                            $result = mysqli_query($con,"SELECT * FROM pharmacylogin where phUserName='".$username."' and phPassword='".$password."';") or die("Failed to Login".mysql_error());
                            $row = mysqli_fetch_array($result);
                            if($row["phUserName"]==$username && $row["phPassword"]==$password)
                            {
                                  header("Location:adod.html");  
                            }
                            else
                            {
                               $result = mysqli_query($con,"SELECT * FROM admin where aUserName='".$username."' and aPassword='".$password."';") or die("Failed to Login".mysql_error());
                                $row = mysqli_fetch_array($result);
                                if($row["aUserName"]==$username && $row["aPassword"]==$password)
                                {
                                      header("Location:adaddmed.html");  
                                }
                                else
                                {
                                     //header("Location:index.php");
                                    $message = "Incorrect username or password! Or no such account exists!";
                                    echo "<script type='text/javascript'>alert('$message');</script>";
                                }     
                            }
                        }
                }
            ?>
			
			
		</div>
		
<!--
		<div class="signup col-sm-offset-8 col-md-8"> 
			<p>Not a registered user. Please Sign Up...</p>
			<button type="submit" class="btn btn-success">  </button>
			<button type="submit" class="btn btn-success"></button>
			<a href="cussignup.html">As Customer</a>
			
		</div>
-->
		
		
		
		
		
		
		
		
		
		
		
	
	
	
</body>
</html>