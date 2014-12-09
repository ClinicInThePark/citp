$(document).ready(function() {
    $('#dialog_form').hide();
    $('#add_role_view').click(function() {
        $('#dialog_form').dialog( {
            show : "slide",
            hide : "toggle",
            width: 800,
            height: 200,
            modal: true,
            title: "Add New Editor",
            buttons: {
                "Add": function()
                {
                   $('#dialog_form').html("<%= escape_javascript(render 'index') %>");
				   $('#dialog_form').css("display","inline-block");
					
                },
                "Cancel" : function()
                {
                    $("#dialog_form").dialog("close");
                }
            }
        }).prev().find(".ui-dialog-titlebar-close").hide(); // To hide the standard close button
            return false
    });
});	