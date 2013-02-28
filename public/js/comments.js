$(document).ready(function(){
  $(".comment-form").submit(function(e) {
    e.preventDefault();
    $.ajax ({
      url: this.action,
      type: this.method,
      dataType: "json",
      data: $(this).serialize()
    }).done(function(response) {
      debugger
      $(".comment-list").append(response.comment);
    }).fail(function(){
    }).always(function() {
      $(".comment-field").val("");
    });
  });
});
