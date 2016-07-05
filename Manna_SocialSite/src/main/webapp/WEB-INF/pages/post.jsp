<%@ include file="header.jsp"%>
<style>
#post{
    padding-left: 100px;
    
}

</style>
<div id="post">
<h2 style="color: blue;font-size: 35px;padding-left: 300px;">
  All Posts
</h2>
<c:if test="${not empty posts}">
<c:forEach var="post" items="${posts}">
<p>Post Title: ${post.title}</p>
<P>Message :${post.content}</P>
<p>By :${post.postUser} at &nbsp;${post.date}</p>
------------------------------------------------------------------------
</c:forEach>
</c:if>
<c:if test="${pageContext.request.userPrincipal.name == null}">
	<p>
		Please <a href="<c:url value="/login" />">Sign in</a> to post comment
	</p>
</c:if>
</div>
<%@ include file="footer.jsp" %>