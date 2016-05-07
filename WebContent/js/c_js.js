/**
 * 
 */
$(document).ready(function() {
	
		
	//	$('#check_tempFilter').prop('checked', true);
		
		if($('#check_tempFilter').is(':checked') ){
		//	alert("checked!");
		}
		$('input#check_tempFilter').change(function () {
		    if ($('input#check_tempFilter').is(':checked')) {
		     //   $('input#Checkbox1').addClass('checked');
		    //	alert("box is checked");
		    } else {
		        //$('input#Checkbox1').removeClass('checked');
		    	//alert("box is NOET checked");
		    }
		});
		
		
		
		
		$("[data-toggle='tooltip']").tooltip({
			//default ist ohne Inhalt in {} bezieht sich dann auf "focus" 
			trigger : 'hover'
		});
	 
		$('input[name="daterange"]').daterangepicker({
//		    "startDate": "05/02/2016",
//		    "endDate": "05/10/2016",
		 	//startDate:"2016-05-02",
		// 	endDate:"2016-05-12",
		 
		 	startDate: moment().subtract('days', 6),
		 	endDate: moment(),
		 		
		 	timePicker: true,	      
	        timePicker24Hour: true,
	        timePickerSeconds:true,
	        timePickerIncrement: 1,
	        showDropdowns: true,
	        /*ranges: {
	             'Today': [moment(), moment()],
	             'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
	             'Last 7 Days': [moment().subtract('days', 6), moment()],
	             'Last 30 Days': [moment().subtract('days', 29), moment()],
	             'This Month': [moment().startOf('month'), moment().endOf('month')],
	             'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')],
	             'Last Year': [moment().subtract('month', 12).startOf('month'), moment().subtract('month', 1).endOf('month')]
	          },*/
	        locale: {
	          //format: 'MM/DD/YYYY h:mm A'
	        	format: 'YYYY-MM-DD H:mm'
	        	
	        }
	 });	
	 $('#daterange').on('apply.daterangepicker', function(ev, picker) {
		  console.log(picker.startDate.format('YYYY-MM-DD'));
		  console.log(picker.startDate.format('YYYY-MM-DDTHH:mm:ss'));
		  
		 
		  console.log(picker.endDate.format('YYYY-MM-DD'));
		  console.log(picker.endDate.format('YYYY-MM-DDTHH:mm:ss'));
		});
	// $("#div_response").hide();
	 
	$('.selectpicker').selectpicker({
	  //style: 'btn-default',
		  //,size: "auto" //false
		  //  ,width: "150px"
	  size: 10
	});
	
	var procedureUrn ="";
	//dropdown procedure
	$('#sports2').change(function(event) {
		console.log("sports2");
		procedureUrn = $("select#sports2").val();
		$.get('Dropdown', {
			procedureUrn : procedureUrn
		}, function(response) {

			console.log(response);
			var select2 = $('#player2');
			select2.find('option').remove();
			$.each(response, function(index, value) {
				console.log(value);
				$('<option>').val(value).text(value).appendTo(select2);
			});
			select2.selectpicker('refresh');
		});
	});
	
	
	
	
	
	var config, editor;
	var xml_vkbeautified;
	var xml_vkbeautified2;
	var requestComplete="";
	var reqXmlHeader ="<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
	var reqEnvelope ="\n\t<env:Envelope " +
					"xmlns:env=\"http://www.w3.org/2003/05/soap-envelope\" \
					\n\txmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" \
					\n\txsi:schemaLocation=\"http://www.w3.org/2003/05/soap-envelope http://www.w3.org/2003/05/soap-envelope/soap-envelope.xsd\">";
	
	var reqBodyObs ="\n\t<env:Body>"+ 
        "\n\t\t<sos:GetObservation" +
            "\n\t\txmlns:sos=\"http://www.opengis.net/sos/2.0\" "+
            "\n\t\txmlns:fes=\"http://www.opengis.net/fes/2.0\" "+
            "\n\t\txmlns:gml=\"http://www.opengis.net/gml/3.2\" "+
            "\n\t\txmlns:swe=\"http://www.opengis.net/swe/2.0\" " +
            "\n\t\txmlns:xlink=\"http://www.w3.org/1999/xlink\" "+
            "\n\t\txmlns:swes=\"http://www.opengis.net/swes/2.0\" service=\"SOS\" version=\"2.0.0\""+
            "\n\t\txsi:schemaLocation=\"http://www.opengis.net/sos/2.0 http://schemas.opengis.net/sos/2.0/sos.xsd\">";
	
	var mergeObservations="<swes:extension><swe:Boolean definition=\"MergeObservationsIntoDataArray\"><swe:value>true</swe:value></swe:Boolean></swes:extension>";
	var beginPosition="Please provide a time";
	var endPosition="Please provide a time";
	var reqTemporalFilter ="<sos:temporalFilter> <fes:During>"+
                    "<fes:ValueReference>phenomenonTime</fes:ValueReference><gml:TimePeriod gml:id=\"tp_1\">  <gml:beginPosition>"+
                    beginPosition + "</gml:beginPosition><gml:endPosition>+"+
                    endPosition + "</gml:endPosition> </gml:TimePeriod> </fes:During> </sos:temporalFilter>";
                    
	var reqEnding = " \n\t\t\t<sos:responseFormat>http://www.opengis.net/om/2.0 </sos:responseFormat>        \n\t\t</sos:GetObservation>    \n\t</env:Body>\n</env:Envelope>";
		
	$("#fillTextAreaReset").click(function(){
		editor.toTextArea();
	//	editor.refresh();
		document.getElementById("exampleTextarea").value="test";
	});
				
	var str="Hi, ja du hast da vollkommen Recht. Muss das mit den Zeiten in den Griff bekommen. War z.B. am Dienstag nicht in Büro, aber dafür, von Mittag Dienstag bis 8 Uhr in der Früh Mittwoch durchprogrammiert, weil ich das mit"+
	"einfach funktionstüchtig bringen wollte. Sieht halt keiner, dass ich da den Mittag, Nachmittag, Abend und Nacht durchprogrammiert habe. Und das mit der Lautstärke wird sich schon legen, wenn wieder " +
	"jeder/jede seiner/ihrer ARbeit wieder eher \"alleine\" nachgeht"
		
	var data = {};
	var list_observedProopertySelected;
	var str_observedProopertySelected;
	
	function observedPropertyNeeded(){
		$.toast({
		    text: "<h2>Please select an observedProperty!</h2>", // Text that is to be shown in the toast
		    heading: 'Warning', // Optional heading to be shown on the toast
		    icon: 'error', // Type of toast icon
		    showHideTransition: 'fade', // fade, slide or plain
		    allowToastClose: true, // Boolean value true or false
		    hideAfter: 4000, // false to make it sticky or number representing the miliseconds as time after which toast needs to be hidden
		    stack: 5, // false if there should be only one toast at a time or a number representing the maximum number of toasts to be shown at a time
		    position: 'top-center', // bottom-left or bottom-right or bottom-center or top-left or top-right or top-center or mid-center or an object representing the left, right, top, bottom values
		    
		    
		    
		    textAlign: 'left',  // Text alignment i.e. left, right or center
		    loader: true,  // Whether to show loader or not. True by default
		    loaderBg: '#9EC600',  // Background color of the toast loader
		    beforeShow: function () {}, // will be triggered before the toast is shown
		    afterShown: function () {}, // will be triggered after the toat has been shown
		    beforeHide: function () {}, // will be triggered before the toast gets hidden
		    afterHidden: function () {}  // will be triggered after the toast has been hidden
		});
	}
	
		$("#createRequest").click(function() {				
			 if(editor !=undefined){
			    	editor.toTextArea();
			    	editor.refresh();
			    	document.getElementById("exampleTextarea").value="";
		    	}
			 
			console.log("Button#createRequest");
			var select2 = $('#player2');
			select2.each(function(el) {
			//	alert($(this).val())
				str_observedProopertySelected= ($(this).val());
				data[$(this).attr("observedProperty")] = $(this).val();
				//console.log($(this).val());				
			});
			
			console.log("str: "+str_observedProopertySelected);
			if(str_observedProopertySelected==null){
				//alert("Please select an ObservedProperty! todo toast");
				observedPropertyNeeded();
			}else{			
			
			requestComplete = "";
			requestComplete += reqXmlHeader;
			requestComplete += reqEnvelope;		
			requestComplete += reqBodyObs;
			requestComplete += mergeObservations;
			
			var reqProcedure="\n\n";
			reqProcedure += "\t\t\t<sos:procedure>"+procedureUrn+"</sos:procedure>\n";
				
			var arr="a,b,c,d";
			list_observedProopertySelected = str_observedProopertySelected.toString().split(",");
			console.log("list_observedProopertySelected[0] :"+list_observedProopertySelected[0]);
			
			var reqProperty ="\n";
			for(i=0; i < list_observedProopertySelected.length; i++){
				reqProperty +="\t\t\t<sos:observedProperty>"+list_observedProopertySelected[i]+"</sos:observedProperty>\n";
			}		
			requestComplete +=reqProcedure;
			requestComplete +=reqProperty;
			if($('#check_tempFilter').is(':checked') )
			{
				requestComplete +=reqTemporalFilter;
			}
			else
			{
			    //Not checked
			}
		
			requestComplete += reqEnding;
		//	$(exampleTextarea).val(requestComplete);
		    
			xml_vkbeautified =vkbeautify.xml(requestComplete);
		  //  console.log(xml_vkbeautified);
		    $(exampleTextarea).val(xml_vkbeautified);
			
//			 var config, editor;

			    config = {		    		
			        lineNumbers: true,
			        mode: "text/javascript",
			        lineWrapping: true,
			        htmlMode: true,
			        matchClosing: true,
//			        theme: "elegant",		      
			        indentWithTabs: true,
			        readOnly: true
			    };
			   
			    editor = CodeMirror.fromTextArea(document.getElementById("exampleTextarea"), config);
			    editor.setSize(900,"100%");
					


			//$("#exampleTextarea").text(list_observedProopertySelected[0]);
			//$("#exampleTextarea").append("\n"+list_observedProopertySelected[1]);
			
			$.ajax({
				type : 'GET',
				url  : 'Dropdown',
				data : JSON.stringify({
					observedProperty : data
				}),
				success : function(msg) {
				}
			});
			}//else
			$("#div_response").show();

		}); 
		var config2, editor2;
		var xml_resp ="";
		$("#sendCreatedRequest").click(function() {		
			xml_resp ="";
			 if(editor2 !=undefined){
			    	editor2.toTextArea();
			    	editor2.refresh();
			    	document.getElementById("textAresponse_getObservation").value="";
		    	}
			 
			var url = $("#input_getCapabilitesURL").val();
			var xml= $(exampleTextarea).val()
			console.log("this is xml_vkbeautified: "+xml );
		 	$.ajax({
		 	    // The URL for the request //"post.php"
		 	    url: 'GetObservationResponse',
		 	    // The data to send (will be converted to a query string)
		 	    data: {"url":url, "xml":xml},
//		 	    	  "request": "GetCapabilities",
//		 	    	  "service": "SOS"
//		 	    	},
		 	    // Whether this is a POST or "GET" request
		 	    type: "POST",
		 	    // The type of data we expect back //"json" //"text"
		 	    dataType : "text",
		 	    success: function(xml){
		 	    	console.log("success:"+xml);
		 	    	xml_resp = xml;
		 	    	
		 	    	xml_vkbeautified2 =vkbeautify.xml(xml_resp);
		 			  //  console.log(xml_vkbeautified);
		 			    $("#textAresponse_getObservation").val(xml_vkbeautified2);
		 			   
		 			   
					    config2 = {		    		
					        lineNumbers: true,
					        mode: "text/javascript",
					        lineWrapping: true,
					        htmlMode: true,
					        matchClosing: true,
//					        theme: "elegant",		      
					        indentWithTabs: true,
					        readOnly: true
					    };
					   
					    editor2 = CodeMirror.fromTextArea(document.getElementById("textAresponse_getObservation"), config2);
					    editor2.setSize(900,"100%");
		 			    
		 			    
		 	    }
		 	   
		 	})
		 	  // Code to run if the request succeeds (is done);
		 	  // The response is passed to the function
		 	  .done(function( returnedData ) {
		 //		 console.log("returned: "+returnedData);
		// 	$("#textAresponse_getObservation").val(returnedData);
		 		
		 		 
		 	  })
		 	  // Code to run if the request fails; the raw request and
		 	  // status codes are passed to the function
		 	  .fail(function( xhr, status, errorThrown ) {
		 	    alert( "Sorry, there was a problem!" );
		 	    console.log( "Error: " + errorThrown );
		 	    console.log( "Status: " + status );
		 	    console.dir( xhr );
		 	  })
		 	  // Code to run regardless of success or failure;
		 	  .always(function( xhr, status ) {
		 	//    alert( "The request is complete!" );
		 	  });
		 	
		 console.log("xml_resp: "+xml_resp);	 		

			
		
//			 
			console.log("Button#sendCreatedRequest");
		    
			
			
			
			//    editor.setValue("fuuuuuuuuu"+xml_vkbeautified2);
			
		
		

		}); 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	
	
	$("#b_submitGetCapabilities2").click(function() {
	 	var url = $("#input_getCapabilitesURL").val();
	 	
	 	console.log(url);
	 	
	 	$.ajax({
	 	    // The URL for the request //"post.php"
	 	    url: 'GetCapabilitiesUrl',
	 	    // The data to send (will be converted to a query string)
	 	    data: {"url":url, "fu":"fuuu"},
//	 	    	  "request": "GetCapabilities",
//	 	    	  "service": "SOS"
//	 	    	},
	 	    // Whether this is a POST or "GET" request
	 	    type: "GET",
	 	    // The type of data we expect back //"json" //"text"
	 	    dataType : "json",
	 	})
	 	  // Code to run if the request succeeds (is done);
	 	  // The response is passed to the function
	 	  .done(function( returnedData ) {
	 		  console.log(returnedData);
	 		// $("#exampleTextarea").text(returnedData);
	 		var json_str = JSON.stringify(returnedData, null, 8);
	 		//$("#exampleTextarea").text(json_str);
	 		$("#exampleTextarea").text(returnedData[0]);
	 		


			var select = $('#sports2');
			select.find('option').remove();
			$.each(returnedData, function(index, value) {
				console.log(value);
				$('<option>').val(value).text(value).appendTo(select);
			});
			select.selectpicker('refresh');
		 		
	 		
	 		
	 		
//	 	     //$( "<h1>" ).text( json.title ).appendTo( "body" );
//	 	     //$( "<div class=\"content\">").html( json.html ).appendTo( "body" );
//	 		  var json_str = JSON.stringify(returnedData, null, 8);
//	 			$("#exampleTextarea").text(json_str);
//	 			$("#p_json_response").text(returnedData.features[1].geometry.coordinates[0]);
//	 			
//	 			$.each(returnedData.features, function(index, element) {
//	 	            $('body').append($('<div>', {
//	 	                text: element.type
//	 	            }));
//	 	        });
//	 			
//	 			$.each(returnedData.features, function(index, element) {
//	 	            $('body').append($('<div>', {
//	 	                text: element.geometry.type
//	 	            }));
//	 	        });
	 	  })
	 	  // Code to run if the request fails; the raw request and
	 	  // status codes are passed to the function
	 	  .fail(function( xhr, status, errorThrown ) {
	 	    alert( "Sorry, there was a problem!" );
	 	    console.log( "Error: " + errorThrown );
	 	    console.log( "Status: " + status );
	 	    console.dir( xhr );
	 	  })
	 	  // Code to run regardless of success or failure;
	 	  .always(function( xhr, status ) {
	 	//   alert( "The request is complete!" );
	 		//  $.toast('Toast message to be shown');    		  
	 		  
	 	  });
	 
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	$("#b_submitGetCapabilities").click(function() {
	 	var url = $("#input_getCapabilitesURL").val();
	 	
	 	console.log(url);
	 	
	 	$.ajax({
	 	    // The URL for the request //"post.php"
	 	    url: url,
	 	    // The data to send (will be converted to a query string)
//	 	    data: {
//	 	    	  "request": "GetCapabilities",
//	 	    	  "service": "SOS"
//	 	    	},
	 	    // Whether this is a POST or "GET" request
	 	    type: "GET",
	 	    // The type of data we expect back //"json" //"text"
	 	    dataType : "json",
	 	})
	 	  // Code to run if the request succeeds (is done);
	 	  // The response is passed to the function
	 	  .done(function( returnedData ) {
	 	     //$( "<h1>" ).text( json.title ).appendTo( "body" );
	 	     //$( "<div class=\"content\">").html( json.html ).appendTo( "body" );
	 		  var json_str = JSON.stringify(returnedData, null, 8);
	 			$("#exampleTextarea").text(json_str);
	 			$("#p_json_response").text(returnedData.features[1].geometry.coordinates[0]);
	 			
	 			$.each(returnedData.features, function(index, element) {
	 	            $('body').append($('<div>', {
	 	                text: element.type
	 	            }));
	 	        });
	 			
	 			$.each(returnedData.features, function(index, element) {
	 	            $('body').append($('<div>', {
	 	                text: element.geometry.type
	 	            }));
	 	        });
	 	  })
	 	  // Code to run if the request fails; the raw request and
	 	  // status codes are passed to the function
	 	  .fail(function( xhr, status, errorThrown ) {
	 	    alert( "Sorry, there was a problem!" );
	 	    console.log( "Error: " + errorThrown );
	 	    console.log( "Status: " + status );
	 	    console.dir( xhr );
	 	  })
	 	  // Code to run regardless of success or failure;
	 	  .always(function( xhr, status ) {
	 	//   alert( "The request is complete!" );
	 		//  $.toast('Toast message to be shown');    		  
	 		  
	 	  });
	 
	});

    $(document).ajaxStart(function(){
        $("#div_wait").css("display", "block");
      //  $("#div_godzilla").css("display", "block");
        
        
    });
    
    $(document).ajaxComplete(function(){
        $("#div_wait").css("display", "none");
    //    $("#div_godzilla").css("display", "none");
        var name="kieran";
        
   	 $.toast({
		    heading: 'Success',
		    text: 'Request was successful.',
		    icon: 'success',
		    position: 'top-center'
		});
   	
    });	
	
    $("#exampleTextarea").click(function(){
   	 $("#p_json_response").text("textarea clicked!");
   	
   	 $.toast({
   		    heading: 'Success',
   		    text: 'This is textarea.',
   		    icon: 'info'
   		});
    });	
    
    
	
	
	$( "form" ).on( "submit", function( event ) {
		console.log("aaaaaaaaaaa");
		  event.preventDefault();
		  console.log( $( this ).serialize() );
		});
	
	
});
