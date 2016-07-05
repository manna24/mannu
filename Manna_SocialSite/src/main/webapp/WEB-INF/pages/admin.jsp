<%@ include file="header.jsp" %>
<script type="text/javascript">
$(function(){

	$('#slide-submenu').on('click',function() {			        
        $(this).closest('.list-group').fadeOut('slide',function(){
        	$('.mini-submenu').fadeIn();	
        });
        
      });

	$('.mini-submenu').on('click',function(){		
        $(this).next('.list-group').toggle('slide');
        $('.mini-submenu').hide();
	})
})
</script>
<br><br>

<div class="container">
	<div class="row">
		<div class="col-sm-4 col-md-3 sidebar">
    <div class="mini-submenu">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </div>
    <div class="list-group">
        <span class="list-group-item active">
            Admin Menus
            <span class="pull-right" id="slide-submenu">
                <i class="fa fa-times"></i>
            </span>
        </span>
        <a href="${pageContext.request.contextPath}/allUsers" class="list-group-item">
            <i class="fa fa-comment-o"></i> All Users
        </a>
        <a href="${pageContext.request.contextPath}/post" class="list-group-item">
            <i class="fa fa-search"></i> All Posts
        </a>
        <a href="${pageContext.request.contextPath}/allMessages" class="list-group-item">
             <i class="fa fa-envelope"></i>All Messages
        </a>
        <a href="" class="list-group-item">
            <i class="fa fa-user"></i>Total Users<span class="badge">${uCount}</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-bar-chart-o"></i> Total Posts<span class="badge">${pCount}</span>
        </a>
        <a href="#" class="list-group-item">
            <i class="fa fa-envelope"></i>Total Messages<span class="badge">${cCount}</span>
        </a>
         <a href="#" class="list-group-item">
            <i class="fa fa-user"></i>Online Users<span class="badge">1</span>
        </a>
    </div>  
         
</div>
 <div class="col-md-8 col-sm-6 col-xs-12 personal-info"
	style="padding-left: 200px;">
	
	</div>
	</div>
</div>
<%@ include file="footer.jsp" %>