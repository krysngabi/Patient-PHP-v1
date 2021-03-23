<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>PME</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->

</head>

<body style="background: url('../img/backgroundX.jpg')">
<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <p style="color: white;text-align: center" >
                    <img src="../img/logo.png" height="150" style="padding-top:40px">
                </p>
                <div class="login-panel panel panel-red">
                    <div class="panel-heading" >
                        <h3 class="panel-title" style="text-align: center">CONNEXION</h3>
                    </div>
                    <div class="panel-body">
                        <div class="error"></div>
                        <form id="mform" role="form" action="../api/find/categorie.php" method="POST">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Utilisateur" name="muser" type="text" autofocus required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Mot de passe" name="password" type="password" required>
                                </div>
                                
                                <button type="submit" style="background-color:#5181B8 ;color:white" id="subb" class="btn btn-silver btn-lg btn-block  panel-red">OK</button>
                            </fieldset>
							  </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
<style>	
.loader {
    border: 16px solid #f3f3f3; /* Light grey */
    border-top: 16px solid #3498db; /* Blue */
    border-radius: 50%;
    width: 50px;
    height: 50px;
    animation: spin 2s linear infinite;
}

@keyframes spin {
    0% { transform: rotate(0deg); }
    100% { transform: rotate(360deg); }
}

.loader {
 border-top: 13px solid #2F69E0;
 border-right: 13px solid #475054;
 border-bottom: 13px solid #E04D2F;
}
</style>
	<div id="loa" ></div>
	 
    <!-- jQuery -->

<script src="../js/jquery-1.11.1.min.js"></script>
<script src="../js/jquery.backstretch.min.js"></script>
<script src="../js/scripts.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>


    <script type="text/javascript">
        /*$(document).on('submit', '#registration', function() {
            //$('#feedback').html("<p style='text-align:center'><img  src='./images/load.gif'><br/>Chargement de données...<p>");
            $.post("../controllers/registration.php", $(this).serialize())
                .done(function(data){

                });
            return false;
        });*/
		
		$('#mform').on('submit', function() {
			$('#loa').html('<center><div class="loader"></div> </center>');
			$('#subb').prop("disabled",true);
			$('#subb').text("Patientez SVP!");
			$('#subb').css({color:"#E04D2F"});
		 });


    </script>

</body>

</html>
