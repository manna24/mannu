<%@ include file="../header.jsp" %>
<div class="panel panel-default">
  <div class="panel-body">
    <form class="ng-pristine form-horizontal" data-ng-class="{submitted:form.newTopicForm.$submitted}"
          role="form" name="form.newTopicForm" novalidate data-ng-submit="addTopic();">
      <div class="row">
        <div class="col-lg-12">
          <input type="string" data-ng-model="topic.title" name="title" required
                 class="form-control ng-pristine ng-valid needsclick ng-touched"/>
        </div>
      </div>
      <br>
      <div class="row">
        <div class="col-lg-12">
                    <textarea rows="20" cols="20" data-ng-model="topic.body" name="body" required
                              class="form-control ng-pristine ng-valid needsclick ng-touched input-small"></textarea>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="alert alert-danger" data-ng-show="globalErrors != null && globalErrors.length > 0">
            <ul>
              <li data-ng-repeat="error in globalErrors">{{error}}</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-2">
          <input type="submit" class="btn btn-primary btn-block"/>
        </div>
        <div class="col-lg-2">
          <button data-ng-click="cancel()" class="btn btn-block" type="button">Cancel</button>
        </div>
        <div class="col-lg-4"></div>
      </div>
    </form>
  </div>
</div>

<%@ include file="../footer.jsp" %>