<%@ include file="header.jsp" %>

  <%-- <div class="row">
    <!-- left column -->
    <form:form  action="edituser/${users.userid }" class="form-horizontal" commandName="user" method="POST" enctype="multipart/form-data">
    <div class="col-md-2 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="${pageContext.request.contextPath}/resources/images/${pageContext.request.userPrincipal.name}.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Upload a different photo...</h6>
        <input type="file" class="text-center center-block well well-sm">
      </div>
    </div>
    <!-- edit form column -->
    <div class="col-md-8 col-sm-6 col-xs-12 personal-info" style="padding-left: 300px;">
    
      <h2>Personal info</h2>
        <div class="form-group">
          <label class="col-lg-3 control-label">User ID</label>
          <div class="col-lg-8">
            <input class="form-control" value="${users.userid}" disabled="disabled"/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Username</label>
          <div class="col-lg-8">
            <input class="form-control" value="${users.username}" disabled="disabled"/>
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Password:</label>
          <div class="col-lg-8">
            <input  class="form-control" value="${users.password}" type="text" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Email:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${users.email}" type="text">
          </div>
        </div>
        <div class="form-group">
          <label class="col-lg-3 control-label">Mobile:</label>
          <div class="col-lg-8">
            <input class="form-control" value="${users.mobile}" type="number">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-lg-3 control-label">Address:</label>
          <div class="col-lg-8">
            <input class="form-control"  value="${users.address}" type="text">
          </div>
        </div>
        
        <div class="form-group">
          <label class="col-md-3 control-label"></label>
          <div class="col-md-8">
            <input class="btn btn-primary" value="Save Changes" type="submit">
            <span></span>
            <input class="btn btn-default" value="Cancel" type="reset">
          </div>
            </div>
        </div>
      </form:form>
    </div>
 --%>
 
 <div>
  <div class="col-md-2 col-sm-6 col-xs-12">
      <div class="text-center">
        <img src="${pageContext.request.contextPath}/resources/images/${pageContext.request.userPrincipal.name}.png" class="avatar img-circle img-thumbnail" alt="avatar">
        <h6>Hello Dear : ${pageContext.request.userPrincipal.name}</h6>
      
      </div>
    </div>
    <br>
    <br>
 <div class="col-md-8 col-sm-6 col-xs-12 personal-info" style="padding-left: 300px;">
			<form:form method="POST" action="edituser/${users.userid}" commandName="user" class="form-horizontal" enctype="multipart/form-data" >

				<table>
					<tr>
						<td>User Id:</td>
						<td><form:input path="userid" value="${users.userid}" class="form-control"
							disabled="true" /></td>
					</tr>
					<tr>
						<td>Username:</td>
						<td><form:input path="username" value="${users.username}" disabled="true" class="form-control"/></td>
					</tr>
					<tr>
						<td>Password:</td>
						<td><form:input path="password" value="${users.password}" class="form-control"
						 /></td>
					</tr>
					<tr>
						<td>Email:</td>
						<td><form:input path="email" value="${users.email}" class="form-control" /></td>
					</tr>
					<tr>
						<td>Mobile:</td>
						<td><form:input path="mobile" value="${users.mobile}" class="form-control"/></td>
					</tr>
					<tr>
						<td>Address:</td>
						<td><form:input path="address" value="${users.address}" class="form-control"
							 /></td>
					</tr>
					<tr>
						<td>Profile Pic:</td>
						<td><form:input type="file" path="image" class="form-control"/></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Edit Profile"
							class="btn btn-success" /></td>
					</tr>
				</table>

			</form:form>
			</div>
		</div>
