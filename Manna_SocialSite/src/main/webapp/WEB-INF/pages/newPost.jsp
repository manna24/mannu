<%@ include file="header.jsp"%>

<div class="col-md-8 col-sm-6 col-xs-12 personal-info"
	style="padding-left: 200px;">
	
	<form:form action="addPost" commandName="addpost">

		<label for="title">Title:</label>
		<input type="text" name="title" class="form-control"
			placeholder="Write Title Here" id="title">


		<label for="comment">Comment:</label>
		<textarea class="form-control" name="content" rows="5"
			placeholder="Write Comment Here" id="comment"></textarea>
		<br>
		<input type="submit" class="btn btn-success" value="Post Comment">

		<a href="<spring:url value="/userProfile"/>"
			class="btn btn-warning btn-large">Cancel</a>

	</form:form>
</div>