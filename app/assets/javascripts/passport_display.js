//automatically loads Jquery code when the DOM finishes loading. 
$(document).ready(function(){ 
	
	$('.passport_field').click(function(e) {
		if ($(this).hasClass('checked')){
			$(this).removeClass('checked')
		}else{
			$(this).addClass('checked')
		}
		$('.options').css({
			'left': e.clientX + 'px',
			'top': e.clientY + 'px',
			'display': 'block'
			})
		$('.options').fadeIn('fast');
	});

	$( document ).mouseup( function ( event ) {
      var $container = $( '.main-image' );
      // if the target of the click isn't the container...
      if ( !$container.is( event.target ) &&
          // ... nor a descendant of the container
          $container.has( event.target ).length === 0 ) { 
        $( '.options' ).fadeOut( 'fast' );
        
      }
    });

	


});