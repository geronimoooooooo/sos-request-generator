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
	
	
	<link rel="stylesheet" href="css/c_css.css">
	<script src="js/c_js.js"></script>    
	
</head>

<body class="c_body">
    
    <div class="container c_container">
        <div class="row">

			<div class="c_container_inner">
				<h2>SOS Request Generator</h2>
				<hr>
				<div>
				<p id="c_p_intro">This website allows for</p>
				</div>
			</div>
		</div>
		
		<div class="row">
	<div id="input2"  class="c_container_inner well">
		<form class="form-horizontal" role="form">
		<div class="form-group">
			<label for="l_getCapabilitesURL" class="col-sm-2 control-label">GetCapabilites	URL</label>

			<div class="col-sm-10 input-group">			
				<input type="text" class="form-control"	id="input_getCapabilitesURL"
					value="https://gist.githubusercontent.com/geronimoooooooo/a916893a267fbd2b2701/raw/39d85d6b67fc2cb7abce16a5fc8ccebba11692c5/multi.geojson"
					placeholder="provide the URL to request a GetCapabilites">
					 <!-- <span class="input-group-addon"></span> -->
					 <span class="input-group-addon" style="width:0px; padding-left:0px; padding-right:0px; border:none;"></span>
					
				<span class="input-group-btn">
					<button id="b_submit1" type="button" class="btn btn-primary">Submit</button>
				</span>			
	
				
			</div>
		</div>
		
		<div class="form-group ">
			<label for="label_response" class="col-sm-2 control-label textleft pull-left">Response</label>

			<div class="col-sm-7 input-group">
				<textarea class="form-control" id="exampleTextarea" rows="10"></textarea>
			</div>
		</div>
		</form>
</div>
</div>


<div id="dropdown2" class="well">
	<select id="sports2" class="selectpicker show-tick">
	 	<option>Select Sports</option>
        <option value="Football">Football</option>
        <option value="Cricket">Cricket</option>
	</select>
<br><br><br>
	<form>
		<select id="player2" class="selectpicker"  
		multiple title="Choose multiple of the following..." 
		data-style="btn-primary"
		data-selected-text-format="count"
		data-actions-box="true">
		  
		</select>
		 <input type="submit" id="add">Send 

	</form>
</div>




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






<div id="dropdown_procedure">
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
			    
                
		</div><div class="form-group pull-right">
			    
			    
                
		<button id="b_displayHelp" type="button" class="btn btn-sm btn-link" name="someName">Display help</button></div><div class="row" id="tab53" data-role="tab" style="display: block;">
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
