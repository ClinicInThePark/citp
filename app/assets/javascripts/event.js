$(document).ready(function(e){
    $("tr[data-link]").click(function() {
      window.location = this.dataset.link;
    })
})