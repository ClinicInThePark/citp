//automatically loads Jquery code when the DOM finishes loading. 
$(document).ready(function(){ 
	$('.passport_field').on('click', function(e){
		$(this).addClass('checked')
		$('options').css("display","block")

	});

	


});