<%@ include file="../header.jsp" %>

<div class="row">
  <div class="col-sm-12 col-md-12 col-lg-12">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
          <div class="col-sm-6 col-md-2 col-lg-1">
            <span>Search</span>
          </div>
          <div class="col-sm-6 col-md-4 col-lg-3 pull-left">
            <input type="string" data-ng-model="searchString" name="searchString"/>
          </div>
        </div>
      </div>
    </div>
    <table class="table table-bordered table-striped">
      <thead>
      <tr>
        <th class="col-sm-3 col-md-6 col-lg-6">Topic</th>
        <th class="col-sm-3 col-md-2 col-lg-1">Replies</th>
        <th class="col-sm-3 col-md-2 col-lg-1">Views</th>
        <th class="col-sm-3 col-md-2 col-lg-4">Last Post</th>
      </tr>
      </thead>
      <tbody>
      <tr data-ng-repeat="topic in topics | filter:searchString">
        <td>
          <span><a data-ng-click="viewTopic(topic.id)">{{topic.title}}</a></span><br>
          <span class="text-muted"><small>by: <a>{{topic.createdBy.name}}</a></small></span>
          <span class="text-muted"><small>on: {{topic.createdOn | date:'medium'}}</small></span>
          <span class="text-muted"><small>modified on: {{topic.modifiedOn | date:'medium'}}</small></span>
        </td>
        <td>
          <span>{{topic.numberOfPosts}}</span><br>
        </td>
        <td>
          <span>{{topic.numberOfViews}}</span><br>
        </td>
        <td>
          <div data-ng-show="topic.lastPost != null">
            <div>{{topic.lastPost.body | fewWords:3}} ...</div>
            <span class="text-muted"><small>by: <a>{{topic.lastPost.createdBy.name}}</a></small></span>
            <span class="text-muted"><small>on: {{topic.lastPost.createdOn | date:'medium'}}</small></span>
          </div>
        </td>
      </tr>
      </tbody>
    </table>
    <br>
    <span class="glyphicon glyphicon-plus" data-ng-click="startAddingTopic()"></span>
    <span>Post New Topic</span>
  </div>
</div>

<%@ include file="../footer.jsp" %>