$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

  // $(".assign-task").on("submit", ".task-form", function(){
  //   event.preventDefault();

  //   var $data = $(this).serialize();
  //   var $url = $(this).attr("action");
  //   var $method = $(this).attr("method");

  //   var request = $.ajax({
  //     type: $method,
  //     url: $url,
  //     data: $data
  //   })

  //   request.done(function(response){
  //     console.log(response);
  //   })

  // })
});
