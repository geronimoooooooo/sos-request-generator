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
    <link href="http://wenzhixin.net.cn/p/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css" />

    <link href="http://cdn.kendostatic.com/2014.1.318/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2014.1.318/styles/kendo.bootstrap.min.css" rel="stylesheet" />
    <link href="http://protostrap.com/Assets/gv/css/gv.bootstrap-form.css" rel="stylesheet" type="text/css" />
    
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
	<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/c_css.css">
	<script src="js/c_js.js"></script>    
</head>

<body class="c_body">
    
    <div class="container">
        <div class="row">

            <form action="../submit" id="formentry" class="form-horizontal" role="form" data-parsley-validate novalidate>
                <div class="container-fluid shadow">
                    <div class="row">
                        <div id="valErr" class="row viewerror clearfix hidden">
                            <div class="alert alert-danger">Oops! Seems there are some errors..</div>
                        </div>
                        <div id="valOk" class="row viewerror clearfix hidden">
                            <div class="alert alert-success">Yay!..</div>
                        </div>

                        
                                    
                                <div class="row"><div class="col-md-12"><div class="form-group brdbot" style="display: block;">
			    <h2>SOS Request Generator</h2>
			    <div class="controls col-sm-9">
                    
                <p id="field1" data-default-label="Header" data-default-is-header="true" data-control-type="header"></p><span id="errId1" class="error"></span></div>
                
		</div><div class="form-group">
			    <p>Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula.</p>
			    
                
		</div><div class="form-group" style="display: block;">
			    <label class="control-label" for="field3">SOS GetCapabilities URL</label>
			    <div class="controls">
                    
                <select id="field3" class="form-control" data-role="select" name="getCapabilities" data-parsley-errors-container="#errId2">
		  <option value="">http://www.</option>
		  <option value="Option 1">Option 1</option>
		  <option value="Option 2">Option 2</option>
		  <option value="Option 3">Option 3</option>
		  <option value="Option 4">Option 4</option>
		</select><span id="errId2" class="error"></span></div>
                
		</div><div class="form-group group-inline">
			    
			    
                
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
    



    <script src="http://cdn.kendostatic.com/2014.1.318/js/jquery.min.js"></script>
    <script src="http://protostrap.com/Assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="http://wenzhixin.net.cn/p/bootstrap-table/src/bootstrap-table.js" type="text/javascript"></script>

    <script src="http://protostrap.com/Assets/inputmask/js/jquery.inputmask.js" type="text/javascript"></script>
    <script src="http://cdn.kendostatic.com/2014.1.318/js/kendo.all.min.js"></script>
    <script src="http://protostrap.com/Assets/parsely/parsley.extend.js" type="text/javascript"></script>
    <script src="http://protostrap.com/Assets/parsely/2.0/parsley.js" type="text/javascript"></script>
    <script src="http://protostrap.com/Assets/download.js" type="text/javascript"></script>
    <script src="http://protostrap.com/Assets/protostrap.js" type="text/javascript"></script>
</body>
</html>
