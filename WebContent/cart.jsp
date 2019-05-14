<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import='java.util.List'%>
<%@ page import='java.util.ArrayList'%>
<%@ page import='Module.FoodBean'%>
<%@ page import='Module.CartBean'%>
<%@ page import='DAO.CartDAO'%>
<%@ page import='DAO.FoodDAO'%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cart</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="css/util.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
</head>
<body class="animsition">

	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
		<div class="container-menu-desktop">
			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">Enjoy your feast</div>

					<div class="right-top-bar flex-w h-full">
						<a href="index.jsp" class="flex-c-m trans-04 p-lr-25"> Home </a> <a
							href="logout" class="flex-c-m trans-04 p-lr-25"> Log Out </a>
					</div>
				</div>
			</div>

			<div class="wrap-menu-desktop how-shadow1">
				<nav class="limiter-menu-desktop container">

					<!-- Logo desktop -->
					<a href="index.jsp" class="logo"> <img src="images/logo.png"
						alt="IMG-LOGO">
					</a>

					<!-- Icon header -->
					<div class="wrap-icon-header flex-w flex-r-m"></div>
				</nav>
			</div>
		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="index.jsp"><img src="images/logo.png" alt="IMG-LOGO"></a>
			</div>



			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">Enjoy your feast</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">

						<a href="index.jsp" class="flex-c-m p-lr-10 trans-04"> Home </a> <a
							href="logout" class="flex-c-m p-lr-10 trans-04"> Logout </a>

					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li><a href="index.jsp">Home</a> <span
					class="arrow-main-menu-m"> <i class="fa fa-angle-right"
						aria-hidden="true"></i>
				</span></li>
			</ul>
		</div>

	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>
	</div>





	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" action="confirmation" method="post">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Food</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-4">Quantity</th>
									<!-- <th class="column-5">Subtotal</th> -->
								</tr>
								<%
									int custId = Integer.parseInt(session.getAttribute("custId").toString());
								%>
								<%
									List<CartBean> cartList = CartDAO.getCart(custId);
								%>
								<%
									for (int i = 0; i < cartList.size(); ++i) {
								%>
								<% String itemName = cartList.get(i).getItemName(); %>
								<% int itemId = FoodDAO.getFoodId(itemName); %>
								<tr class="table_row" id="<%= itemId %>">
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="<%=cartList.get(i).getImg()%>" alt="IMG">
										</div>
									</td>
									<td class="column-2" name="foodName"><%=cartList.get(i).getItemName()%></td>
									<td class="column-3">$<span class="foodPrice"><%=cartList.get(i).getPrice()%></span></td>
									<td class="column-4">

										<div >

											<input class="mtext-104 cl3 txt-center num-product cartchange"
												type="number" name="num-product" id="<%=cartList.get(i).getItemName()%>"
												value="<%=cartList.get(i).getQuantity()%>">

										</div>

									</td>
									
									<!--% String subtotal = "s" + cartList.get(i).getItemName(); %-->
									
									<!--<td class="column-5">$<span  id="s<%= cartList.get(i).getItemName() %>" ><%= cartList.get(i).getPrice() * cartList.get(i).getQuantity() %></span></td>  -->
									<td>
									<div id="delete-food">
									
										<button type="button" class="btn btn-danger delete" id="<%= itemId %>">Delete</button>
									</div>
									</td>
								</tr>
								<%
									}
								%>
							</table>
						</div>


					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div
						class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>

						

						<div class="flex-w flex-t bor12 p-t-15 p-b-30"></div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30"></div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2"> Total: </span>
							</div>
						<% int currentId = Integer.parseInt(session.getAttribute("custId").toString()); %>
						<% int total = CartDAO.getTotal(currentId); %>
							<div class="size-209 p-t-1">
								$ <span class="mtext-110 cl2" id="totalprice"> <%= total %> </span>
							</div>
						</div>

						<button
							class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" >
							Proceed to Checkout</button>
					</div>
				</div>
			</div>
		</div>
	</form>







	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
	$(".cartchange").each(function(index) {
		var oldCount = $(".cartchange").val();
		oldCount = parseInt(oldCount);
		var price = $(".foodPrice").text();
		price = parseInt(price);
		//var oldtotal = $('#totalprice').text();
		$(this).on('change', function() {
			var newCount = $(this).val();
			var foodName = $(this).attr("id");
			$.ajax({
	             type:'POST',
	             data: {
	                 newCount : newCount,
	                 foodName : foodName
	             },
	             url:'updatecart',
	             success : function(resp){
	          		var arr = resp.split(',');
	          		var Count = arr[0];
	          		var total = arr[1];
	          		var currentId = '#' + foodName;
	          		var subtotalId = 's' + foodName;
	          		$(currentId).text(Count);
	          		$('#totalprice').text(total);
	          		//$(".subtotal").text(subtotal);
	          		//console.log(Count);
	          		//console.log(subtotal);
	          		//total += ((Count - oldCount) * price);
	          		//console.log(total);
	          		//$("#totalprice").text(total);
	             }
	         });
		});	
	})
	
	
	$(".delete").each(function(index) {
		$(this).on('click', function() {
			
			var foodid = $(this).attr('id');
			$.ajax({
				type:'POST',
				data: {
					deleteId : foodid
				},
				url:'deletecart',
	             success : function(resp){
	          		//var arr = resp.split(',');
	          		//var totalqty = arr[0];
	          		//var subtotal = arr[1];
	          		//var row = 'r'+id;
	          		var row = foodid;
	          		var total = resp;
	          		$('#' + row).remove();
	          		$('#totalprice').text(total);
	          		//$('#'+row).remove();
	          		//$('#numberid').text(totalqty);
	          		//$('#subtotal').text(subtotal);
	             }
	         });
		});
	})
	</script>
	
	<script>
		$(".js-select2").each(function() {
			$(this).select2({
				minimumResultsForSearch : 20,
				dropdownParent : $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function() {
			$(this).css('position', 'relative');
			$(this).css('overflow', 'hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed : 1,
				scrollingThreshold : 1000,
				wheelPropagation : false,
			});

			$(window).on('resize', function() {
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>