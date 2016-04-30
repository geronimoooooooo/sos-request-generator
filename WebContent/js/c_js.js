/**
 * 
 */
$(document).ready(function() {
	

	$('.selectpicker').selectpicker({
	  style: 'btn-info',
	  size: 4
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
	
	
	
	
	
	
	
	
});
