angular.module('core')
  .factory('forumService', ['constants', '$http', '$rootScope', '$q',
    function (constants, $http, $rootScope, $q) {
      var forumUrl = constants.forumUrl;
      var topics = [];
      var topic = {};

      var service = {};
      service.getTopic = function (topicId) {
        var topicGetPath = "/get";
        $http.get(forumUrl + topicGetPath + "/" + topicId).success(function (response) {
          for (var member in topic) delete topic[member];
          for (var index in response) {
            topic[index] = response[index];
          }
          $rootScope.$broadcast('forumServiceSuccess');
        }).error(function (response) {
          $rootScope.$broadcast('forumServiceError');
        });
        return topic;
      };

      service.getTopics = function () {
        var topicListPath = "/list";
        $http.get(forumUrl + topicListPath).success(function (response) {
          topics.length = 0;
          for (var index in response) {
            topics.push(response[index]);
          }
        }).error(function (response) {
          $rootScope.$broadcast('forumServiceError', "Failed to retrieve forum topics.");
        });

        return topics;
      };

      service.addTopic = function (topic) {
        var deferred = $q.defer();

        $http.post(forumUrl, topic).success(function (response) {
          deferred.resolve(response);
        }).error(function (response) {
          deferred.reject("Failed to save topic : " + response);
        });

        return deferred.promise;
      };

      service.updateTopic = function (topic) {
        var updatePath = "/update";
        var deferred = $q.defer();

        $http.post(forumUrl + updatePath, topic).success(function (topic) {
          deferred.resolve(topic);
        }).error(function (error) {
          deferred.reject("Failed to update topic : " + error);
        });

        return deferred.promise;
      };

      service.deleteTopic = function (topic) {
        var deferred = $q.defer();

        $http.post(forumUrl + "/" + topic.id).success(function (response) {
          deferred.resolve(response);
        }).error(function (response) {
          deferred.reject("Failed to delete blog post: " + response);
        });

        return deferred.promise;
      };

      service.addPost = function (post) {
        var postPath = "/post";
        var deferred = $q.defer();

        $http.post(forumUrl + postPath, post).success(function (response) {
          deferred.resolve(response);
        }).error(function (response) {
          deferred.reject("Failed to add your post: " + response);
        });

        return deferred.promise;
      };

      service.updatePost = function (post) {
        var postPath = "/post/update";
        var deferred = $q.defer();

        $http.post(forumUrl + postPath, post).success(function (topic) {
          deferred.resolve(topic);
        }).error(function (error) {
          deferred.reject("Failed to save post: " + error);
        });

        return deferred.promise;
      };

      service.deletePost = function (post) {
        var postPath = "/post";
        var deferred = $q.defer();

        $http.post(forumUrl + postPath + "/" + post.id).success(function (topic) {
          deferred.resolve(topic);
        }).error(function (error) {
          deferred.reject("Failed to delete post: " + error);
        });

        return deferred.promise;
      };

      return service;
    }]);
