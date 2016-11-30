// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require tether
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require cloudinary
//= require social-share-button
//= require owl.carousel
//= require cook_books
//= require react
//= require react_ujs
//= require components
//= require recipes
//= require upload_handler
//= require cook_books
//= require nprogress
//= require nprogress-turbolinks
//= require_tree ./ajaxs
//= require 'uglifier'
//= require_tree .

document.addEventListener("turbolinks:load", function() {
  // call upload hanler
  cookbooks_handler();
  upload_handler_listen();
  // when windows load
  $('#cuisine-list').hide();
  $('#season-list').hide();
  $('#ingredient-list').hide();

  $(".new-comment").bind('ajax:success', function(e, data, status, xhr){
    $(".comment-box").prepend(data);
    $("#comment").val('');
  });

  $(".comment-box").on('click', '.delete-comment',function () { $(this).parent().parent().fadeOut(); });
// Todo: rebind problems for delete
  $(".delete-comment").bind('ajax:success', function(){
    $(this).parent().parent().fadeOut();
  });

  // $(staticAncestors).on(eventName, dynamicChild, function() {});
  // $(".delete-comment").on("click",function () { $(this).parent().parent().fadeOut(); } )

  $(function() {
    if($.fn.cloudinary_fileupload !== undefined) {
      $("input.cloudinary-fileupload[type=file]").cloudinary_fileupload();
    }
  });

  $("#owl-demo").owlCarousel({
      navigation : true, // Show next and prev buttons
      slideSpeed : 300,
      paginationSpeed : 400,
      singleItem:true
  });

  $("form#video-upload").on("submit", function(e) {
    var $hidden_step = $("<input type='hidden' name='instruction'/>");
    var instruction_selector = $(".instruction-steps-list .row.item");
    // Create JSON object and append it to form
    var instructions = []
    jQuery.each(instruction_selector, function(i, item) {
      const title = jQuery(item).find(".title").text();
      const content = jQuery(item).find(".content").text();
      const public_id = jQuery(item).find(".public_id").text();
      var val = {title: title, content: content, public_id: public_id};
      // to make json array
      instructions.push(val);
    });
    // stringtify and encode it
    var instruction_json = encodeURIComponent(JSON.stringify(instructions));
    $hidden_step.val(instruction_json);
    $("form#video-upload").append($hidden_step);
  });

  $("button#video-upload-submit").on("click",function () {
    // check if input filled
    // $("form#video-upload input").each
    $("form#video-upload").submit();
  });
});
