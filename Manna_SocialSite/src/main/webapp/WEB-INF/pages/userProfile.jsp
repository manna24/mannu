<%@ include file="header.jsp"%>

<div class="ContentWrapper">
	<div class="contenttopCurve"></div>
	<div class="ContentMiddleTile">
		<div class="ContentInnerWrapper">
			<!--Left Pane Begin-->
			<div class="LeftPane">
				<!--Store Catalog Begin-->
				<div class="StoreCataloge">
					<h2>Quick Links</h2>
					<ul>
						<li><a href="createForum">New Forum</a></li>
						<li><a href="forumPage">All Forum</a></li>
						<li><a href="viewForum">My Forum</a></li>
						<li><a href="calendar">Calendar</a></li>
						<li><a href="editUser">Update Profile</a></li>
						<li><a href="myPosts">My Posts</a></li>
						<li><a href="newPost">New Posts</a></li>
						<li><a href="application">Chat</a></li>
					</ul>

					<div class="StoreCataloge">
						<h2>Current News</h2>
						<div style="height: 303px; width: 179px; border: 1px solid blue;">
							<marquee scrollamount="2" direction="up" loop="true"
								onmouseover="stop()" onmouseout="start()">
								<p>Your test has been scheduled</p>
								<p>Get In touch with friends</p>
								<p>Check your Test Score</p>
								<p>Manage your Performance</p>
								<p>Participate in Quizes</p>
								<p>Earn with referals</p>
								<p>NITET on 25th January</p>
								<p>Bhavishya Jyoti Schollarship</p>
							</marquee>
						</div>
					</div>
				</div>
				<!--Store Catalog End-->


			</div>
			<!--Left Pane End-->
			<!--Middle Pane Begin-->
			<div class="MiddlePane">

				<br>

				<div id="calendar-wrap">

					<div id="calendar">
						<ul class="weekdays">
							<li>Sun</li>
							<li>Mon</li>
							<li>Tue</li>
							<li>Wed</li>
							<li>Thu</li>
							<li>Fri</li>
							<li>Sat</li>
						</ul>

						<!-- Days from previous month -->

						<ul class="days">
							<li class="day other-month">
								<div class="date">27</div>
							</li>
							<li class="day other-month">
								<div class="date">28</div>
								<div class="event">
									<div class="event-desc">HTML 5 lecture</div>
									<div class="event-time">1:00pm to 3:00pm</div>
								</div>
							</li>
							<li class="day other-month">
								<div class="date">29</div>
							</li>
							<li class="day other-month">
								<div class="date">30</div>
							</li>
							<li class="day other-month">
								<div class="date">31</div>
							</li>

							<!-- Days in current month -->

							<li class="day">
								<div class="date">1</div>
							</li>
							<li class="day">
								<div class="date">2</div>
								<div class="event">
									<div class="event-desc">Career Council</div>
									<div class="event-time">2:00pm to 5:00pm</div>
								</div>
							</li>
						</ul>
						<ul class="days">
							<li class="day">
								<div class="date">3</div>
							</li>
							<li class="day">
								<div class="date">4</div>
							</li>
							<li class="day">
								<div class="date">5</div>
							</li>
							<li class="day">
								<div class="date">6</div>
							</li>
							<li class="day">
								<div class="date">7</div>
								<div class="event">
									<div class="event-desc">Group Project meetup</div>
									<div class="event-time">6:00pm to 8:30pm</div>
								</div>
							</li>
							<li class="day">
								<div class="date">8</div>
							</li>
							<li class="day">
								<div class="date">9</div>
							</li>
						</ul>
						 <a
							href="<spring:url value="/${pageContext.request.contextPath}/calendar" />"
							class="btn btn-success btn-md"> <span
							class="glyphicon-info-sign glyphicon"> </span> Complete Month
						</a>

					</div>

				</div>

			</div>

		</div>

	</div>

</div>
<div class="ContentFooter">
	<%@ include file="footer.jsp"%>
</div>