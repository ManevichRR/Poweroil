
/**
 * @ngdoc overview
 * @name quizApp
 * @description
 * # quizApp
 *
 * Main module of the application.
 */
angular
  .module('quizApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    //'appServices',
    'mm.foundation'
  ])

  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl',
        controllerAs: 'main',
		access: { isFree: true  }
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
      .otherwise({
        redirectTo: '/',
		access: { isFree: false }
      });
  })
	.run(['$rootScope',  '$location', 'userData', function(root, $location, userData) {
		root.$on('$routeChangeSuccess', function(scope, currView, prevView) {
			var user= userData.data()
			try{if (!currView.access.isFree && (user.status=="")) { $location.path('/');  }}
			catch(e){}
		});
	}])

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
