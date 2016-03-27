'use strict';

/**
 * @ngdoc function
 * @name friendappApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the friendappApp
 */
var main=angular.module('poweroilApp');
main.controller('AppCtrl',['$scope','userData', '$location','appService', function($scope,userData, $location, appService ){
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
main.controller('MainCtrl', ['$scope', 'appService', 'userData','$location','cartmanagement', function ($scope, appService, userData, $location, cartmanagement) {
    $scope.user= userData.data();
    $scope.cartview=false;
    $scope.errorCheck=false;
    appService.addRequest_data('viewallI','').then(function(response){
        $scope.view_type='itemlist';
        console.log(response)
        $scope.allitemcategories=response;
    },
    function(error){
        console.log('error this '.error)
    });
    $scope.changeview=function(item, viewswitch){
        item.view_type=viewswitch;
    }

    $scope.itemtocart=function(item, operation, index){
        cartmanagement.itemtocart(item, operation, index)
    }
    $scope.quantity_adjustment=function(item, operation){
        if(operation=='sub'){
            if(item.item_lowest_quantity<item.item_quantity){item.item_quantity--;}
        }
        else{item.item_quantity++}
    }
    $scope.checkout=function(){
        if($scope.user.cart.length > 0){$location.path('/checkout')}
        else{$scope.errorCheck=true; $scope.ecm='Please add an item to your cart before checking out'}
    }
}]);
main.controller('CheckoutCtrl', ['$scope', 'appService', 'userData', 'cartmanagement', function ($scope, appService, userData, cartmanagement) {
    $scope.user= userData.data();
    console.log($scope.user);
    $scope.cartview=false;
    appService.addRequest_data('viewallI','').then(function(response){
        $scope.view_type='itemlist';
        console.log(response)
        $scope.allitemcategories=response;
    },
    function(error){
      console.log('error this '.error)
    });
    $scope.changeview=function(item, viewswitch){
        item.view_type=viewswitch;
    }
    $scope.itemtocart=function(item, operation, index){
        cartmanagement.itemtocart(item, operation, index)
    }
    $scope.quantity_adjustment=function(item, operation){
        if(operation=='sub'){
            if(item.item_lowest_quantity<item.item_quantity){item.item_quantity--;}
        }
        else{item.item_quantity++}
    }

}]);
