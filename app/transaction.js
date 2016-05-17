angular.module('transcation_log',['ngAnimate',
'ngCookies',
'ngResource',
'ngRoute',
'ngSanitize',
'ngTouch', 'ui.bootstrap'])
.controller('trans',  ['$scope','$http', '$uibModal', function($scope, $http, $uibModal){
    $scope.status_search='all';
    $scope.message="Please wait";
    $scope.entryfilter = function (entry) {
      if (entry.status !=null){ return true}
      else{return false}
    };
    $scope.statusTrans= function (entry){
        if($scope.status_search=='all'){return true}
        if (entry.status ==$scope.status_search){ return true}
        else{return false}
    }
    $scope.actions=[
        {value:'all', name:'All Transactions'},
        {value:'Cancelled', name:'Cancelled'},
        {value:'En-route', name:'En-route'},
        {value:'Delayed', name:'Delayed'},
        {value:'Delivered', name:'Delivered'},
        {value:'Pending', name:'Pending'}
    ];
    $scope.item=[{name:'3L Bottle', id:4}, {name:'75CL Bottle', id:6}, {name:'Sachet', id:8}]
    $http({method:'GET', url:"inter_log.php"}).
		then(function successCallback(response) {
		console.log(response.data)
		$scope.entries=response.data
	},
	function errorCallback(response){});
        $scope.updateStatus=function(){
    }
    $scope.printdoc=function(){
        window.print();
    }
    $scope.view_details=function(entry, content){
        entry.ptype=content;
        $('.mainp').addClass('noprint');
        var modalInstance = $uibModal.open({
          templateUrl: 'transdetail.html',
          controller: 'detailModalInstanceCtrl',
          size: 'lg',
          windowClass: 'register-modal-window',
          resolve: {
            entry: function () {
              return entry;
            }
          }
        })
        modalInstance.result.then(function (selectedItem) {
            $('.mainp').removeClass('noprint');
        }, function () {
          $('.mainp').removeClass('noprint');
        });
    }

    $scope.updateStatus=function(entry){
        entry.updatestatus='status_update';
        entry.message='Updating...';
        allentry=JSON.stringify(entry);
        $http({method:'GET', url:"update_log.php?basket_id="+entry.order[0].basket_id+"&status="+entry.ustatus+"&all="+allentry}).
    		then(function successCallback(response) {
    		console.log(response.data);
            if(response.data=='Updated'){
                entry.status=entry.ustatus;
                entry.message='Transaction Updated.';
            }
            else{
                entry.message='Transaction Updated failed, please try again.';
            }
    		//$scope.entries=response.data
    	},
    	function errorCallback(response){
            $scope.message='Transaction Updated failed, please try again.';
        });
    }
    $scope.getitemname=function(entry, order){
        for(a=0; a<$scope.item.length; a++){
            if($scope.item[a].id==order.item_id){
                order.item_name=$scope.item[a].name;
                entry.total_amount=entry.total_amount+parseInt(order.total_amount);
            }
        }
    }
    $scope.removecoupon=function(entry){
        for(b=0; b<entry.coupons.length; b++){
            entry.total_amount=entry.total_amount-parseInt(entry.coupons[b].coupon_amount);
        }
    }
}])
.controller('detailModalInstanceCtrl', ['$scope', '$rootScope', '$uibModalInstance', 'entry', function ($scope, $rootScope,  $modalInstance, entry){

	$scope.entry=entry;
	console.log($scope.entry)
	$scope.login= function (login){

	}
    $scope.ok = function (user) {
    // $scope.regUser = registerUser.get({title:user.title, fname:user.fname, lname:user.lname, email:user.email, pass:user.password, phone:user.phone, date_birth:user.dbirth, con_add:user.caddress, city:user.city, state:user.state, postal_c:user.pcode, country:user.country, national:user.nationality, agent:user.agent },	function(regUser) {
	// if($scope.regUser[0]=='o'){
	// 	userData.setData(user);
	// 	setCookie('getCentreUser',user, 30 )
	// 	function setCookie(cname, cvalue, exdays) {
	// 		var d = new Date();
	// 		d.setTime(d.getTime() + (exdays*24*60*60*1000));
	// 		var expires = "expires="+d.toUTCString();
	// 		document.cookie = cname + "=" + JSON.stringify(cvalue) + "; " + expires;
	// 	}
	// $scope.getUdata=userData.data();
	// $scope.getUdata[0].status="Logged_in";
	// $rootScope.$broadcast('logged-in');
	// $modalInstance.dismiss('cancel');
	//}
	//})
  };

  $scope.cancel = function () {
    $modalInstance.dismiss('cancel');
  };
}]);
