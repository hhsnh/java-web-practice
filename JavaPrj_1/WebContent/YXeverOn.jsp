<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.sanqing.dao.MessageDAO"%>
<%@page import="com.sanqing.factory.MessageDAOFactory"%>
<%@page import="com.sanqing.util.Page"%>
<%@page import="com.sanqing.util.PageUtil"%>
<%@page import="com.sanqing.bean.Message"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>My Web Site</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/base.css" rel="stylesheet" >
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</head>
<body>
	<nav  class="navbar navbar-default navbar-fixed-top">
	  <div class="navbar-header">
	    <a class="navbar-brand" href="YXeverOn.jsp">Company name</a>
	    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nav-menu" aria-expanded="false">
	      <span class="sr-only">Toggle navigation</span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	      <span class="icon-bar"></span>
	    </button>
	  </div>
	  		<div class="btn-group pull-right">
			    <button type="button" class="btn btn-primary" >Customer area</button>
			      <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			       <span class="caret"></span>
			       <span class="sr-only">Toggle Dropdown</span>
			       </button>
			    <ul class="dropdown-menu">
			      <li><a href="#">Action</a></li>
			      <li><a href="#">Another action</a></li>
			      <li><a href="#">Something else here</a></li>
			      <li role="separator" class="divider"></li>
			      <li><a href="#">Separated link</a></li>
			    </ul>
	  		</div> 

	  <div id="nav-menu" class="collapse navbar-collapse navbar-right">
	      <ul class="nav navbar-nav">
	        <li><a href="#about">About</a></li>
	        <li><a href="#features">Features</a></li>
	        <li><a href="#pricing">Pricing</a></li>
	        <li><a href="contact.html">Contact</a></li>
	      </ul>
	  </div>
	</nav>
	<div class="input-group">
		  <span class="input-group-btn">
		    <div class="btn-group pull-right">
		        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Customer area <span class="caret"></span>
		        </button>
		        <ul class="dropdown-menu">
		          <li><a href="#">Action</a></li>
		          <li><a href="#">Another action</a></li>
		          <li><a href="#">Something else here</a></li>
		          <li role="separator" class="divider"></li>
		          <li><a href="#">Separated link</a></li>
		        </ul>
		      </div>
		  </span>
		  <input type="text" class="form-control" placeholder="Type the page title...">
		  <span class="input-group-btn">
		    <div class="btn-group pull-right">
		        <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Customer area <span class="caret"></span>
		        </button>
		        <ul class="dropdown-menu">
		          <li><a href="#">Action</a></li>
		          <li><a href="#">Another action</a></li>
		          <li><a href="#">Something else here</a></li>
		          <li role="separator" class="divider"></li>
		          <li><a href="#">Separated link</a></li>
		        </ul>
		      </div>
		  </span>
		</div>
	<section id="intro-header">
	  <div class="container">
	    <!-- row 2 -->
	    <div class="row">
	      <div class="wrap-headline">
	        <h1 class="text-center">Hello World!</h1>
	        <h2 class="text-center">welcome to my site</h2>
	        <hr>
	        <ul class="list-inline list-unstyled text-center">
	          <li>
	            <a id="sign-btn" class="btn btn-default btn-lg" href="#" role="button">登录</a>
	          </li>
	          <li>
	             <a class="btn btn-primary btn-lg" href="#" role="button">注册</a>
	          </li>
	        </ul>
	        <form id="signin" class="form-inline text-center hidden-element">
			  <div class="form-group">
			    <div class="input-group">
			      <div class="input-group-addon">@</div>
			      <input type="text" class="form-control" id="signin-email" placeholder="Email">
			    </div>
			  </div>
			  <div class="form-group">
			    <div class="input-group">
			      <div class="input-group-addon">*</div>
			      <input type="password" class="form-control" id="signin-password" placeholder="Password">
			    </div>
			  </div>
			  <button type="submit" class="btn btn-default">Sign in</button>
			</form>
	      </div>
	    </div>
	    </div>
	</section>
	<section id="about">
  <div class="container">
    <!-- row 3 -->
    <div class="row">
      <div class="col-sm-6">
        <img src="images/girl1.jpg" class="img-responsive">
      </div>
      <div class="col-sm-6">
        <h3>Lorem ipsum dolor sit amet</h3>
        <p>
          Lorem ipsum dolor...
        </p>
      </div>
    </div>
    <hr>

    <!-- row 4 -->
    <div class="row">
      <div class="col-sm-6">
        <h3>Lorem ipsum dolor sit amet</h3>
        <p>
          Lorem ipsum dolor...
        </p>
      </div>
      <div class="col-sm-6">
		<img src="images/girl2.jpg" class="img-responsive">
      </div>
    </div>
  </div>
</section>  
<section id="features">
  <div class="container">

    <!-- row 5 -->
    <div class="row">
      <div class="col-sm-12">
        <h3 class="text-center">Features</h3>
        <p class="text-center">Features headline message</p>
      </div>
    </div>

    <!-- row 6 -->
    <div class="row">
      <div class="col-sm-2 col-md-4">
        <div class="feature ">
			<span class="glyphicon glyphicon-screenshot" aria-hidden="true"></span>
         	<span class="feature-tag">Product focus</span>
		</div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">
			<span class="glyphicon glyphicon-education" aria-hidden="true"></span>
			<span class="feature-tag">Teaching as a passion</span>
		</div>
      </div>   
      <div class="col-sm-2 col-md-4">
        <div class="feature">
        	<span class="glyphicon glyphicon-send" aria-hidden="true"></span>
        	<span class="feature-tag">Spreading knowledge</span>
        </div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">
        	<span class="glyphicon glyphicon-hourglass" aria-hidden="true"></span>
        	<span class="feature-tag">Save your day time</span>
        </div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">
        	<span class="glyphicon glyphicon-sunglasses" aria-hidden="true"></span>
        	<span class="feature-tag">Make it fancy</span>
        </div>
      </div>
      <div class="col-sm-2 col-md-4">
        <div class="feature">
        	<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>
        	<span class="feature-tag">Made with love</span>
        </div>
      </div>
      </div>
    </div>
  </div>
</section> 
<section id="pricing">
  <div class="container">

    <!-- row 7 -->
    <div class="row">
      <div class="col-sm-12">
        <h3 class="text-center price-headline">Price table</h3>
      </div>
    </div>

    <!-- row 8 -->
    <div class="row">
      <div class="center-block">
        <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th class="success">
                <h4 class="text-center white-text">Free plan</h4>
              </th>
              <th class="info">
                <h4 class="text-center white-text">Standard plan</h4>
              </th>
			     <th class="danger">
                <h4 class="text-center white-text">Premium plan</h4>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="success">
                <h3 class="text-center white-text">$ 0</h3>
              </td>
              <td class="info">
                <h3 class="text-center white-text">$ 99</h3>
              </td>
              <td class="danger">
                <h3 class="text-center white-text">$ 999</h3>
              </td>
            </tr>
            <tr>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>Dolor sit amet</td>
			  <td>Lorem ipsum</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>-</td>
              <td>Dolor sit amet</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td>-</td>
              <td>-</td>
              <td>Lorem ipsum</td>
            </tr>
            <tr>
              <td><a href="#" class="btn btn-success btn-block">Purchase</a></td>
              <td><a href="#" class="btn btn-info btn-block">Purchase</a></td>
              <td><a href="#" class="btn btn-danger btn-block">Purchase</a></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</section>
<section id="team">
  <div class="container">
    <div class="row">
     <div class="col-sm-12">
        <ul class="list-inline list-unstyled text-center">
          <li>
            <img src="images/jon.png" class="img-rounded">
            <h5 class="text-info">Jonny Doo</h5>
            <p class="text-muted">CEO</p>
          </li>
          <li>
            <img src="images/jon.png" class="img-circle">
            <h5 class="text-info">Jonny Doo</h5>
            <p class="text-muted">CTO</p>
          </li>
          <li>
            <img src="images/jon.png" class="img-thumbnail">
            <h5 class="text-info">Jonny Doo</h5>
            <p class="text-muted">CIO</p>
          </li>
        </ul>
      </div>
    </div>
</section>
<section id="embeditem" >
	<div class="embed-responsive embed-responsive-16by9">
  <iframe class="embed-responsive-item" src="" allowfullscreen></iframe>
</div>
</section>
<section id="newsletter" class="text-center">
  <h4>Stay connected with us. Join the newsletter to receive fresh info.</h4>
  <form class="form-inline" method="POST">
    <div class="form-group">
      <input class="form-control" placeholder="You name">
    </div>
    <div class="form-group">
      <input class="form-control" placeholder="Your email">
    </div>
    <button type="submit" class="btn btn-primary">Join now!</button>
  </form>
</section>
<footer>
  <div class="container">
    <div class="col-sm-2">
      <img src="imgs/logo.png" class="img-responsive">
    </div>
    <div class="col-sm-2">
      <h5>The company</h5>
      <ul class="list-unstyled">
        <li><a href="#">Documentation</a></li>
        <li><a href="#">Packt publisher</a></li>
        <li><a href="#">About us</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </div>
    <div class="col-sm-2">
      <h5>Social</h5>
      <ul class="list-unstyled">
        <li><a href="#">Facebook</a></li>
        <li><a href="#">Twitter</a></li>
        <li><a href="#">Blog</a></li>
      </ul>
	  </div>
    <div class="col-sm-2">
      <h5>Support</h5>
      <ul class="list-unstyled">
        <li><a href="#">Contact</a></li>
        <li><a href="#">Privacy police</a></li>
        <li><a href="#">Terms & conditions</a></li>
        <li><a href="#">Help desk</a></li>
      </ul>
    </div>
    <div class="col-sm-4">
      <address>
        <strong>Name, Inc.</strong>
        Address line 1<br>
        Address line 2<br>
        <abbr title="Phone">P:</abbr> (123) 456-7890
      </address>
    </div>
  </div>
</footer>
</body>
</html>

