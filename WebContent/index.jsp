<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>SOS Request Generator</title>
    <meta charset="utf-8">    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" type="text/css" />  
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
	<link rel="stylesheet" href="css/jquery.toast.min.css">
	<script src="js/jquery.toast.min.js"></script>	
	
	<link rel="stylesheet" href="css/c_css.css">
	<script src="js/c_js.js"></script>   
	
	<link rel="stylesheet" href="css/codemirror.css">
	<link rel="stylesheet" href="css/ambiance.css">
	<link rel="stylesheet" href="css/elegant.css">
		<script src="js/codemirror.js"></script>
		<script src="js/javascript.js"></script> 
		<script src="js/xml.js"></script> 
		<script src="js/vkbeautify.0.99.00.beta.js"></script> 
		
		
	<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script src="js/moment-with-locales.js"></script>
	<!-- Include Date Range Picker -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.19/daterangepicker.min.js"></script>
	
	<!--<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>-->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-daterangepicker/2.1.19/daterangepicker.min.css">
	<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" /> -->
	
					  
	
</head>

<body class="c_body ">
    
    <div class="container c_container box_shadow ">
        <div class="row">
        
        <div class="clearfix" >
        <div style="float: left;">

	<div>
		<ul class="nav nav-pills">
  			  <li role="presentation" class="dropdown">
				 <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
     				<span style="font-size:1.5em;"  class="glyphicon glyphicon-globe fa-5x"></span><span class="caret"></span>
			    </a>
			        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <li><a href="insertsensor">Create InsertSensor</a></li>
					    <li role="separator" class="divider"></li>
    					<li><a href="#">Separated link</a></li>
    					<li><a href="http://demo.pycsw.org/gisdata/csw?service=CSW&version=2.0.2&request=GetCapabilities&outputFormat=application/json 
    					">Some GetCapabilities</a></li>
    					<li><a href="https://gist.githubusercontent.com/geronimoooooooo/a916893a267fbd2b2701/raw/39d85d6b67fc2cb7abce16a5fc8ccebba11692c5/multi.geojson">GeoJson</a></li>
  					</ul>
  			</li>
  		</ul>
  	</div>	
		</div>
		
		<div style="float: right;" data-toggle='tooltip' data-placement='bottom' 
								data-original-title="Settings" >
		  <a href="#"><span style="font-size:1.5em;"  class="glyphicon glyphicon-cog fa-5x" data-toggle="modal" data-target="#myModal"></span></a>
		  </div>
		</div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">SOS Request Generator Settings</h4>
      </div>
      <div class="modal-body">
   				...settings here...
   				<ul>
   				<li>enable/disable tooltips</li>
   				<li>add ogc sos url to a dropdown menu list</li>
   				<li>use cashed GetCapabilitiesResponse or force a new query to sos</li>
   				</ul>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


			<div class="c_container_inner">
				<h2 id="header_sos">SOS Request Generator</h2>
				<hr>
				<div>
				<p id="c_p_intro" >
				The SOS Request Generator creates a <b>GetObservation</b> request by extracting needed data from a <b>GetCapabilities</b> that is queried from the provided OGC SOS URL.<br>
						 </p>
			
		
				 <p id="intro_help" class="well">				
				<br>
				1. Start by clicking on the "GetCapabilities" button. That will send a "GetCapabilities request" to the SOS. If the request has been executed successfully, a "success" notification will be displayed. After the GetCapabilities response has been parsed and needed data extracted, the dropdown menus "Procedure" and "ObservedProperty" will be filled with values.<br><br>
				2. Select a procedure (sensor) from the dropdown menu "Procedure".<br><br>
				3. Select the desired observedProperties (1-n) from the dropdown menu "ObservedProperty".<br><br>
				4. Activate "Temporal filter" (click on checkbox) if you wish to display a calendar (datetime) field. The calendar allows the user to select a specific period of time (from, to). In rder to add the temporal filter XML tag to the "GetObservation request", the selection should be confirmed by clicking on the "Confirm Selection" button.<br><br>
				5. Activate "MergeObservationsIntoDataArray" (click on checkbox) if you wish to add the "MergeObservationsIntoDataArray" extension (XML tag) to the "GetObservation request". This will result in a more compact "GetObservation response", but should ONLY be used with stationary procedures. Reason: with "MergeObservationsIntoDataArray" all observations are linked to one pair of latitude and longitude. This would result in a mobile procedure having only one stationary position.<br><br>
				6. Click on the "Create request" button to create a "GetObservation request". The string will be displayed in the "SOS GetObservation Request" area.<br><br>
				7. This step is optional. After the "GetObservation request" has been created a new "Response" section will be displayed. Clicking on the "Send created request" button will send the created "GetObservation request" to the SOS and the response will be displayed in the "RESPONSE to the GetObservation Request" area.<br>
				<br>
				<br><br>
				
				
				
				
				You can either copy the created request (string) from the <b>SOS GetObservation Request</b> area or send the request directly from this page to the SOS server and retrieve a GetObservation response. 
				
				</p>

				<div class="form-group pull-right"> 
					<button id="b_displayHelp_intro" type="button" class="btn btn-sm btn-link" >Display help</button>
				</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div id="input2" class="c_container_inner well">
				<form class="form-horizontal" role="form">
					<div class="form-group ">
						<label for="l_getCapabilitesURL" class="col-sm-2 control-label">OGC SOS URL</label>
						
						<div class="col-sm-10 input-group "><!--um die inputbox noch kleiner zu machen form-group-sm-->
							<input type="text" class="form-control eckige-ecke"	id="input_getCapabilitesURL"
								value="https://ispacevm30.researchstudio.at/focus/service"
								placeholder="provide the URL to request a GetCapabilites"
								data-toggle='tooltip' data-placement='top' 
								data-original-title="Sends a GetCapabilities request to the provided OGC SOS URL. The response is used to extract procedures and observedProperty."
								>
							<!-- <span class="input-group-addon"></span> -->
							<span class="input-group-addon"
								style="width: 0px; padding-left: 0px; padding-right: 0px; border: none;"></span>

							<span class="input-group-btn">
								<button id="b_submitGetCapabilities2" type="button" 
									class="btn btn-primary"
									data-toggle='tooltip' data-placement='top' 
								data-original-title="Sends a GetCapabilities request to the provided OGC SOS URL. The response is used to extract procedures and observedProperty."
									>GetCapabilities</button>
							</span>
						</div>
					</div>
<!-- 					<div class="form-group "> -->
<!-- 						<label for="label_response" -->
<!-- 							class="col-sm-2 control-label textleft pull-left">Response</label> -->

<!-- 						<div class="col-sm-10 input-group"> -->
<!-- 							<textarea class="form-control" id="exampleTextarea2" rows="10"></textarea> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</form>
			</div>
		</div>

		<div class="row">
			<div id="procedures" class="c_container_inner well">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<label for="l_procedure" class="col-sm-2 control-label">Procedure</label>

						<div class="col-sm-10 input-group">
							<select id="sports2" class="selectpicker show-tick" data-live-search="true">
								<option data-hidden="true"></option>
								<option>Select a procedure!</option>																
							</select>
						</div>
					</div>
					<div class="form-group ">
						<label for="l_observedProperty"
							class="col-sm-2 control-label textleft pull-left">ObservedProperty</label>

						<div class="col-sm-10 input-group">
							<select id="player2" class="selectpicker" multiple
								title="Choose multiple ObservedProperty" data-style="btn-default"
								data-selected-text-format="count" data-actions-box="true">
							</select>
						</div>
					</div>					
				</form>
			</div>
		</div>

		<div class="form-group pull-right"> 
			<button id="b_displayHelp" type="button" class="btn btn-sm btn-link" name="someName" style="margin: 10px;">Display help</button>
		</div>
	
	<div id="temporalFilter" class="row">
		<div class="c_container_inner well">
			<form class="form-horizontal" role="form">
										
					<div class="form-group" >					
						<label for="l_tempFilter" class="col-sm-2 control-label" title="Check box if you want to use a temporal filter in the GetObservation request.">Temporal filter</label>
						<div class="checkbox icheckbox_flat-aero">
							<label class="icheckbox_flat-aero" data-toggle='tooltip' data-placement='top' data-original-title="Check box if you want to use a temporal filter in the GetObservation request. Confirm the temporal filter by selecting a time period and pressing the 'Confirm Selection' button.">
								<input id="check_tempFilter" type="checkbox"  value="tempFilter"  style="text-align:right;">(activate)</label>
								<div id="d22" class="col-sm-4 col-md-offset-2 input-group">
									<input type="text" class="form-control"	id="daterange" name="daterange" value="01/01/2015 - 01/31/2015" />
								</div>		
						</div>						
					</div>
					
					<div class="form-group" >					
						<label for="l_mergeArray" class="col-sm-2 control-label" title="Check box if you want to use <i>MergeObservationsIntoDataArray</i> in the GetObservation request.">MergeObservations IntoDataArray</label>
						<div class="checkbox icheckbox_flat-aero">
							<label class="icheckbox_flat-aero" data-toggle='tooltip' data-placement='top' data-original-title="Check box if you want to use MergeObservationsIntoDataArray in the GetObservation request." >
								<input id="check_mergeArray" type="checkbox"  value="mergeArray"  style="text-align:right;">(activate)</label>
									
						</div>						
					</div>
					
					<!-- 
					<div class="form-group">					
						<div class="col-sm-4 col-md-offset-2 input-group ">
							<input type="text" class="form-control"	id="daterange" name="daterange" value="01/01/2015 - 01/31/2015" />
						</div>								
					</div> -->							
				</form>
		</div>
	</div>

		<div class="panel-group c_panel">
			<div class="panel panel-primary">
		    	<div class="panel-heading">SOS GetObservation Request</div>
			    	<div class="panel-body">
			    	<div class="col-sm-12 input-group c_textArea">
						<textarea class="form-control c_textArea" id="exampleTextarea" rows="5"></textarea>
					</div>
		    	</div>
		    </div>
		</div>


		<div id="createRequest" class="row" style="margin-right: 5px;">
			<div class="c_container_inner">
				<form class="form-horizontal" role="form">
					<div class="form-group ">
						<div class="col-sm-12 input-group">
							<button type="button" id="createRequest" class="btn btn-primary pull-right">Create request</button>
						</div>
					</div>		
				</form>
			</div>
		</div>
</div>
		
<div id="div_response" class="container c_container box_shadow ">	


				<h2 id="header_response">Response</h2>
				<hr>
				<div>
				<p id="c_p_response">
				Press the "Send created request" button to query the SOS server with the created GetObservation request and receive a GetObservation response.<br>
						 </p>
					
				 <p id="response_help">
				 			
				</p>				
				</div>
			
			


		<div >
		<div class="row" style="margin-right: 0px;">
			<div class="c_container_inner">
				<form class="form-horizontal" role="form">
					<div class="form-group ">
						<div class="col-sm-12 input-group">
							<button type="button" id="sendCreatedRequest" class="btn btn-primary pull-right">Send created request</button>
						</div>
					</div>		
				</form>
			</div>
		</div>
		
		
		<div class="panel-group c_panel">
			<div class="panel panel-primary">
		    	<div class="panel-heading">RESPONSE to the GetObservation Request</div>
			    	<div class="panel-body">
			    	<div class="col-sm-12 input-group c_textArea">
						<textarea class="form-control c_textArea" id="textAresponse_getObservation" rows="5"></textarea>
					</div>
		    	</div>
		    </div>
		</div>		
	</div>


<br><br><br>



<div id="div_wait" style="z-index:1001;display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:30%;left:46%;padding:2px;">
<img src='img/demo_wait.gif' width="64" height="64" /><br>Loading..</div>

<div id="div_godzilla" style="z-index:1000;display:none;width:640px;height:640px;border:1px solid black;position:absolute;top:15%;left:30%;padding:2px;">
<img src='img/godzilla_happy.gif' width="640" height="640" /><br>Loading..</div>

</div>
   
</body>
</html>
