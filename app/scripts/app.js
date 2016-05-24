'use strict';

/**
 * @ngdoc overview
 * @name friendappApp
 * @description
 * # friendappApp
 *
 * Main module of the application.
 */
angular
  .module('poweroilApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'appServices'
  ])
  .config(function($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main'
      })
      .when('/checkout', {
        templateUrl: 'views/checkout.html',
        controller: 'CheckoutCtrl',
        controllerAs: 'Checkout',
		access: { isFree: false }
      })
      .when('/voucher', {
        templateUrl: 'views/voucher.html',
        controller: 'voucherCtrl',
        controllerAs: 'voucher',
		access: { isFree: false }
      })
      .when('/account', {
        templateUrl: 'views/account.html',
        controller: 'AccountCtrl',
        controllerAs: 'account',
		access: { isFree: false }
      })
      .when('/tandc', {
        templateUrl: 'views/termsandconditions.html',
		access: { isFree: false }
      })
      .otherwise({
        redirectTo: '/'
      });
  })

  .run(['$rootScope', '$window', 'AuthService', function($rootScope, $window, AuthService) {
      $rootScope.user = {};
      $window.fbAsyncInit = function() {
      // Executed when the SDK is loaded
          FB.init({
              appId: '252383798426441',
              channelUrl: 'template/channel.html',
              status: true,
              cookie: true,
              xfbml: true,
              version: 'v2.4'
          });
          AuthService.watchLoginChange();
      };
      (function(){
          var e = document.createElement('script'); e.async = true;
          e.src = document.location.protocol +
          '//connect.facebook.net/en_US/all.js';
          document.getElementById('fb-root').appendChild(e);
      }());

  }]);


