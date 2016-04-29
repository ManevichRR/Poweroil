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
    var removetotal=false;
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
    $scope.checkcart=function(item){
        for(var i=0; i<$scope.user.cart.length; i++){
            if($scope.user.cart[i].item_no==item.item_no){
                item.item_quantity=$scope.user.cart[i].quantity;

//                item.item_quantity=item.item_quantity-item.item_batch_quantity;
                 if(removetotal==false){
                    removetotal=true;
                    $scope.user.cartTotal=0;
                    $scope.user.totalReward=0;
                    $scope.user.coupons=[];

                }
                //item.item_quantity=parseInt(item.item_quantity)+parseInt(item.item_batch_quantity);
                var price = item.quantity*item.item_rate
                item.reward=parseInt(item.quantity)*item.item_points

                    price=price-item.reward;

                $scope.user.cartTotal= $scope.user.cartTotal-price;
                $scope.user.totalReward=$scope.user.totalReward-item.reward;
                item.quantity=0;
                $scope.user.cart.splice(i, 1);

                item.quantity=item.item_quantity;
                var price=parseInt(item.quantity)*item.item_rate;
                item.reward=parseInt(item.quantity)* parseInt(item.item_points);
                price=price-item.reward;
                $scope.user.cartTotal= $scope.user.cartTotal+price;
                if(typeof $scope.user.totalReward=='undefined') {$scope.user.totalReward=item.reward;}
                else{ $scope.user.totalReward=$scope.user.totalReward+item.reward;}
                $scope.user.cart.push(item);

                // $scope.user.cartTotal=$scope.user.cartTotal+(item.item_quantity*item.item_rate);
                // $scope.user.cartTotal=$scope.user.cartTotal-$scope.points;
                // $scope.user.totalReward=$scope.user.totalReward+(item.item_points*item.item_quantity);
                //
                //
                }
            }
            console.log($scope.user.cart)
            console.log(item)
        }


    $scope.itemtocart=function(item, operation, index, multiplier){
        cartmanagement.itemtocart(item, operation, index, multiplier)
    }
    $scope.checkout=function(couponstatus){

        if($scope.user.name !='login'){
            var data=JSON.stringify($scope.user);
            $scope.user.couponstatus=couponstatus;
            if($scope.user.basketId==''){
                appService.addRequest_data('adduser_catchtransaction',data).then(function(response){
                    $scope.user.basketId=response;
                    console.log(response)
                    $scope.allitemcategories=response;
                    $location.path('/checkout')
                },
                function(error){
                  console.log('error this '.error)
                });
            }
            else{
                appService.addRequest_data('update_catchtransaction',data).then(function(response){
                    //$scope.user.basketId=response;
                    console.log(response)
                    $location.path('/checkout')
                },
                function(error){
                  console.log('error this '.error)
                });
            }

        }
        //if($scope.user.cart.length > 0){$location.path('/checkout')}
        else{$scope.errorCheck=true; $scope.ecm='Please Login with the button at the top of the page.'}
    }
}]);
main.controller('CheckoutCtrl', ['$scope', 'appService', 'userData', 'cartmanagement', '$rootScope', function ($scope, appService, userData, cartmanagement,$rootScope) {
    $scope.user= userData.data();
    console.log($scope.user);
    $scope.coupons=[];
    if($scope.user.couponstatus==false){
        $scope.user.cartTotal=$scope.user.cartTotal+$scope.user.totalReward
    }
    $scope.view_type='view_type';
    $scope.cartview=false;
    $scope.viewcoupons=false;
        $scope.viewcoupons=true;
        appService.addRequest_data('fetchcoupons',$scope.user.id).then(function(response){
            $scope.coupons=response;
            var current_reward={applied_date:"", applied_trans:"", coupon_amount:user.totalReward,
                coupon_id: "", generated_date:"", generated_trans:"Reward from your Current Transaction",
                user_id:user.id, applied:user.couponstatus
            }
            $scope.coupons.push(current_reward);
            for(var d=0; d<$scope.coupons.length; d++){
                if($scope.coupons[d].generated_trans=='Welcome Coupon'){

                    $scope.applyCouponToTrans($scope.coupons[d]);
                }
            }
            if(user.couponstatus==true)$scope.user.coupons.push(current_reward);
        },
        function(error){
            console.log('error can\'t fetch coupons '.error)
        });

    $scope.applyCouponToTrans=function(coupon){
        if(coupon.applied==false || typeof coupon.applied=='undefined'){
            $scope.user.coupons.push(coupon)
            coupon.applied=true;
            for(var i= 0; i<$scope.user.coupons.length; i++){
                if(user.coupons[i].coupon_id==coupon.coupon_id){
                    $scope.user.cartTotal= $scope.user.cartTotal-$scope.user.coupons[i].coupon_amount;
                }
            }
        }
    }
    $scope.removeCouponFromTrans=function(coupon, index){
        $scope.user.cartTotal= $scope.user.cartTotal+parseInt(coupon.coupon_amount);
        for(var i=0; i<user.coupons.length; i++){
            if(user.coupons[i].coupon_id==coupon.coupon_id){
                $scope.user.coupons.splice(i,1);
                coupon.applied=false;
            }
        }
        if($scope.user.coupons.length==0){ $scope.
            user.couponstatus==false}
    }
    $scope.paynow=function(){
        console.log($scope.user);
        console.log($scope.user.phone);
        $scope.error=false;
        var data= JSON.stringify($scope.user)
        if($scope.user.name=='' || $scope.user.email=='' || typeof $scope.user.email=='undefined' || $scope.user.phone=='' || typeof $scope.user.phone=='undefined' || $scope.user.flatnum=='' || typeof $scope.user.flatnum=='undefined'||  $scope.user.street=='' || typeof $scope.user.street=='undefined' || $scope.user.bustop=='' || typeof $scope.user.bustop=='undefined'){
            $scope.error=true;
            $scope.message='Please fill all fields in the form and try again.';
        }
        if($scope.error==false){
            $scope.paystatus='waiting';
            $scope.message='Please wait, we are confirming your transaction';
            appService.addRequest_data('addtotransactionlog',data).then(function(response){
                $scope.user.transId=response;
                $scope.paystatus='confirmed';
                $scope.message='Thank you for Using the Poweroil Market Place App, your Transaction has been Confirmed.';
            },
            function(error){
                console.log('error this '.error);
            });
        }
    }
    $scope.itemtocart=function(item, operation, index, multiplier){
        if($scope.user.cart.length >1){
            for(var $x=0; $x<$scope.coupons.length; $x++){
                console.log($scope.coupons[$x]);
                if($scope.coupons[$x].generated_trans=="Reward from your Current Transaction"){
                    console.log($scope.coupons[$x]);
                    $scope.coupons[$x].coupon_amount=$scope.coupons[$x].coupon_amount-(item.item_points*multiplier);
                }
            }
            for(var i=0; i<user.cart.length; i++){
                if($scope.user.cart[i].item_no==item.item_no){

                    var price = item.quantity*item.item_rate
                    item.reward=parseInt(item.quantity)*item.item_points
                    if($scope.user.couponstatus==true){
                        price=price-item.reward;
                    }
                    $scope.user.cartTotal= $scope.user.cartTotal-price;
                    $scope.user.totalReward=$scope.user.totalReward-item.reward;
                    item.quantity=0;
                    $scope.user.cart.splice(i, 1);
                }
            }
            //cartmanagement.itemtocart(item, operation, index, multiplier);
            var data=JSON.stringify($scope.user);
            appService.addRequest_data('update_catchtransaction',data).then(function(response){
                //$scope.user.basketId=response;
                console.log(response)
            },
            function(error){
              console.log('error this '.error)
            });
        }
        else{$scope.error=true; $scope.errorM='There must be atleast 1 item in your cart';}
    }
}]);
main.controller('AccountCtrl', ['$scope', 'appService', 'userData', '$rootScope',  function ($scope, appService, userData, $rootScope) {
    $scope.user=userData.data();
    $scope.view_type='transaction';
    //console.log($scope.user);
    appService.addRequest_data('fetchUsertransactions',$scope.user.id).then(function(response){
        console.log(response);
        $scope.transactions=response;
    },
    function(error){
        console.log('error this '.error)
    });
    $scope.$on('userloaded', function(event, data) {

        appService.addRequest_data('fetchUsertransactions',$scope.user.id).then(function(response){
            console.log(response);
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
}]);
main.directive('emailadd', function() {
    return {
        require: 'ngModel',
        link: function(scope, element, attr, mCtrl) {
            function myValidation(value) {
                if (value.indexOf(".") > -1) {
                    if(value.indexOf("@")< value.lastIndexOf(".")){
                        mCtrl.$setValidity('emailformat', true);
                    }
                    else {
                        mCtrl.$setValidity('emailformat', false);
                    }
                }
                else {
                    mCtrl.$setValidity('emailformat', false);
                }
                return value;
            }
            mCtrl.$parsers.push(myValidation);
        }
    };
});
