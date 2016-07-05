'use strict';

angular
  .module('core')
  .controller('ForumController', ['$scope', '$mdDialog', '$state', 'forumService', 'authProvider',
    function ($scope, $mdDialog, $state, forumService, authProvider) {

      $scope.topics = forumService.getTopics();
      $scope.myUsername = authProvider.user;
      $scope.topic = {};
      $scope.post = {};
      $scope.form = {};

      $scope.beingEdited = null;
      $scope.editingTopic = false;

      var updateTopics = function (updateTopic) {
        for (var index in $scope.topics) {
          if ($scope.topics.hasOwnProperty(index)) {
            if ($scope.topics[index].id == updateTopic.id) {
              $scope.topics[index] = updateTopic;
            }
          }
        }
      };

      var deleteTopicFromList = function (topic) {
        for (var index in $scope.topics) {
          if ($scope.topics.hasOwnProperty(index)) {
            if ($scope.topics[index].id == topic.id) {
              $scope.topics.splice(index, 1);
            }
          }
        }
      };

      $scope.viewTopic = function (id) {
        $scope.topic = forumService.getTopic(id);
        $state.go('forum.viewTopic');
      };

      $scope.startAddingTopic = function () {
        $scope.topic = {};
        $state.go('forum.newTopic')
      };

      $scope.addTopic = function () {
        // We add a topic and the first post
        $scope.post.topicId = "new"; // just to satisfy the serializer
        forumService.addTopic($scope.topic).then(function (topic) {
          $scope.topics.unshift(topic);
          $scope.topic = {};
          $state.go('forum.list');
        }, function (error) {
          console.error(error);
        });
      };

      $scope.cancel = function () {
        $state.go('forum.list');
      };

      $scope.updateTopic = function () {
        forumService.updateTopic($scope.topic).then(function (topic) {
          $scope.topic = topic;
          $scope.editingTopic = false;
          updateTopics(topic);
        }, function (response) {
          console.error(response);
        });
      };

      $scope.showConfirmTopicDeletion = function () {
        var confirm = $mdDialog.confirm()
          .title('Are you sure?')
          .textContent('Are you sure you want to delete this topic and all its posts?')
          .targetEvent()
          .ok('Yes!')
          .cancel('Nope');

        $mdDialog.show(confirm).then(function () {
          $scope.deleteTopic();
        });
      };

      $scope.deleteTopic = function () {
        forumService.deleteTopic($scope.topic).then(function () {
          deleteTopicFromList($scope.topic);
          $scope.topic = null;
          $state.go("forum.list");
        }, function (error) {
          console.error(error);
        });
      };

      $scope.addPost = function () {
        $scope.post.topicId = $scope.topic.id;
        forumService.addPost($scope.post).then(function (topic) {
          $scope.topic = topic;
          updateTopics(topic);
          $scope.form.addPostForm.$setPristine();
          $scope.post = {};
        }, function (error) {
          console.error(error);
        });
      };

      $scope.cancelEditPost = function () {
        $scope.beingEdited = null;
      };

      $scope.editPost = function (post) {
        $scope.beingEdited = post;
      };

      $scope.updatePost = function () {
        if ($scope.beingEdited == null) {
          return;
        }

        forumService.updatePost($scope.beingEdited).then(function (topic) {
          $scope.topic = topic;
          updateTopics(topic);
          $scope.beingEdited = null;
        }, function (response) {
          console.error(response);
        });
      };

      $scope.deletePost = function (post) {
        forumService.deletePost(post).then(function (topic) {
          $scope.topic = topic;
          updateTopics(topic);
        }, function (error) {
          console.error(error);
        });
      };

      $scope.showConfirmPostDeletion = function (post) {
        var confirm = $mdDialog.confirm()
          .title('Are you sure?')
          .textContent('Are you sure you want to delete this post?')
          .targetEvent(post)
          .ok('Yes!')
          .cancel('Nope');

        $mdDialog.show(confirm).then(function () {
          $scope.deletePost(post);
        });
      };
    }]);
