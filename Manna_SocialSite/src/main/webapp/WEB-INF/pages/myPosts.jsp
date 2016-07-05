<%@ include file="header.jsp" %>

<style>
#post{
    padding-left: 100px;
    
}

</style>
<div id="post">
<h2 style="color: blue;font-size: 35px;padding-left: 300px;">
  My Posts
</h2>
<c:if test="${not empty myPosts}">

<c:forEach var="post" items="${myPosts}">
<div>
<p>Post Title: ${post.title}</p>
<P>Message :${post.content}</P>
<p>By :${post.postUser} at &nbsp;${post.date}</p>
<p><a href="${pageContext.request.contextPath}/newPost">Reply</a>
</div>
</c:forEach>

</c:if>

</div>