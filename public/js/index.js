$(document).ready(function(){
  $(".new-post-button").click(function(e){
    e.preventDefault();
    $(this).hide();
    $('.sign-up').fadeIn();
  });
});