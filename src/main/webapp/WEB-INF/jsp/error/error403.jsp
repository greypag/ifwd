<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
  <!DOCTYPE html>
  <html lang="en">
    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="description" content="">
      <meta name="author" content="">
      <title>
        Registration Error
      </title>
      <!-- Bootstrap core CSS -->
      <link href="resources/css/bootstrap.min.css" rel="stylesheet">
      <!-- Custom styles  -->
      <link href="resources/css/annexure.css" rel="stylesheet">
      <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
      <!--[if lt IE 9]>
<script src="../../assets/js/ie8-responsive-file-warning.js"></script>
<![endif]-->
      <script src="resources/js/ie-emulation-modes-warning.js">
      </script>
      <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
      <!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
      <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
      <script src="resources/js/ie10-viewport-bug-workaround.js">
      </script>
    </head>
    
    <body>
      <!-- <div class="annexure-form " >
        <div class="annexure-form-header">
          ERROR 
          <img src="resources/images/ErrorInfoIcon.png" class="pull-right icon" alt="">
          
        </div>
        <div class="form-horizontal company form-regisration">
          <div class="col-sm-12 error">
            <div class="division">
            </div>
            <p>
              ERROR No. 403
            </p>
            <div class="division">
            </div>
            <p>
              The following error was encountered:
              <br>
              403 - Forbidden 
              <br>
              &bull;The 403 Forbidden HTTP status code means that accessing the page 
              <br>
              
              &bull; or resource you were trying to reach is absolutely forbidden.
            </p>
            <br>
          </div>
          <div class="clearfix">
          </div>
          <div class="form-group">
              <div class="col-sm-9">
                <button type="button" onclick="goBack();" class="btn btn-default btn-sm">
                  &laquo; BACK
                </button>
              </div>
          </div>
        </div>
      </div> -->
      <div class="container annexure-form error-page " >
    	<div class="col-xs-12">
    		<h2 class="annexure-form-header">ERROR</h2>
		    <div class="company form-regisration error">
				<h3>ERROR No. 403</h3>
				<p>The following error was encountered:</p>
				<p>
					<strong>403 - Forbidden</strong>
				</p>
				<p>The 403 Forbidden HTTP status code means that accessing the page or resource you were trying to reach is absolutely forbidden.</p>
			</div>
			<div class="row">
	            <div class="col-xs-12 col-sm-12 col-md-4">
					<a href="#" onclick="goBack();" class="bdr-curve-none btn btn-primary btn-next">Go Back to Home Page</a>
	            </div>
            </div>
		</div>
	</div>
        <script>
    function goBack(){
    	window.history.back();
    }
    </script>
    </body>
  </html>
  