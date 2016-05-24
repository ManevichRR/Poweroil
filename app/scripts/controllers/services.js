
var appServices=angular.module('appServices', ['ngResource']);
appServices.service('userData', ['$rootScope','$location', function($rootScope,$location){
  var savedData =  {name:'login',  id:0,  cart:[], email:'', cartTotal:0, currentlevel:1, transactions:[], coupons:[], status:'', facebookid:'', prop_pict:'images/account-img.jpg', basketId:''}

  return{
     data:function() {   return savedData; }
  }
}])

// appServices.filter('posttime', function(){
//   return function (input) {
//     var n =moment.unix(input).fromNow();
//     return n;
//   }
// });
appServices.service('cartmanagement', ['userData', function( userData){
    var user=userData.data();

    var itemtocart=function(item, operation, index, multiplier){
        if(operation=='sub'){

            if(item.item_lowest_quantity<item.item_quantity){
                item.item_quantity=item.item_quantity-item.item_batch_quantity;
                itemtocart(item, 'remove', index, multiplier);
                if(item.item_quantity > 0){
                    itemtocart(item, 'adder', index, multiplier)
                }
            }
        }
        else if(operation=='add'){
            if(item.item_max_quantity>item.item_quantity){
                item.item_quantity=parseInt(item.item_quantity)+parseInt(item.item_batch_quantity);
                itemtocart(item, 'remove', index, multiplier);
                itemtocart(item, 'adder', index, multiplier)
            }
        }
        else if(operation=='remove'){
            for(var i=0; i<user.cart.length; i++){
                if(user.cart[i].item_no==item.item_no){

                    var price = item.quantity*item.item_rate
                    item.reward=parseInt(item.quantity)*item.item_points
                    if(multiplier=='m'){
                        price=price-item.reward;
                    }
                    user.cartTotal= user.cartTotal-price;
                    user.totalReward=user.totalReward-item.reward;
                    item.quantity=0;
                    user.cart.splice(i, 1);
                }
            }
        }
        else{
            item.quantity=item.item_quantity;
            var price=parseInt(item.quantity)*item.item_rate;
            item.reward=parseInt(item.quantity)* parseInt(item.item_points);
            price=price-item.reward;
            user.cartTotal= user.cartTotal+price;
            if(typeof user.totalReward=='undefined') {user.totalReward=item.reward;}
            else{ user.totalReward=user.totalReward+item.reward;}
            user.cart.push(item);
        }
	}
    return{
        itemtocart :function(item, operation, index, multiplier) {
            return itemtocart(item, operation, index, multiplier)
        },
        uploadImages :function(file) {
            return uploadImages(file)
        },
        register:function(regprams){
            register(regprams)
        }
    }
}])

appServices.service('appService', ['$q','$http','$location','$rootScope', function( $q, $http, $location, $rootScope) {

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

            var url='https://minimiefunquiz.com/poweroilmarketplace/app/server/get_allq.php';

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

appServices.service('AuthService', ['userData','$q','$http','USER_ROLES','$location','$rootScope', 'appService', function(userData, $q, $http, USER_ROLES, $location, $rootScope, appService) {
  var LOCAL_TOKEN_KEY = 'myAskToken';
  user=userData.data();
  var username = '';
  var isAuthenticated = false;
  var role = '';
  var authToken={'token':'', 'id':''};
    var loadUserCredentials= function() {
        var token = window.localStorage.getItem(LOCAL_TOKEN_KEY);
        if (token) useCredentials(token);

    }

    var useCredentials=function(token, stat) {
       username = token.token.split('.')[0];
       var user_ro= token.token.split('.')[1];
       var user_id= token.id;
       isAuthenticated = true;
       authToken = token;
     if(stat=='newp'){
		  user.name=token.token.split('.')[0];
		  user.id=token.id;
		  user.status='NewPlayer';

	  }
	  else{
		  user.name=token.token.split('.')[0];
		  user.id=token.userId;
		  user.status='ReturnPlayer';
		  user.totalscore=token.totalscore;
		  user.email=token.email;
		  user.currentlevel=token.level;

		 // user.lastLscore=token.lastlevelscore;
		  user.line1=token.line1;
		  user.line2=token.line2;
		  user.line3=token.line3;
	  }

       $http.defaults.headers.common['X-Auth-Token'] = token;
   }
    var destroyUserCredentials = function() {
       authToken = undefined;
       username = '';
       isAuthenticated = false;
       $http.defaults.headers.common['X-Auth-Token'] = undefined;
       window.localStorage.removeItem(LOCAL_TOKEN_KEY);
   }
   var userCred=function(token, stat){
	   window.localStorage.setItem(LOCAL_TOKEN_KEY, token);
      useCredentials(token, stat);
	  }
	var friendsList=function(flist){
		$http({url:'server/get_friends.php?', method:'GET', params:flist}).
              success(function(responseData, status, headers, config) {user.friends=responseData; console.log(user.friends)},
              function(err) {}
          );
	}
	var aduser=function(user){
		return $q(function(resolve, reject) {
            userdetail=JSON.stringify(user);
            $http.get('https://minimiefunquiz.com/poweroilmarketplace/app/server/get_allq.php?email='+name+'&pass='+pw).
            success(function(response) {
              var logResult=response
              if(logResult.errorM) {reject(logResult.errorM);}
              else{
                  userCred(response[0], 'oldp');
                  resolve(response[0]);
              }
            },
            function(err) {reject('Login Failed.');}
            );
        });
	}
    return{
        adduser :function(user) {
        adduser();
    },
        logout : function() {
        this.destroyUserCredentials();
    },
        storeUserCredentials:function(token) {
        userCred(token)
    },
        register:function(regprams){
        register(regprams)
	},
    watchLoginChange: function() {
		FB.Event.subscribe('auth.authResponseChange', function(res) {
    		if (res.status === 'connected') {
    			FB.api('/me?fields=name,email, friends', function(res) {
					user.name=res.name;
					console.log(res);
					user.status='FBPlayer';
					user.prop_pict='http://graph.facebook.com/'+res.id+'/picture';
                    user.email=res.email;
                    user.id=res.id;
					$reg={fname:res.name.split(' ')[0], lname:res.name.split(' ')[1], email:res.email, phone:'', password:'fblogin', facebook:res.id}
					var email =(res.email)? res.email:res.id;
                    appService.addRequest_data('addnewuser', res).then(  function(authenticated) {},
                    function(err){}
					);
                    $rootScope.$broadcast('userloaded');

					// if(res.friends.data.length>0){
					// 	friends = [];
					// 	for($j=0; $j<res.friends.data.length; $j++)	{
					// 		friends.push(res.friends.data[$j]);
					// 	}
					// 	friendsList(friends).then( function(authenticated){
					// 	    console.log(authenticated)
					// 	}, function(err){console.log('Error getting friends, try again')})
					// }
					$rootScope.$apply(function() {
					$rootScope.user = res;
                    //
					});

				});
			}
			else {}
	    });
	}
}
}])
