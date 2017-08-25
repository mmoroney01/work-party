$(document).ready(function() {
  taskListener();
  editButtonListener();
  submitEditListener();
  deleteTaskListener();
});

var deleteTaskListener = function(){
  $(".assigned-tasks").on("submit", ".delete-task", function(){
    event.preventDefault();

    var $container = $(this);

    var request = $.ajax({
      url: $(this).attr("action"),
      method: 'delete'
    })

    request.done(function(){
      $container.closest(".task-container").remove();
    })

  })
}

var submitEditListener = function(){
  $(".edit-container").on("submit", "#edit-submit", function(){
    event.preventDefault();

    var $data = $(this).serialize();
    var $url = $(this).attr("action");

    var request = $.ajax({
      data: $data,
      url: $url,
      method: 'put'
    })

    request.done(function(response){
      $(".cleaning-desc").text(response);
      $("#edit-submit").remove();
    })
  })
}

var editButtonListener = function(){
  $(".edit-container").on("submit", "#edit", function(){
    event.preventDefault();

    var $url = $(this).attr("action");
    var $method = $(this).attr("method");

    var request = $.ajax({
      url: $url,
      method: $method
    })

    request.done(function(response){
      console.log(response);
      $(".edit-container").append(response);
    })
  })
}

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
      $(".assigned-tasks").append(response);
      $(".task-form")[0].reset();
    })
  })
}

