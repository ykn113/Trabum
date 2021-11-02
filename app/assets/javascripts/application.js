//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// 獲得したバッジの透明度を変える
$(document).on('turbolinks:load', function() {
  var badge_array = $(".badge_array").val()
  $.each(JSON.parse(badge_array), function(index, value){
     $("#"+value).addClass("completed")
  })
});