/**
 * 
 */
$(document).ready(function() {
	

	$('.selectpicker').selectpicker({
	  //style: 'btn-default',
		  //,size: "auto" //false
		  //  ,width: "150px"
	  size: 7
	});
	
	
	//dropdown
	$('#sports').change(function(event) {
		console.log("sports");
		var sports = $("select#sports").val();
		$.get('Dropdown', {
			sportsName : sports
		}, function(response) {

			var select = $('#player');
			select.find('option').remove();
			$.each(response, function(index, value) {
				console.log(value);
				$('<option>').val(value).text(value).appendTo(select);
			});
		});
	});
	
	
	//dropdown
	$('#sports2').change(function(event) {
		console.log("sports2");
		var sports = $("select#sports2").val();
		$.get('Dropdown', {
			sportsName : sports
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
	$("#add").click(function ()
	{
		console.log("add");
		var select2 = $('#player2');
	select2.each(function(el) {
	                        alert($(this).val())
	                    data[$(this).attr("sportsName")] = $(this).val();
	                        
	            });

	      $.ajax({
	             type: 'GET',
	             url:  'Dropdown', 
	             data: JSON.stringify({
	     			sportsName : data
	     		}),
	                              
	             success: function(msg){              
	                   
	            }   
	      });

	     }); 
	

	
	
	
	$( "form" ).on( "submit", function( event ) {
		console.log("aaaaaaaaaaa");
		  event.preventDefault();
		  console.log( $( this ).serialize() );
		});
	
	
});
