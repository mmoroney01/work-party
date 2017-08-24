$(document).ready(function() {
  taskListener();
});

// <div class="assigned">
//   <% @cleaning.guests.each do |guest| %>
//     <% guest.tasks.each do |task| %>
//     <p id="<%= guest.id %>"><%= guest.first_name %> <%= guest.last_name + ":" + " "%><%= task.description %></p>
//     <% end %>
//   <% end %>
// </div>

 // <%= guest.first_name %> <%= guest.last_name %> will <%= guest.tasks[0].description %><br>

// <p id="<%= guest.id %>"><%= guest.first_name %> <%= guest.last_name + ":" + " "%><%= task.description %></p>

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
      $(".task-form").reset();
    })
  })
}

