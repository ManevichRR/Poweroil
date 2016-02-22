'use strict';

/**
 * @ngdoc function
 * @name friendappApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the friendappApp
 */
var main=angular.module('poweroilApp');
main.controller('AppCtrl',['$scope','userData', '$location', function($scope,userData, $location){
   $scope.user=userData.data();
   $scope.logout = function() {
   FB.logout(function(response) {
      $scope.user.status="";
      $scope.user.name="login"
      $scope.user.totalscore=0;
      $scope.user.line1=0;
      $scope.user.line2=0;
      $scope.user.line3=0;
      $scope.user.facebook="";
      $scope.user.email=0;
      $scope.user.totalscore=0;
      $scope.user.currentleve=1;
      $scope.user.lastlevelscore=0;
      $location.path('/');
      $scope.$apply();
   });
 }

 $scope.FBlogin = function() {
  FB.login(function(response) { }, {scope: 'public_profile,email,user_friends'});
 }
 }])
main.controller('MainCtrl', function () {
  this.awesomeThings = [
    'HTML5 Boilerplate',
    'AngularJS',
    'Karma'
  ];
});
