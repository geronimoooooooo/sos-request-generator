/**
 * 
 */
$(document).ready(function() {
	

	$('.selectpicker').selectpicker({
	  //style: 'btn-default',
		  //,size: "auto" //false
		  //  ,width: "150px"
	  size: 10
	});
	
	
	//dropdown
	$('#sports2').change(function(event) {
		console.log("sports2");
		var procedureUrn = $("select#sports2").val();
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
	
	
	var data = {};
	var list_observedProopertySelected;
	var str_observedProopertySelected;
		$("#createRequest").click(function() {
			console.log("Button#createRequest");
			var select2 = $('#player2');
			select2.each(function(el) {
			//	alert($(this).val())
				str_observedProopertySelected= ($(this).val());
				data[$(this).attr("observedProperty")] = $(this).val();
				//console.log($(this).val());
				
			});
			console.log("str: "+str_observedProopertySelected);
			var arr="a,b,c,d";
			list_observedProopertySelected = str_observedProopertySelected.toString().split(",");
			console.log("list_observedProopertySelected[0] :"+list_observedProopertySelected[0]);
			$("#exampleTextarea").text="..............";
			 $("#exampleTextarea").append("your text to append");
			for(i=0; i < list_observedProopertySelected.length; i++){
				$("#exampleTextarea").append("\n");
				$("#exampleTextarea").append("&lt;sos:observedProperty&gt;");
				$("#exampleTextarea").append(list_observedProopertySelected[i]);
				$("#exampleTextarea").append("&lt;/sos:observedProperty&gt;");
			}
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
        $("#wait").css("display", "block");
        
    });
    
    $(document).ajaxComplete(function(){
        $("#wait").css("display", "none");
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
