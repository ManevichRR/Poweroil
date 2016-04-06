var appServices=angular.module('appServices', ['ngResource']);
appServices.filter('posttime', function(){
  return function (input) {
    var n =moment.unix(input).fromNow();
    return n;
  }
});
appServices.directive('fileModel', ['$parse', function ($parse) {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            var model = $parse(attrs.fileModel);
            var modelSetter = model.assign;

            element.bind('change', function(){
                scope.$apply(function(){
                    modelSetter(scope, element[0].files[0]);
                });
            });
        }
    };
}]);
appServices.service('appService', ['$q','$http','$location','$rootScope', function( $q, $http, $location, $rootScope) {
    var uploadImages = function(file){
        return $q(function(resolve, reject) {
            if(file!=null){
               form_data=parsetoformdata(file);

               $http.post('server/upload_images.php', form_data, {

                    transformRequest: angular.identity,
                    headers: {'Content-Type': undefined}                })
                .success(function(response){ resolve(response); })
                .error(function(err){ reject('Images Couldn\'t be added.'+err); });
            }
            else{
                console.log('No Images');
                resolve('no Images');
            }
        });
    }

    var parsetoformdata= function(data){
        var form_data = new FormData();
        if(typeof(data)==='object'){
            for ( var key in data ) {
                form_data.append(key, data[key]);
            }
        }
        else if(data!=''){
            form_data.append('data', data);
        }
        else{form_data.append('data', '');}
        return form_data;
    }
    var addRequest_data=function(action, data){
		return $q(function(resolve, reject) {
            if(data==''){data={}}
            var url='server/get_allq.php';
            if(action!='' && data!=''){
                if(typeof(data)!=='object'){
                    temp={action:action, data:data};
                    data=temp;
                }
                else{data.action=action; }
            }
            form_data=parsetoformdata(data);
            $http({
                method: 'POST',
                url: url,
                data: form_data,
                transformRequest: angular.identity,
                headers: {'Content-Type': undefined}
                //headers : {"application/x-www-form-urlencoded; charset=utf-8"}
            }).
            success(function(response) {
              //console.log(response)
              resolve(response);
            },
            function(err) {reject('Data Couldn\'t be added.');}
            );
        });
	}
        return{
        addRequest_data :function(action, data) {
            return addRequest_data(action, data)
        },
        uploadImages :function(file) {
            return uploadImages(file)
        },
  	    register:function(regprams){
  		    register(regprams)
  	    }
    }
}])
