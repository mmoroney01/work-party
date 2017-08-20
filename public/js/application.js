$(document).ready(function() {
  taskListener();
});

var taskListener = function(){
  $(".task-form").on("submit", function(){
    event.preventDefault();

    var $data = $(this).serialize();
    var $url = $(this).attr("action");
    var $method = $(this).attr("method");

    var request = $.ajax({
      type: $method,
      url: $url,
      data: $data
    })

    request.done(function(response){
      console.log(response);
      $(".assigned").append(response);
    })
  })
}

