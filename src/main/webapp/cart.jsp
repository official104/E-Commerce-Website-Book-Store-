<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@page import="com.DAO.CartDAO"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.*"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="all_componets/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="all_componets/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
			<c:remove var="succMsg" scope="session"/>

	</c:if>
	
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger" role="alert">${failedMsg }</div>
			<c:remove var="failedMsg" scope="session"/>

	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>

						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u=(User)session.getAttribute("userobj");
								
								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart=dao.getBookByUser(u.getId());
								Double totalPrice=0.00;
								for(Cart c:cart)
									
								{
								totalPrice=c.getTotalPrice();
								%>
								<tr>
									<th scope="row"><%=c.getBookName() %></th>
									<td><%=c.getAuthor() %></td>
									<td><%=c.getPrice() %></td> 
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUid()%>&&cid=<%=c.getCid() %>"
										class="btn btn-small btn-danger">Remove</a></td>
								</tr> 

								<%}
								%>
								<tr>
									<td style="font-weight: bold; color: green">Total Price</td>
									<td></td>
									<td></td>


									<td style="border-bottom: 2px solid grey;"><%=totalPrice %></td>

								</tr>



							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success ">User details</h3>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text"
									class="form-control" id="inputEmail4" value="">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input type="email"
									class="form-control" id="inputPassword4">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Phone</label> <input type="number"
									class="form-control" id="inputEmail4">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input type="text"
									class="form-control" id="inputPassword4">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark</label> <input type="text"
									class="form-control" id="inputEmail4">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="text"
									class="form-control" id="inputPassword4">
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text"
									class="form-control" id="inputEmail4">
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Zipcode</label> <input type="number"
									class="form-control" id="inputPassword4">
							</div>
						</div>

						<div class="form-group">
							<label>Payment mode</label> <select class="form-control">
								<option>--select---</option>
								<option>Cash on Delivery</option>

							</select>

						</div>
						<div class="text-center">
							<button class="btn btn-warning">Order Now</button>
							<a href="index.jsp" class="btn btn-success">Continue Shopping</a>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>