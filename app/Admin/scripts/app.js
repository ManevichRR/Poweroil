angular
  .module('Admin', [
    'ngResource',
    'ngRoute',
    'appServices'
  ])

  .config(function ($routeProvider) {
    $routeProvider
    .when('/', {
      templateUrl: 'templates/home.html',
      controller: 'MainCtrl',
      //controllerAs: 'main',
    access: { isFree: true  }
    })
    .when('/viewallI', {
      templateUrl: 'templates/viewallI.html',
      controller: 'viewallICtrl',
      controllerAs: 'viewallI',
      access: { isFree: true  }
    })
    .when('/editI/:id', {
      templateUrl: 'templates/editi.html',
      controller: 'editICtrl',
      controllerAs: 'editI',
      access: { isFree: true  }
    })
    .when('/addnewi', {
      templateUrl: 'templates/addi.html',
      controller: 'addnewiCtrl',
      controllerAs: 'addnewi',
      access: { isFree: true  }
    })
      .when('/viewI/:id', {
        templateUrl: 'templates/viewI.html',
        controller: 'viewICtrl',
        controllerAs: 'viewI',
		      access: { isFree: true  }
      })
      .when('/match', {
        templateUrl: 'templates/match.html',
        controller: 'matchCtrl',
        controllerAs: 'match',
		      access: { isFree: true  }
      })
      .when('/vmatch', {
        templateUrl: 'templates/viewmatch.html',
        controller: 'viewmatchCtrl',
        controllerAs: 'vmatch',
		      access: { isFree: true  }
      })
      .when('/viewallc', {
        templateUrl: 'templates/viewC.html',
        controller: 'categoryCtrl',
        controllerAs: 'categoryView',
		    access: { isFree: true }
      })
      .when('/AddC', {
        templateUrl: 'templates/addC.html',
        controller: 'addcatCtrl',
        controllerAs: 'addCC',
		    access: { isFree: true }
      })
      .when('/editc/:cat', {
          templateUrl: 'templates/editc.html',
          controller: 'editCCtrl',
          controllerAs: 'editC',
  		      access: { isFree: true  }
        })
      .otherwise({
        redirectTo: '/',
		access: { isFree: true}
      });
  })
  .run(['$rootScope',  '$location', function(root, $location) {

      root.$on('$routeChangeSuccess', function(scope, currView, prevView) {
          try{if (!currView.access.isFree && (user.status=="")) { $location.path('/');  }}
          catch(e){}
      });
  }])
