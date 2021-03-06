
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Hiso Hotel :: {{< template "title" . >}}</title>

    <!-- Bootstrap core CSS -->
    <link href="/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/static/css/navbar-fixed-top.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="/static/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="/static/bower_components/jquery-ui/themes/smoothness/jquery-ui.css"/>
    <script type="text/javascript" src="/static/bower_components/jquery/dist/jquery.js"></script>
    <script type="text/javascript" src="/static/bower_components/jquery-ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/static/bower_components/angular/angular.js"></script>
    <script type="text/javascript" src="/static/bower_components/angular-ui-date/src/date.js"></script>
    {{< template "css" . >}}
  </head>

  <body ng-app="HotelApp">

    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Hiso Hotel</a>
        </div>
        <div id="navbar" class="navbar-header navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="/">Home</a></li>
            <li><a href="/room">Room</a></li>
            <li><a href="/roombooking">Room Booking</a></li>
            <li><a href="/receipt">Receipt</a></li>
            <li><a href="/equipment">Equipment</a></li>
          </ul>
        </div><!--/.nav-collapse -->
        <div id="navbar" class="navbar-collapse collapse">
          {{< if .User >}}
          <form class="navbar-form navbar-right">
            <div class="form-group">
              {{< .User.FirstName >}} {{< .User.LastName >}}
            </div>
            <a class="btn btn-warning" href="/logout">Sign out</a></h5>
          </form>
          {{< else >}}
          <form class="navbar-form navbar-right" method="POST" action="/login">
            <div class="form-group">
              <input type="text" name="UserName" placeholder="User Name" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" name="Password" placeholder="Password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
          {{< end >}}
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <div class="container">

      {{< template "content" . >}}

    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="/static/js/ie10-viewport-bug-workaround.js"></script>

    {{< template "js" . >}}
  </body>
</html>
