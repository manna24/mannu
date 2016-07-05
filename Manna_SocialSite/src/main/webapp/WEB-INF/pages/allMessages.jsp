<%@ include file="header.jsp" %>
	<style>
h1 {
	border-bottom: 3px solid #cc9900;
	color: #996600;
	font-size: 30px;
}

table, th, td {
	border: 1px solid grey;
	border-collapse: collapse;
	padding: 5px;
}

table tr:nth-child(odd) {
	background-color: #f1f1f1;
}

table tr:nth-child(even) {
	background-color: #ffffff;
}
</style>
<div style="padding-top: 50px;height: 400px;">
<table id="myTable" class="span5 center-table">
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>Email</th>
		<th>Mobile</th>
		<th>Message</th>
		<th>Operation</th>

	</tr>
	<c:if test="${not empty message}">

		<c:forEach var="user" items="${message}">
			<tr>
				<td><c:out value="${user.id}"></c:out></td>
				<td><c:out value=" ${user.name}"></c:out></td>
				<td><c:out value=" ${user.email}"></c:out></td>
				<td><c:out value=" ${user.mobile}"></c:out></td>
				<td><c:out value=" ${user.message}"></c:out></td>
				<td><a href="<spring:url value="/message?id=${user.id}" />"
				class="btn btn-danger"> <span	class="glyphicon-info-sign glyphicon"> </span> Delete
			  </a></td>
			</tr>
		</c:forEach>
	</c:if>
</table>
</div>
<%@ include file="footer.jsp" %>