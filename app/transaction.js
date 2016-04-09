angular.module('transcation_log',[])
.controller('trans',  ['$scope','$http', function($scope, $http){
    $scope.entryfilter = function (entry) {
      if (entry.status !=null){ return true}
      else{return false}
    };
    $scope.actions=[
        {value:'Cancelled', name:'Cancelled'},
        {value:'En-route', name:'En-route'},
        {value:'Delayed', name:'Delayed'},
        {value:'Delivered', name:'Delivered'},
        {value:'Pending', name:'Pending'}
    ];
    $scope.item=[{name:'3L Bottle', id:4}, {name:'75CL Bottle', id:6}, {name:'5CL sachet', id:8}]
    $http({method:'GET', url:"inter_log.php"}).
		then(function successCallback(response) {
		console.log(response.data)
		$scope.entries=response.data
	},
	function errorCallback(response){});
        $scope.updateStatus=function(){
    }
    $scope.updateStatus=function(bid, stat){
        $http({method:'GET', url:"update_log.php?basket_id="+bid+"&status="+stat}).
    		then(function successCallback(response) {
    		console.log(response.data)
    		$scope.entries=response.data
    	},
    	function errorCallback(response){});
    }
    $scope.getitemname=function(entry, order){
        for(a=0; a<$scope.item.length; a++){
            if($scope.item[a].id==order.item_id){
                order.item_name=$scope.item[a].name;
                entry.total_amount=entry.total_amount+parseInt(order.total_amount);
            }
        }
    }
}])
