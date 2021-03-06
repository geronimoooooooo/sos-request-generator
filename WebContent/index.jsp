<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>SOS Request Generator</title>
    <meta charset="utf-8">    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
				<p id="c_p_intro">do stuff http://demo.pycsw.org/gisdata/csw?service=CSW&version=2.0.2&request=GetCapabilities&outputFormat=application/json <br>
				https://gist.githubusercontent.com/geronimoooooooo/a916893a267fbd2b2701/raw/39d85d6b67fc2cb7abce16a5fc8ccebba11692c5/multi.geojson<br>
				1. Press "Get data"<br>
				2. Select 1 procedure<br>
				3. Select 1-n observedProperty<br>
				4. Press "Create request"</p>
				
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
								<option>Select a procedure</option>								
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
							<label class="icheckbox_flat-aero" data-toggle='tooltip' data-placement='top' data-original-title="Check box if you want to use a temporal filter in the GetObservation request." >
								<input id="check_tempFilter" type="checkbox"  value="tempFilter"  style="text-align:right;">(activate)</label>
						</div>						
					</div>
					
					<div class="form-group">					
						<div class="col-sm-4 col-md-offset-2 input-group ">
							<input type="text" class="form-control"	id="daterange" name="daterange" value="01/01/2015 - 01/31/2015" />
						</div>								
					</div>		
							
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
		
		<div id="div_response" class="well"  >
		<h2 class="text-center">Response</h2>
		<p>Text text Godzilla ......<br>
		1. Press "Send created request" to query the SOS server and recieve a GetObservation response.</p>
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


<br><br><br><br><br><br><br><br>

		<div>
			
			pull-right
				<select id="sports2" class="selectpicker show-tick">
					<option>Select a procedure</option>
					<option value="Blaueis">Blaueis</option>
					<option value="Godzilla">Godzilla</option>
				</select> <br> <br> <br>
				<form>
					<select id="player2" class="selectpicker" multiple
						title="Choose multiple ObservedProperty"
						data-style="btn-info" data-selected-text-format="count"
						data-actions-box="true">

					</select> 
					<input type="submit" id="add" class="btn btn-primary">

				</form>
			</div>
	

<div id="div_wait" style="z-index:1001;display:none;width:69px;height:89px;border:1px solid black;position:absolute;top:30%;left:46%;padding:2px;">
<img src='img/demo_wait.gif' width="64" height="64" /><br>Loading..</div>

<div id="div_godzilla" style="z-index:1000;display:none;width:640px;height:640px;border:1px solid black;position:absolute;top:15%;left:30%;padding:2px;">
<img src='img/godzilla_happy.gif' width="640" height="640" /><br>Loading..</div>


		<div id="dropdown" class="container well">
<h3>dropdown: AJAX in Servlet using JQuery and JSON</h3>
        Select Favorite Sports:
        
        <select id="sports">
                <option>Select Sports</option>
                <option value="Football">Football</option>
                <option value="Cricket">Cricket</option>
        </select>
        <br /> <br /> 
        Select Favorite Player:
        <select id="player"  multiple="multiple" size="3">
                <option>Select Player</option>
        </select>
</div>









<div class="container">
<form class="form-horizontal" role="form">
  <div class="form-group">
    <label for="inputfield1" class="col-sm-2 control-label">Input 1</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputfield1" placeholder="Input 1">
    </div>
  </div>
  <div class="form-group">
    <label for="inputfield2" class="col-sm-2 control-label">Input 2</label>
    <div class="col-sm-10 controls">
      <div class="input-group">
	    <input type="text" class="form-control" id="inputfield2" placeholder="Input 2">
       
		<span class="input-group-addon">.00</span>
	  </div>
	</div>
  </div>  
</form>
</div>




<form class="form-inline" role="form" id="yourformID-form" action="" method="post">
    <div class="input-group">
        <span class="input-group-addon">asd<i class="fa fa-male"></i></span>

        <div class="form-group">
            <input size="50" maxlength="50" class="form-control" name="q" type="text">          
        </div>

        <div class="form-group">
            <select class="form-control" name="category">
                <option value=""></option>
                <option value="0">select1</option>
                <option value="1">select2</option>
                <option value="2">select3</option>
            </select>           
        </div>
        <span class="input-group-btn">
					<button id="b_submit2" type="button" class="btn btn-primary">Submit</button>
				</span>		
    </div>
</form>











<form class="form-inline" role="form">
  <div class="form-group">
    <label class="sr-only" for="exampleInputEmail2">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="Enter email">
  </div>
  <div class="form-group">
    <div class="input-group">
      <div class="input-group-addon">@</div>
      <input class="form-control" type="email" placeholder="Enter email">
    </div>
  </div>
  <div class="form-group">
    <label class="sr-only" for="exampleInputPassword2">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword2" placeholder="Password">
  </div>
  <div class="checkbox">
    <label>
      <input type="checkbox"> Remember me
    </label>
  </div>
  <button type="submit" class="btn btn-default">Sign in</button>
</form>

<div class="input-append input-block-level ">
	<input type="text" class="search-query input-block-level" name="q" placeholder="Search">
	<button type="submit" class="btn btn-primary">Search</button>
</div>

				
				<div class="input-group">
    <span class="input-group-addon" title="* Price" id="priceLabel">Price</span>
    <input type="number" id="searchbygenerals_priceFrom" name="searchbygenerals[priceFrom]" required="required" class="form-control" value="0">
    <span class="input-group-addon">-</span>
    <input type="number" id="searchbygenerals_priceTo" name="searchbygenerals[priceTo]" required="required" class="form-control" value="0">
  
    <!-- insert this line -->
    <span class="input-group-addon" style="width:0px; padding-left:0px; padding-right:0px; border:none;"></span>
  
    <select id="searchbygenerals_currency" name="searchbygenerals[currency]" class="form-control" style="width:50px; padding-left:10px; padding-right:0px; border:none;">
        <option value="1">HUF</option>
        <option value="2">EUR</option>
    </select>
</div>
				
				
				<div>
				<form class="form-horizontal" role="form">
				<div class="form-group" style="display: block;">
					<label class="control-label" for="l_sosGetCapabilities">SOS GetCapabilities URL</label>
					<div class="controls">
						<select id="field3" class="form-control" data-role="select"
							name="getCapabilities">
							<option value="">http://www.</option>
							<option value="Option 1">Option 1</option>
							<option value="Option 2">Option 2</option>
							<option value="Option 3">Option 3</option>
						</select>
					</div>
				</div>
				</form>
			</div>
			
f20
<form class="form-inline" role="form" id="yourformID-form" action="" method="post">
    <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-male"></i></span>

        <div class="form-group">
            <input size="50" maxlength="50" class="form-control" name="q" type="text">          
        </div>

        <div class="form-group">
            <select class="form-control" name="category">
                <option value=""></option>
                <option value="0">select1</option>
                <option value="1">select2</option>
                <option value="2">select3</option>
            </select>           
        </div>
    </div>
</form>

dropdown
<form role="form">
  <div class="col-md-4">
  <h4>Form to fill out</h4>
  <div class="form-group">
    <label>When using a select, it looks like this</label>
    <div class="input-group">
      <input type="text" class="form-control">
      <span class="input-group-btn">
        <select class="btn">
          <option>Inches</option>
          <option>Feet</option>
          <option>mm</option>
        </select>
      </span>
    </div>
  </div>
  <div class="form-group">
    <label>But, I want it to look more like this (this uses a input-group-btn)</label>
    <div class="input-group">
      <input type="text" class="form-control">
      <div class="input-group-btn">
        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">Inches <span class="caret"></span></button>
        <ul class="dropdown-menu pull-right">
          <li><a href="#">Inches</a></li>
          <li><a href="#">Feet</a></li>
          <li><a href="#">mm</a></li>
        </ul>
      </div><!-- /btn-group -->                  
    </div>
  </div>
  </div>
</form>


<div class="container container-fluid">
  <div class="span7 pull-right well">
		<form id="form-search" class="form-inline" action="#" method="get">
			<input class="span3" type="text" value="" placeholder="Search" name="q"><select class="span2" name="category">
              <option>select</option>
              <option>1</option>
              <option>2</option>
              <option>3</option>
          	</select>
          <button class="btn btn-primary span2 pull-right" type="submit">Submit</button>
		</form>
	</div>
</div>





			<form action="../submit" id="formentry" class="form-horizontal" role="form" data-parsley-validate novalidate>
                <div class="container-fluid shadow">
                    <div class="row">
                        <div id="valErr" class="row viewerror clearfix hidden">
                            <div class="alert alert-danger">Oops! Seems there are some errors..</div>
                        </div>
                        <div id="valOk" class="row viewerror clearfix hidden">
                            <div class="alert alert-success">Yay! ..</div>
                        </div>

                        
                                    
                                <div class="row">
                                <div class="col-md-12">
                                <div class="form-group brdbot" style="display: block;">
			    
			    <div class="controls col-sm-9">
                    
                <p id="field1" data-default-label="Header" data-default-is-header="true" data-control-type="header"></p><span id="errId1" class="error"></span></div>
                
		</div>
		
		<div class="form-group" style="display: block;">
	    	<label class="control-label" for="field3">SOS GetCapabilities URL</label>
			<div class="controls">
                <select id="field3" class="form-control" data-role="select" name="getCapabilities"">
		  			<option value="">http://www.</option>
		  			<option value="Option 1">Option 1</option>
		  			<option value="Option 2">Option 2</option>
		  			<option value="Option 3">Option 3</option>		  
				</select>
			</div>                
		</div>
		<div class="form-group group-inline">
			    
			    
                
		<button id="button10" type="button" class="btn btn-primary">GetCapabilities</button></div><div class="panel-group" id="accordion43">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion43" href="#accBody45" id="accHeading45">Collapse: GetCapabilities Response</a>
                            </h4>
                        </div>
                        <div class="panel-collapse collapse in" id="accBody45">
                            <div class="panel-body">
                                
                            <div class="form-group" rel="popover" data-trigger="hover" data-content="hover text" data-original-title="" style="display: block;">
			    <label class="control-label sr-only" for="field30"></label>
			    <div class="controls">
                    
                <textarea id="field30" rows="3" class="form-control k-textbox" data-role="textarea" data-parsley-errors-container="#errId3"></textarea><span class="help-block">sub level</span><span id="errId3" class="error"></span></div>
                
		</div></div>
                        </div>
                    </div>


                </div><div class="form-group brdbot">
			    <h3>Configure your request</h3>
			    <div class="controls col-sm-9">
                    
                <p id="field57" data-default-label="Header" data-default-is-header="true" data-control-type="header"></p><span id="errId4" class="error"></span></div>
                
		</div><div class="form-group">
			    <p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>
			    
                
		</div>
		
		<div class="form-group pull-right">
  
                
		<button id="b_displayHelp" type="button" class="btn btn-sm btn-link" name="someName">Display help</button>
		</div>
		
		<div class="row" id="tab53" data-role="tab" style="display: block;">
				<ul class="nav nav-tabs">
					  <li class="active"><a href="#tabContent54" data-toggle="tab" id="tabLabel54">Procedure</a></li>
					  <li class=""><a data-toggle="tab" href="#tabContent55" id="tabLabel55">ObservedProperty</a></li>
					  <li><a href="#tabContent56" data-toggle="tab" id="tabLabel56">Timefilter</a></li>
				</ul>
				<div class="tab-content">
				  <div class="tab-pane active" id="tabContent54"><div class=""><div class="form-group">
			    <label class="control-label-left" for="field63">Procedure</label>
			    <div class="controls">
                    
                <select id="field63" class="form-control" data-role="select" name="someName" data-parsley-errors-container="#errId5">
		  <option value=""></option>
		  <option value="Option 1">Option 1</option>
		  <option value="Option 2">Option 2</option>
		  <option value="Option 3">Option 3</option>
		  <option value="Option 4">Option 4</option>
		</select><span id="errId5" class="error"></span></div>
                
		</div><div class="row"><div class="col-md-2"><div class="form-group">
			    <label class="control-label control-label-left col-sm-3" for="field74">URN</label>
			    <div class="controls col-sm-9">
                    
                <input id="field74" type="text" class="form-control k-textbox" data-role="text" placeholder="some urn" data-parsley-errors-container="#errId6"><span id="errId6" class="error"></span></div>
                
		</div></div><div class="col-md-10"><div class="form-group">
			    <label class="control-label control-label-left col-sm-3" for="field75">Untitled</label>
			    <div class="controls col-sm-9">
                    
                <input id="field75" type="text" class="form-control k-textbox" data-role="text" placeholder="http://ispace.blaueis" data-parsley-errors-container="#errId7"><span id="errId7" class="error"></span></div>
                
		</div></div></div></div></div>
				  <div class="tab-pane" id="tabContent55"><div class=""></div></div>
				  <div class="tab-pane" id="tabContent56"><div class=""></div></div>
				</div>
		</div></div></div>


                    </div>
                </div>
            </form>
        </div>
    </div>
    


<!-- 
    <script src="http://cdn.kendostatic.com/2014.1.318/js/jquery.min.js"></script>
    <script src="http://protostrap.com/Assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="http://wenzhixin.net.cn/p/bootstrap-table/src/bootstrap-table.js" type="text/javascript"></script>
     -->

    <script src="http://protostrap.com/Assets/inputmask/js/jquery.inputmask.js" type="text/javascript"></script>
    <script src="http://cdn.kendostatic.com/2014.1.318/js/kendo.all.min.js"></script>
    <script src="http://protostrap.com/Assets/parsely/parsley.extend.js" type="text/javascript"></script>
    <script src="http://protostrap.com/Assets/parsely/2.0/parsley.js" type="text/javascript"></script>
    <script src="http://protostrap.com/Assets/download.js" type="text/javascript"></script>
    <script src="http://protostrap.com/Assets/protostrap.js" type="text/javascript"></script>
    
</body>
</html>
