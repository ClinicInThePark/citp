//automatically loads Jquery code when the DOM finishes loading. 
$(document).ready(function(){ 
	
	$('.passport_field').click(function(e) {
		if ($(this).hasClass('checked')){
				$(this).removeClass('checked')
			}else{
				$(this).addClass('checked')
			}
			
		if ($('#p-container').hasClass('.messagePop')){
			$('#p-container').removeClass('.messagePop');
		}else{
			var divMessage = '<div class="messagePop"><div class="boothmsg">'+$(this).text()+'</div><button>For more info</button><button class="setChecked"> Check off this field</button></div>'
			$('#p-container').append(divMessage);
			$('.messagePop').css({'left': e.clientX + 'px','top': e.clientY  + 'px','display': 'block'})
			$('.messagePop').fadeIn('fast');
		}

		$('.setChecked').click(function(){
			if ($(this).closest(".passport_field").hasClass('checked')){
				$('.passport_field').removeClass('checked')
			}else{
				$(this).closest('.passport_field').addClass('checked')
			}
		});
	});

	



	$( document ).mouseup( function ( event ) {
      var $container = $( '.main-image' );
      // if the target of the click isn't the container...
      if ( !$container.is( event.target ) &&
          // ... nor a descendant of the container
          $container.has( event.target ).length === 0 ) { 
        $( '.messagePop' ).fadeOut( 'fast' );
        
      }
    });

	


});