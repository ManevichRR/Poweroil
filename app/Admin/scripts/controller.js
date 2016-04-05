angular.module('Admin')
  .controller('MainCtrl', ['$scope','appService', function ($scope, appService) {
    appService.addRequest_data('','').then(function(response){
      $scope.init_data=response;
    },
    function(error){
      console.log('error this '.error)
    });
  }])


  //controller for adding new item.
  .controller('addnewiCtrl', ['$scope','appService', '$location', function ($scope, appService, $location ) {
    $scope.idata={cat:'', itype:'', itag:''};
    $scope.images={};
    $scope.itype=[{value:'', name:'Select An Item Type'},
      {value:'Service', name:'Service'},
      {value:'Product', name:'Product'}
    ];
    $scope.measure_metric=[{value:'', name:'Select a Metric'},{value:'Sachet', name:'Sachet'},{value:'bottles', name:'bottles'},{value:'packs', name:'packs'},{value:'dozens', name:'dozens'}]
    $scope.taglist='';
    $scope.itag=[{value:'', name:'Select a Popular Tags'},  {value:'Affordable', name:'Affordable'},
    {value:'cooking', name:'cooking'},
    {value:'sachet', name:'sachet'},
    {value:'oilly', name:'oily'}];
    appService.addRequest_data('getallc','').then(function(response){
      $scope.categories=response;
    },
    function(error){
        //console.log('error this '+error)
    });
    $scope.additem=function(data){
        appService.uploadImages($scope.images).then(function(response){
            if(response!=='no Images'){
                data.all_pics=response.all_pics;
                data.profile_pic=response.profile_pic;
            }
            appService.addRequest_data('additem', data).then(function(response){
                $location.path('/viewI/'+response)
            },
            function(error){
                console.log('error this '+error)
            });
        },
        function(error){
            console.log('Error Uploading Images '+error)
        });
    }
    $scope.addtag=function(){
        if($scope.idata.itag=='')$scope.idata.itag=$scope.taglist;
        else{$scope.idata.itag=$scope.idata.itag+', '+$scope.taglist;}
        //$scope.$apply();
    }
  }])


  .controller('categoryCtrl', ['$scope','appService', '$location', function ($scope, appService, $location) {
    appService.addRequest_data('getallc','').then(function(response){
      $scope.categories=response;
      $scope.categories.shift();
    },
    function(error){
      console.log('error this '.error)
    });
    $scope.delete=function(id){
        appService.addRequest_data('deletec',id).then(function(response){
            $location.path('/');
        },
        function(error){
            console.log('error this '.error)
        });
    }
  }])
  .controller('addcatCtrl', ['$scope','appService', function ($scope, appService) {
    $scope.cat={};
    $scope.addc=function(){
        appService.addRequest_data('addc',$scope.cat).then(function(response){
            $location.path('/viewallc')
        },
      function(error){
        console.log('error this '.error)
      });
    }
  }])
  .controller('editCCtrl', ['$scope','appService', '$routeParams', '$location', function ($scope, appService, $routeParams, $location) {
    $scope.cat=JSON.parse($routeParams.cat);
    $scope.editc=function(){
      appService.addRequest_data('updatec',$scope.cat).then(function(response){
        $location.path('/viewallc')
      },
      function(error){
        console.log('error this '.error)
      });
    }
  }])
  .controller('viewICtrl', ['$scope', '$routeParams', 'appService','$location',  function ($scope, $routeParams, appService, $location) {
    var id=$routeParams.id;
    appService.addRequest_data('viewI', id).then(function(response){
        $scope.item=response;
        $scope.main_img=$scope.item.item_data[12];
        $scope.img_list=$scope.item.item_data[13].split(',');

    },
    function(error){
      console.log('error this '.error);
    });
    $scope.delete=function(id){
      appService.addRequest_data('deleteq',id).then(function(response){
        $location.path('/viewallQ');
      })
    }
  }])
  .controller('viewallICtrl', ['$scope','appService', '$location', function ($scope, appService, $location) {
    appService.addRequest_data('viewallI','').then(function(response){
        console.log(response)
      $scope.Icategories=response;

    },
    function(error){
      console.log('error this '.error)
    });

  }])
  .controller('editICtrl', ['$scope','appService', '$location','$routeParams', function ($scope, appService, $location, $routeParams) {
    var id=$routeParams.id;
    $scope.taglist='';
    appService.addRequest_data('viewI', id).then(function(response){
      $scope.item=response;
      $scope.idata=$scope.item.item_data
      $scope.main_img=$scope.item.item_data[12];
      $scope.img_list=$scope.item.item_data[13].split(',');
      $scope.itype=[{value:'', name:'Select An Item Type'},
        {value:'Service', name:'Service'},
        {value:'Product', name:'Product'}
      ];
      $scope.measure_metric=[{value:'', name:'Select a Metric'},{value:'Sachet', name:'Sachet'},{value:'bottles', name:'bottles'},{value:'packs', name:'packs'},{value:'dozens', name:'dozens'}]
      $scope.itag=[{value:'', name:'Select a Popular Tags'},  {value:'Affordable', name:'Affordable'},
      {value:'cooking', name:'cooking'},
      {value:'sachet', name:'sachet'},
      {value:'oilly', name:'oily'}];
      console.log($scope.idata);

    },
    function(error){
      console.log('error this '.error);
    });
    appService.addRequest_data('getallc','').then(function(response){
      $scope.categories=response;
    },
    function(error){
      console.log('error this '.error)
    });
    $scope.edititem=function(item){
        var imgparse=''
        for(var i=0; i< $scope.img_list.length; i++){
            if(i==0){imgparse=$scope.img_list[0];}
            else{imgparse=imgparse+','+$scope.img_list[i]}
        }
        $scope.item.item_data[12]=imgparse;
        $scope.item.item_data[13]=$scope.img_list[0];
        appService.uploadImages($scope.images).then(function(response){
            if(response!=='no Images'){
                if(response.all_pics!='') $scope.item.item_data[12]=$scope.item.item_data[12]+','+response.all_pics;
            }
            appService.addRequest_data('editI',$scope.item.item_data).then(function(response){
              $location.path('/viewI/'+id)
            },
            function(error){
              console.log('error this '.error)
            });
        },
        function(error){
            console.log('Error Uploading Images '+error)
        });



    }
    $scope.delete_pic=function(index){
        $scope.img_list.splice(index, 1);
    }
    $scope.make_prof=function(index){
        var temp=$scope.img_list[index];
        $scope.img_list.splice(index, 1);
        $scope.img_list.unshift(temp);
        $scope.main_img=$scope.img_list[index];
    }
    $scope.addtag=function(){
        if($scope.idata[11]=='')$scope.idata[11]=$scope.taglist;
        else{$scope.idata[11]=$scope.idata[11]+', '+$scope.taglist;}
        //$scope.$apply();
    }

  }])
