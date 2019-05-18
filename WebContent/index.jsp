<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import='java.util.List'%>
<%@ page import='java.util.ArrayList'%>
<%@ page import='Module.FoodBean'%>
<%@ page import='Module.CartBean'%>
<%@ page import='DAO.FoodDAO'%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chef Tong | Home</title>

<!-- Favicon -->
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon">

<!-- Font awesome -->
<link href="assets/css/font-awesome.css" rel="stylesheet">
<!-- Bootstrap -->
<link href="assets/css/bootstrap.css" rel="stylesheet">
<!-- Slick slider -->
<link rel="stylesheet" type="text/css" href="assets/css/slick.css">
<!-- Date Picker -->
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap-datepicker.css">
<!-- Fancybox slider -->
<link rel="stylesheet" href="assets/css/jquery.fancybox.css"
	type="text/css" media="screen" />
<!-- Theme color -->
<link id="switcher" href="assets/css/theme-color/default-theme.css"
	rel="stylesheet">

<!-- Main style sheet -->
<link href="style.css" rel="stylesheet">


<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Tangerine'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Prata'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
	<!-- Pre Loader -->
	<div id="aa-preloader-area">
		<div class="mu-preloader">
			<img src="assets/img/preloader.gif" alt=" loader img">
		</div>
	</div>
	<!--START SCROLL TOP BUTTON -->
	<a class="scrollToTop" href="#"> <i class="fa fa-angle-up"></i> <span>Top</span>
	</a>
	<!-- END SCROLL TOP BUTTON -->

	<!-- Start header section -->
	<header id="mu-header">
		<nav class="navbar navbar-default mu-main-navbar" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- LOGO -->
					<a class="navbar-brand" href="index.html"><img
						src="assets/img/logo.png" alt="Logo img"></a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul id="top-menu" class="nav navbar-nav navbar-right mu-main-nav">
						<li></li>
						<li><a href="#mu-slider">HOME</a></li>
						<li><a href="#mu-about-us">ABOUT US</a></li>
						<li><a href="#mu-restaurant-menu">Category</a></li>
						<%
							if (session.getAttribute("username") == null) {
						%>
						<li><a href="login.jsp">Login</a></li>
						<li><a href="register.jsp">Register</a></li>
						<%
							} else if (session.getAttribute("username") != null) {
						%>
						<li><a class="dropdown-toggle" data-toggle="dropdown"
							href="blog-archive.html" id="welcome">Welcome, <%=session.getAttribute("username").toString()%>
								<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="cart.jsp">My Cart</a></li>
								<li><a href="logout">Logout</a></li>
							</ul> <%
 	}
 %>
 						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
	</header>
	<!-- End header section -->


	<!-- Start slider  -->
	<section id="mu-slider">
		<div class="mu-slider-area">
			<!-- Top slider -->
			<div class="mu-top-slider">
				<!-- Top slider single slide -->
				<div class="mu-top-slider-single">
					<img src="assets/img/slider/1.jfif" alt="img">
					<!-- Top slider content -->
					<div class="mu-top-slider-content">
						<span class="mu-slider-small-title">Welcome</span>
						<h2 class="mu-slider-title">To Chef Tong</h2>
					</div>
					<!-- / Top slider content -->
				</div>
				<!-- / Top slider single slide -->
				<!-- Top slider single slide -->
				<div class="mu-top-slider-single">
					<img src="assets/img/slider/2.jfif" alt="img">
					<!-- Top slider content -->
					<div class="mu-top-slider-content">
						<span class="mu-slider-small-title">The Real</span>
						<h2 class="mu-slider-title">Chinese Food</h2>
					</div>
					<!-- / Top slider content -->
				</div>
				<!-- / Top slider single slide -->
				<!-- Top slider single slide -->
				<div class="mu-top-slider-single">
					<img src="assets/img/slider/3.jfif" alt="img">
					<!-- Top slider content -->
					<div class="mu-top-slider-content">
						<span class="mu-slider-small-title">Delicious</span>
						<h2 class="mu-slider-title">SPICY Food</h2>
					</div>
					<!-- / Top slider content -->
				</div>
				<!-- / Top slider single slide -->
			</div>
		</div>
	</section>
	<!-- End slider  -->

	<!-- Start About us -->
	<section id="mu-about-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mu-about-us-area">
						<div class="mu-title">
							<span class="mu-subtitle">Discover</span>
							<h2>ABOUT US</h2>
							<i class="fa fa-spoon"></i> <span class="mu-title-bar"></span>
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="mu-about-us-left">
									<p>Welcome to Chef Tong's Kitchen</p>
									<ul>
										<li>You can have truely taste experience like you were in
											China.</li>
										<li>We provide splendid Chinese food with 100%
											Professionals.</li>
										<li>The meat dish in our restaurant is fat and not
											greasy.</li>
										<li>The veggie can also have the most fresh vegetable
											here.</li>
									</ul>
									<p>You can come here to have the food and we also deliver.</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="mu-about-us-right">
									<ul class="mu-abtus-slider">
										<li><img src="assets/img/about-us/abtus-img-1.jpg"
											alt="img"></li>
										<li><img src="assets/img/about-us/abtus-img-2.jpg"
											alt="img"></li>
										<li><img src="assets/img/about-us/abtus-img-3.jpg"
											alt="img"></li>
										<li><img src="assets/img/about-us/abtus-img-4.jpg"
											alt="img"></li>
										<li><img src="assets/img/about-us/abtus-img-5.jpg"
											alt="img"></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End About us -->



	<!-- Start Restaurant Menu -->
	<section id="mu-restaurant-menu">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mu-restaurant-menu-area">
						<div class="mu-title">
							<span class="mu-subtitle">Discover</span>
							<h2>Category</h2>
							<i class="fa fa-spoon"></i> <span class="mu-title-bar"></span>
						</div>
						<div style="text-align:center; vertical-align:middel;">
							<input type="text" name="food_search" id="food_search" placeholder="what would you like today">
						</div>
						<div class="mu-restaurant-menu-content">
							<ul class="nav nav-tabs mu-restaurant-menu">
								<li class="active"><a href="#Sichuan_Food"
									data-toggle="tab">Sichuan Food</a></li>
								<li><a href="#Shandong_Food" data-toggle="tab">Shandong
										Food</a></li>
								<li><a href="#Guangdong_Food" data-toggle="tab">Guangdong
										Food</a></li>
								<li><a href="#Huaiyang_Food" data-toggle="tab">Huaiyang
										Food</a></li>
								<li><a href="#Hunan_Food" data-toggle="tab">Hunan Food</a></li>
							</ul>

							<!-- Tab panes -->
							<%
								List<FoodBean> totalFood = FoodDAO.getFood();
							%>
							<%
								List<FoodBean> sichuan = new ArrayList<>();
							%>
							<%
								List<FoodBean> shandong = new ArrayList<>();
							%>
							<%
								List<FoodBean> guangdong = new ArrayList<>();
							%>
							<%
								List<FoodBean> huaiyang = new ArrayList<>();
							%>
							<%
								List<FoodBean> hunan = new ArrayList<>();
							%>
							<%
								for (int i = 0; i < totalFood.size(); ++i) {
							%>
							<%
								FoodBean food = totalFood.get(i);
							%>
							<%
								if (food.getCategoryId() == 1001) {
							%>
							<%
								sichuan.add(food);
							%>
							<%
								} else if (food.getCategoryId() == 1002) {
							%>
							<%
								shandong.add(food);
							%>
							<%
								} else if (food.getCategoryId() == 1003) {
							%>
							<%
								guangdong.add(food);
							%>
							<%
								} else if (food.getCategoryId() == 1004) {
							%>
							<%
								huaiyang.add(food);
							%>
							<%
								} else if (food.getCategoryId() == 1005) {
							%>
							<%
								hunan.add(food);
							%>
							<%
								}
							%>
							<%
								}
							%>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="Sichuan_Food">
									<div class="mu-tab-content-area">
										<div class="row">
											<div class="col-md-6">
												<div class="mu-tab-content-left">
													<ul class="mu-menu-item-nav">
														<%
															for (int i = 0; i < sichuan.size(); ++i) {
														%>
														<li>
															<div class="media">
																<div class="media-left">
																	<a href="#"> <img class="media-object"
																		src="<%=sichuan.get(i).getImg()%>" alt="img" />
																	</a>
																</div>
																<div class="media-body">
																	<h4 class="media-heading"><%=sichuan.get(i).getItemName()%></h4>
																	<span class="mu-menu-price">$<%=sichuan.get(i).getPrice()%></span><br>
																	<span class="mu-menu-count">Count : <%=sichuan.get(i).getItemCount()%></span><br>
																	<form action="cart" method="post">
																		<input type="hidden" name="img"
																			value="<%=sichuan.get(i).getImg()%>" /> <input
																			type="hidden" name="item_name"
																			value="<%=sichuan.get(i).getItemName()%>" /> <input
																			type="hidden" name="item_count"
																			value="<%=sichuan.get(i).getItemCount()%>" /> <input
																			type="hidden" name="price"
																			value="<%sichuan.get(i).getPrice();%>" /> <select
																			name="buy_count">
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																		</select>
																		<button class="mu-menu-addtocart">Add to Cart</button>
																	</form>
																</div>
															</div>
														</li>
														<%
															}
														%>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade " id="Shandong_Food">
									<div class="mu-tab-content-area">
										<div class="row">
											<div class="col-md-6">
												<div class="mu-tab-content-left">
													<ul class="mu-menu-item-nav">
														<%
															for (int i = 0; i < shandong.size(); ++i) {
														%>
														<li>
															<div class="media">
																<div class="media-left">
																	<a href="#"> <img class="media-object"
																		src="<%=shandong.get(i).getImg()%>" alt="img" />
																	</a>
																</div>
																<div class="media-body">
																	<h4 class="media-heading"><%=shandong.get(i).getItemName()%></h4>
																	<span class="mu-menu-price">$<%=shandong.get(i).getPrice()%></span><br>
																	<span class="mu-menu-count">Count : <%=shandong.get(i).getItemCount()%></span>
																	<form action="cart" method="post">
																		<input type="hidden" name="img"
																			value="<%=shandong.get(i).getImg()%>" /> <input
																			type="hidden" name="item_name"
																			value="<%=shandong.get(i).getItemName()%>" /> <input
																			type="hidden" name="item_count"
																			value="<%=shandong.get(i).getItemCount()%>" /> <input
																			type="hidden" name="price"
																			value="<%shandong.get(i).getPrice();%>" /> <select
																			name="buy_count">
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																		</select>
																		<button class="mu-menu-addtocart">Add to Cart</button>
																	</form>
																</div>
															</div>
														</li>
														<%
															}
														%>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade " id="Guangdong_Food">
									<div class="mu-tab-content-area">
										<div class="row">
											<div class="col-md-6">
												<div class="mu-tab-content-left">
													<ul class="mu-menu-item-nav">
														<%
															for (int i = 0; i < guangdong.size(); ++i) {
														%>
														<li>
															<div class="media">
																<div class="media-left">
																	<a href="#"> <img class="media-object"
																		src="<%=guangdong.get(i).getImg()%>" alt="img" />
																	</a>
																</div>
																<div class="media-body">
																	<h4 class="media-heading"><%=guangdong.get(i).getItemName()%></h4>
																	<span class="mu-menu-price">$<%=guangdong.get(i).getPrice()%></span><br>
																	<span class="mu-menu-count">Count : <%=guangdong.get(i).getItemCount()%></span>
																	<form action="cart" method="post">
																		<input type="hidden" name="img"
																			value="<%=guangdong.get(i).getImg()%>" /> <input
																			type="hidden" name="item_name"
																			value="<%=guangdong.get(i).getItemName()%>" /> <input
																			type="hidden" name="item_count"
																			value="<%=guangdong.get(i).getItemCount()%>" /> <input
																			type="hidden" name="price"
																			value="<%guangdong.get(i).getPrice();%>" /> <select
																			name="buy_count">
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																		</select>
																		<button class="mu-menu-addtocart">Add to Cart</button>
																	</form>
																</div>
															</div>
														</li>
														<%
															}
														%>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade " id="Huaiyang_Food">
									<div class="mu-tab-content-area">
										<div class="row">
											<div class="col-md-6">
												<div class="mu-tab-content-left">
													<ul class="mu-menu-item-nav">
														<%
															for (int i = 0; i < huaiyang.size(); ++i) {
														%>
														<li>
															<div class="media">
																<div class="media-left">
																	<a href="#"> <img class="media-object"
																		src="<%=huaiyang.get(i).getImg()%>" alt="img" />
																	</a>
																</div>
																<div class="media-body">
																	<h4 class="media-heading"><%=huaiyang.get(i).getItemName()%></h4>
																	<span class="mu-menu-price">$<%=huaiyang.get(i).getPrice()%></span><br>
																	<span class="mu-menu-count">Count : <%=huaiyang.get(i).getItemCount()%></span>
																	<form action="cart" method="post">
																		<input type="hidden" name="img"
																			value="<%=huaiyang.get(i).getImg()%>" /> <input
																			type="hidden" name="item_name"
																			value="<%=huaiyang.get(i).getItemName()%>" /> <input
																			type="hidden" name="item_count"
																			value="<%=huaiyang.get(i).getItemCount()%>" /> <input
																			type="hidden" name="price"
																			value="<%huaiyang.get(i).getPrice();%>" /> <select
																			name="buy_count">
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																		</select>
																		<button class="mu-menu-addtocart">Add to Cart</button>
																	</form>
																</div>
															</div>
														</li>
														<%
															}
														%>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="tab-pane fade " id="Hunan_Food">
									<div class="mu-tab-content-area">
										<div class="row">
											<div class="col-md-6">
												<div class="mu-tab-content-left">
													<ul class="mu-menu-item-nav">
														<%
															for (int i = 0; i < hunan.size(); ++i) {
														%>
														<li>
															<div class="media">
																<div class="media-left">
																	<a href="#"> <img class="media-object"
																		src="<%=hunan.get(i).getImg()%>" alt="img" />
																	</a>
																</div>
																<div class="media-body">
																	<h4 class="media-heading"><%=hunan.get(i).getItemName()%></h4>
																	<span class="mu-menu-price">$<%=hunan.get(i).getPrice()%></span><br>
																	<span class="mu-menu-count">Count : <%=hunan.get(i).getItemCount()%></span>
																	<form action="cart" method="post">
																		<input type="hidden" name="img"
																			value="<%=hunan.get(i).getImg()%>" /> <input
																			type="hidden" name="item_name"
																			value="<%=hunan.get(i).getItemName()%>" /> <input
																			type="hidden" name="item_count"
																			value="<%=hunan.get(i).getItemCount()%>" /> <input
																			type="hidden" name="price"
																			value="<%hunan.get(i).getPrice();%>" /> <select
																			name="buy_count">
																			<option value="1">1</option>
																			<option value="2">2</option>
																			<option value="3">3</option>
																		</select>
																		<button class="mu-menu-addtocart">Add to Cart</button>
																	</form>
																</div>
															</div>
														</li>
														<%
															}
														%>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Restaurant Menu -->
	<!-- Start Footer -->
  <footer id="mu-footer">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
        <div class="mu-footer-area">
           <div class="mu-footer-social">
            <a href="#"><span class="fa fa-facebook"></span></a>
            <a href="#"><span class="fa fa-twitter"></span></a>
            <a href="#"><span class="fa fa-google-plus"></span></a>
            <a href="#"><span class="fa fa-linkedin"></span></a>
            <a href="#"><span class="fa fa-youtube"></span></a>
          </div>
          <div class="mu-footer-copyright">
            <p>Designed by <a rel="nofollow" href="http://www.markups.io/">MarkUps.io</a></p>
          </div>         
        </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- End Footer -->
	
	<!-- jQuery library -->
	<script src="assets/js/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="assets/js/bootstrap.js"></script>
	<!-- Slick slider -->
	<script type="text/javascript" src="assets/js/slick.js"></script>
	<!-- Counter -->
	<script type="text/javascript" src="assets/js/waypoints.js"></script>
	<script type="text/javascript" src="assets/js/jquery.counterup.js"></script>
	<!-- Date Picker -->
	<script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script>
	<!-- Mixit slider -->
	<script type="text/javascript" src="assets/js/jquery.mixitup.js"></script>
	<!-- Add fancyBox -->
	<script type="text/javascript" src="assets/js/jquery.fancybox.pack.js"></script>

	<!-- Custom js -->
	<script src="assets/js/custom.js"></script>

</body>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(function(){
	$('#food_search').keydown(function(){
		$.get('getallfood', function(resp){
			var foodarr = JSON.parse(resp);
			//$.each(foodarr, function(index, value){
				//console.log(value);
				//$('#food_search').text(value);
			//})
			$( function() {
				console.log(foodarr);
				console.log("a");
			$('#food_search').autocomplete({
			      source: foodarr
			    });
			  } );
		});
	});
});
</script>
</html>