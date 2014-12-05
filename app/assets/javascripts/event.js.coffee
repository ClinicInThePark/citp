# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$("#single-event").html("<%=escape_javascript(render 'show')%>")
$("#product-modal").modal("show")