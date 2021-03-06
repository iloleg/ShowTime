<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@include file="header.jsp"%>
<%@ page import="daou.ShowDaou" %>

			<section class="header_text sub">
			<img class="pageBanner" src="themes/images/pageBanner.png" alt="New products" >
				<h4><span>Show Timing Detail</span></h4>
			</section>
			
			<section class="main-content" id="main">
			<div class="row">
							<div class="span9">
								<ul class="nav nav-tabs center" id="myTab">
								<%@ page import="java.util.List" %>
								<%@ page import="java.util.ArrayList" %>
								<%
								List<String> list = new ArrayList<String>();
								ShowDaou d = new ShowDaou();
								list = d.getShowRecordsByQuery("SELECT DISTINCT TO_CHAR(show_date, 'DD/MON') dt "+
																"FROM SHOW_DETAIL WHERE movie_id ='"+request.getParameter("id")+"' "+
																"order by dt");
								for(String str:list){
								%>
									<li class="center"><a href="#time" class="center" ><%= str %></a></li>
								
								<%
								}
								%>
								</ul>							 
								<div class="tab-content">
									<div class="tab-pane" id="time">
										<table class="table table-striped shop_attributes">	
											<tbody id="timing" class = "text-center">
											
											</tbody>
										</table>
									</div>
								</div>							
							</div>
							
						<div class="span3 col">						
						<div class="block">
							<h4 class="title">
								<span class="pull-left"><span class="text">Offers</span></span>
								<span class="pull-right">
									<a class="left button" href="#myCarousel" data-slide="prev"></a><a class="right button" href="#myCarousel" data-slide="next"></a>
								</span>
							</h4>
							<div id="myCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="active item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">
													<span class="sale_tag"></span>												
													<img alt="" src="themes/images/offer.jpg" height="300px" width="500px">
												</div>
											</li>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails listing-products">
											<li class="span3">
												<div class="product-box">												
													<img alt="" src="themes/images/offer.png" height="300px" width="500px">
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						
					</div>
					</div>
					</section>
					<section id="footer-bar">
				<div class="row">
					<div class="span3">
						<h4>Navigation</h4>
						<ul class="nav">
							<li><a href="./index.jsp">Homepage</a></li>  
							<li><a href="./about.jsp">About Us</a></li>
							<li><a href="./contact.jsp">Contact Us</a></li>
							<% if(session.getAttribute("user")==null || session.getAttribute("user")==""){ %>
							<li><a href="#myModal" data-toggle="modal"
							data-target="#myModal">Login</a></li>	
							<% } else{ %>
							<li><a href="UlogOut" id="LogOut">LogOut</a></li>
							<% } %>							
						</ul>					
					</div>
					<div class="span4">
						<h4>My Account</h4>
						<ul class="nav">
							<li><a href="javascript:myAccountPage()">My Account</a></li>
							<li><a href="javascript:myAccountPage()">Booking History</a></li>
							<li><a href="#">Newsletter</a></li>
						</ul>
					</div>
					<div class="span5">
						<p class="logo"><img src="themes/images/logo.png" class="site_logo" alt=""></p>
						<p>showtime.com is an online movie and events ticket booking portal started and based in Bihar. It is a third party ticketing facility with presence in Muzaffarpur, Darbhanga and Patna. The company's online platform caters to ticket sales for movies as well as plays, concerts and sporting events. It was founded in 2018 and is headquartered in Muzaffarpur, Bihar.</p>
						<br/>
					</div>				
				</div>	
			</section>
			<section id="copyright">
				<span>Copyright 2018 &copy; Showtime Entertainment Pvt. Ltd. All Rights Reserved.</span>
			</section>
		</div>
		<script src="themes/js/common.js"></script>
		<script>
			
			var str,m_id;
			$(function () {
				$('#myTab a:first').tab('show');
				$('#myTab a').click(function (e) {
					e.preventDefault();
					$(this).tab('show');
					
					str = $('#myTab li.active').text();
					var m_id = <%= request.getParameter("id") %> ;
					
					$.ajax({
					       type: 'POST',
					       url: 'Timing.jsp',
					       data: { date : str,
					    	   		id : m_id},
					       success: function(response) {
					    	   $('#timing').html(response);

								$('.btn').click(function (e) {
									var show_id = $(this).attr('value');
									$.redirect("SeatPreview/index.jsp",{show_id : show_id});
								});
					       } 
					    });
				});
			});
		</script>
    </body>
</html>