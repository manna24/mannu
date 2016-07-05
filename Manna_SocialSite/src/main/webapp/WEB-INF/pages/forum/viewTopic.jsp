<%@ include file="../header.jsp" %>
<div class="panel panel-default">
  <div class="panel-body">
    <form class="ng-pristine form-horizontal" data-ng-class="{submitted:form.editTopicForm.$submitted}"
          role="form" name="form.editTopicForm" novalidate>
      <div class="row">
        <div class="col-lg-12">
          <h4>
            <div data-ng-show="!editingTopic">{{topic.title}}</div>
            <div class="col-lg-12" data-ng-show="editingTopic">
              <input type="string" data-ng-model="topic.title" name="title" required
                     class="form-control ng-pristine ng-valid needsclick ng-touched"/>
            </div>
            <span><small>by: <a>{{topic.createdBy.name}}</a></small></span>
            <span><small>on: {{topic.createdOn | date:'medium'}}</small></span>
          </h4>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="panel panel-info">
            <div class="panel-body">
              <div data-ng-show="!editingTopic">
                {{topic.body}}
              </div>
              <div class="col-lg-10" data-ng-show="editingTopic">
                    <textarea rows="4" cols="20" data-ng-model="topic.body" name="body" required
                              class="form-control ng-pristine ng-valid needsclick ng-touched input-small"></textarea>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row" data-ng-show="editingTopic">
        <div class="col-lg-1 text-muted pull-right">
          <span class="glyphicon glyphicon-ok" data-ng-click="updateTopic(); editingTopic = false;"></span>
        </div>
        <div class="col-lg-1 text-muted pull-right">
          <span class="glyphicon glyphicon-remove" data-ng-click="editingTopic = false"></span>
        </div>
      </div>
      <div class="row" data-ng-show="!editingTopic">
        <div class="col-lg-1 text-muted pull-right" data-ng-show="topic.createdBy.username == myUsername">
          <a data-ng-click="editingTopic = true">edit</a>
        </div>
        <div class="col-lg-1 text-muted pull-right" data-ng-show="topic.createdBy.username == myUsername">
          <a data-ng-click="showConfirmTopicDeletion()">delete</a>
        </div>
      </div>
    </form>

    <div class="row" data-ng-repeat="post in topic.posts">
      <div class="col-lg-12">
        <div class="panel panel-info">
          <div class="panel-heading">
            <span><small>by: <a>{{post.createdBy.name}}</a></small></span>
            <span><small>on: {{post.createdOn | date:'medium'}}</small></span>
            <span data-ng-show="post.modifiedOn">
              <small><strong>modified on:</strong> {{post.modifiedOn | date:'medium'}}</small>
            </span>
          </div>
          <div class="panel-body">
            <div data-ng-show="beingEdited != post">{{post.body}}</div>
            <form class="ng-pristine form-horizontal" data-ng-class="{submitted:form.editPostForm.$submitted}"
                  role="form" name="form.editCommentForm" novalidate
                  data-ng-show="beingEdited == post">
              <div class="col-lg-10">
                    <textarea rows="4" cols="20" data-ng-model="beingEdited.body" name="body" required
                              class="form-control ng-pristine ng-valid needsclick ng-touched input-small"></textarea>
              </div>
              <span class="glyphicon glyphicon-ok" data-ng-click="updatePost()"></span>
              <span class="glyphicon glyphicon-remove" data-ng-click="cancelEditPost()"></span>
            </form>
          </div>
          <div class="row" data-ng-show="beingEdited != post">
            <div class="col-lg-1 text-muted pull-right" data-ng-show="post.createdBy.username == myUsername">
              <a data-ng-click="editPost(post)">edit</a>
            </div>
            <div class="col-lg-1 text-muted pull-right" data-ng-show="post.createdBy.username == myUsername">
              <a data-ng-click="showConfirmPostDeletion(post)">delete</a>
            </div>
          </div>
        </div>
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
      <form class="ng-pristine form-horizontal" data-ng-class="{submitted:form.addPostForm.$submitted}"
            role="form" name="form.addPostForm" novalidate>
        <div class="col-lg-10">
                    <textarea rows="8" cols="20" data-ng-model="post.body" name="body" required
                              class="form-control ng-pristine needsclick input-small"></textarea>
        </div>
        <br>
        <div class="col-sm-3 col-md-3 col-lg-2">
          <button data-ng-click="addPost()" class="btn btn-primary btn-block">
            Post
          </button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-2">
    <button data-ng-click="cancel()" class="btn btn-primary btn-block">
      Back To List
    </button>
  </div>
</div>

<%@ include file="../footer.jsp" %>