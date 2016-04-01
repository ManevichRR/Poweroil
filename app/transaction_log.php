<script src="bower_components/jquery/dist/jquery.js"></script>
<script src="bower_components/angular/angular.min.js"></script>
<div ng-app="transcation_log" ng-controller="inter" style="border:1px solid #555; width:80%; min-height:100px; margin:2% 10%; background:#eee">
	<div style="float:right; padding:10px; background:#fefefe; width:auto; color:#555; height:20px;">
        <span><b>Select Transaction Status </b></span>
        <span><select>
        	<option value="All">All</option>
            <option value="Approved">Approved</option>
            <option value="UnApproved">UnSuccessful</option>
            <option value="UnApproved">Pending</option>
        </select>
        </span>
    </div>
   	<div style="float:right; font-size:24px;text-align: center;width: 60%;padding: 5px;">Transaction Log</div>
	<div style="background:#555; clear:both; color:#eee; font-size:16px; min-height:28px; font-weight:bold; width:100%">
    	<div style="width:25%;  border-right:1px solid #eee; padding:5px 10px;  float:left">Customer Name & Email</div>
        <div style="width:8%;  border-right:1px solid #eee; padding:5px 10px; float:left">Reference</div>
        <div style="width:12%;  border-right:1px solid #eee; padding:5px 10px; float:left">Date & Time</div>
        <div style="width:7%;  border-right:1px solid #eee; padding:5px 10px; float:left">Amount</div>
        <div style="width:15%;  border-right:1px solid #eee; padding:5px 10px; float:left">Response</div>
        <div style="width:auto; padding:5px 10px; float:left">Action</div>
    </div>
    <div style="border-bottom:1px solid #555;min-height:25px; font-size:12px; color:#333" ng-repeat="entry in entries" ng-init="getTransaction(entry)">
        <div style="float:left; width:25%; padding:5px 10px; border-right:1px solid #555;" ng-bind="entry.email">
        </div>
        <div style="float:left; width:8%; padding:5px 10px; border-right:1px solid #555; " ng-bind="entry.ref">
        </div>
        <div style="float:left; width:12%; padding:5px 10px; border-right:1px solid #555; " ng-bind="entry.date * 1000 | date:'dd-MM-yyyy HH:mm:ss Z'">
        </div>
        <div style="float:left; width:7%; padding:5px 10px; border-right:1px solid #555; " ng-bind="entry.amount | number:2">
        </div>
        <div style="float:left; width:15%; padding:5px 10px; border-right:1px solid #555;" ng-bind="entry.response">
        </div>
        <div style="float:left; width:20%; padding:5px 10px;">
            <!-- <span ng-if="(entry.responseD=='Pending' || entry.responseD=='Failed') && entry.status=='nothing' && entry.responseC=='I.M.I.A'"> -->
			<span ng-if="entry.responseC!='00'" >
				<a style="color:#f00; font-weight:bold; cursor:pointer" ng-click="requery(entry)">REQuery</a>
            </span>
            <span ng-if="entry.responseD=='Pending' && entry.status=='waiting'">
            	Please wait...
            </span>
            <span ng-if="entry.status=='arrived'" ng-bind="entry.response">
            </span>

        </div>
    </div>

</div>
