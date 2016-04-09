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
 $scope.relogin= function(){
     FB.login(function(response) {}, { scope: 'public_profile,email,user_friends', auth_type: 'rerequest' });
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
            if(item.item_lowest_quantity<item.item_quantity){
                item.item_quantity=item.item_quantity-item.item_batch_quantity;
            }
        }
        else{
            if(item.item_max_quantity>item.item_quantity){
                item.item_quantity=parseInt(item.item_quantity)+parseInt(item.item_batch_quantity);
            }
        }
    }
    $scope.checkout=function(){
        var data=JSON.stringify($scope.user);
        appService.addRequest_data('adduser_catchtransaction',data).then(function(response){
            $scope.user.basketId=response;
            console.log(response)
            $scope.allitemcategories=response;
        },
        function(error){
          console.log('error this '.error)
        });
        if($scope.user.cart.length > 0){$location.path('/checkout')}
        else{$scope.errorCheck=true; $scope.ecm='Please add an item to your cart before checking out'}
    }
}]);
main.controller('CheckoutCtrl', ['$scope', 'appService', 'userData', 'cartmanagement', function ($scope, appService, userData, cartmanagement) {
    $scope.user= userData.data();
    //console.log($scope.user);
    $scope.view_type='view_type';
    $scope.cartview=false;
    $scope.viewcoupons=false;

        $scope.viewcoupons=true;
        appService.addRequest_data('fetchcoupons',$scope.user.id).then(function(response){
            $scope.coupons=response;
            var current_reward={applied_date:"", applied_trans:"", coupon_amount:user.totalReward,
                                coupon_id: "", generated_date:"", generated_trans:"Reward from your Current Transaction",
                                user_id:user.id
                            }
            $scope.coupons.push(current_reward);
        },
        function(error){
            console.log('error can\'t fetch coupons '.error)
        });

    $scope.applyCouponToTrans=function(coupon){
        $scope.user.coupons.push(coupon)
        coupon.applied=true;
        for(var x= 0; x<$scope.user.coupons.length; x++){
            $scope.user.cartTotal= $scope.user.cartTotal-$scope.user.coupons[x].coupon_amount;
        }
    }
    $scope.removeCouponFromTrans=function(coupon, index){
        $scope.user.cartTotal= $scope.user.cartTotal+parseInt(coupon.coupon_amount);
        $scope.user.coupons.splice(index,1);
        console.log($scope.user.coupons);
        coupon.applied=false;
    }
    $scope.triggerpay=function(){
        angular.element('#validSUb').trigger('click');
    }
    $scope.paynow=function(){
        var data= JSON.stringify($scope.user)
        $scope.message='Please wait, we are confirming your transaction';
        $scope.paystatus='waiting';
        appService.addRequest_data('addtotransactionlog',data).then(function(response){
            $scope.user.transId=response;
            $scope.paystatus='confirmed';
            $scope.message='Thanks for Using the Poweroil Facebook App, your Transaction has been Confirmed';
        },
        function(error){
            console.log('error this '.error)
        });
    }
    $scope.itemtocart=function(item, operation, index){
        if($scope.user.cart.length >1){
            cartmanagement.itemtocart(item, operation, index)
        }
        else{$scope.error=true; $scope.errorM='There must be atleast 1 item in your cart';}
    }
}]);
main.controller('AccountCtrl', ['$scope', 'appService', 'userData', '$rootScope',  function ($scope, appService, userData, $rootScope) {
    $scope.user=userData.data();
    $scope.view_type='transaction';
    console.log($scope.user);
    $scope.$on('userloaded', function(event, data) {
        appService.addRequest_data('fetchUsertransactions',$scope.user.id).then(function(response){
            $scope.transactions=response;
        },
        function(error){
            console.log('error this '.error)
        });
    })
    $scope.fetchcoupon=function(){
        $scope.viewcoupons=true;
        appService.addRequest_data('fetchcoupons',$scope.user.id).then(function(response){
            $scope.coupons=response;
        },
        function(error){
            console.log('error can\'t fetch coupons '.error)
        });
    }
    $scope.fetchItems=function(basketId){
        appService.addRequest_data('fetchItemFromBasket',basketId).then(function(response){
            $scope.items=response;
        },
        function(error){
            console.log('error this '.error)
        });
    }
}])
