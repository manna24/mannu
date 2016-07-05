<%@ include file="header.jsp"%>
<div class="col-md-8 col-sm-6 col-xs-12 personal-info"
	style="padding-left: 200px;">

	<form:form action="contact" commandName="sendMessage" method="POST">
        <form:errors path="name" cssStyle="#ff0000" />
		<label for="name">Your Name:</label>
		<input type="text" name="name" class="form-control" placeholder="Name" id="name">
         
		<label for="email">Email:</label>
		<input type="text" name="email" class="form-control" placeholder="Email" id="email">

		<label for="mobile">Mobile:</label>
		<input type="number" name="mobile" class="form-control" placeholder="Mobile" id="mobile">

		<label for="message">Message:</label>
		<textarea class="form-control" name="message" rows="5"
			placeholder="Your Message" id="message"></textarea>
		<br>
		<input type="submit" class="btn btn-success" value="Send Message">

		<a href="<spring:url value="/"/>" class="btn btn-warning btn-large">Cancel</a>

	</form:form>
</div>