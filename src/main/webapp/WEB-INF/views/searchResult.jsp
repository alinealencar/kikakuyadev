<!-- Change feature variable -->
<%! String feature = "Search" ;%>
<% session.setAttribute("feature", feature); %>
<% session.setAttribute("title", "KIKAKUYA - " + feature); %>
<jsp:include page="/WEB-INF/includes/head.jsp" />
<jsp:include page="/WEB-INF/includes/header.jsp"/>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page isELIgnored="false" %>
<div class="container">
<!-- body contents start -->
	<h2>Search Results</h2>
	<form action="search" method="post" >
		<div class="form-group row" style="margin-top: 50px;">		
			<div class="col-sm-5 text-center">			
				<div>
					<input name="category" placeholder="Category" class="col-12">
					<br><br>
				</div>
			</div>
			<div class="col-sm-5 text-center">
				<div>
					<input name="location" placeholder="Location" class="col-12">
					<br><br>
				</div>
			</div>
			<div class="col-sm-2 text-center">
				<button type="submit" class="btn btn-info">
      				<span class="material-icons align-bottom" style="font-size: 150%;">search</span><span class="align-text-bottom"> Search</span>
   				</button>
			</div>				
		</div>
	</form>
	<div class="${(searchError != null) ? 'alert alert-danger':''}" role="alert">${searchError}</div>

	<ul style="margin-bottom: 0px; list-style: none;">
		<c:forEach items="${vendors}" var="vendor" >
			<li class="row">
				<div class="col-md-3">
					<img src="${vendor.imageURL}" alt="Vendor product" height="150px" width="150px">
					<button id="btnAddVendor" type="button" class="btn btn-link float-right d-block d-md-none" name="addVendor">
      					<span class="material-icons" style="font-size: 300%;">add_circle</span>
   					</button>
				</div>
				<div class="col-md-6">
					<h3>${vendor.name}</h3>
					<div>
						<c:choose>
			  				<c:when test="${vendor.rating == 0}">
			  					<img src="resources/images/search/regular_0.png" alt="zero star">
			  				</c:when>
			  				<c:when test="${vendor.rating == 1}">
			  					<img src="resources/images/search/regular_1.png" alt="one star">
			  				</c:when>
			  				<c:when test="${vendor.rating == 1.5}">
			  					<img src="resources/images/search/regular_1_half.png" alt="one and a half stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 2}">
			  					<img src="resources/images/search/regular_2.png" alt="two stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 2.5}">
			  					<img src="resources/images/search/regular_2_half.png" alt="two and a half stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 3}">
			  					<img src="resources/images/search/regular_3.png" alt="three stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 3.5}">
			  					<img src="resources/images/search/regular_3_half.png" alt="three and a half stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 4}">
			  					<img src="resources/images/search/regular_4.png" alt="four stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 4.5}">
			  					<img src="resources/images/search/regular_4_half.png" alt="four and a half stars">
			  				</c:when>
			  				<c:when test="${vendor.rating == 5}">
			  					<img src="resources/images/search/regular_5.png"  alt="five stars">
			  				</c:when>
			  			</c:choose><br>
		  			</div>
					${vendor.address}<br>
					${vendor.phoneNo}<br>
					<a href="${vendor.website}"><img border="0" alt="Yelp logo" src="resources/images/search/yelp_logo.png"  width="80" height="50"></a>
				</div>
				<div class="col-md-3">
					<button id="btnAddVendor" type="button" class="btn btn-link d-none d-md-block" name="addVendor">
      					<span class="material-icons" style="font-size: 300%;">add_circle</span>
   					</button>
				</div>
		</li>
		<hr>
		</c:forEach>
	</ul>
<!-- body contents end -->
</div>
<jsp:include page="/WEB-INF/includes/footer.jsp"/>