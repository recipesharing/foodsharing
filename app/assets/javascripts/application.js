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

  $(".comment-box").on('click', '.delete-comment', () => { $(this).parent().parent().fadeOut(); });
// Todo: rebind problems for delete
  $(".delete-comment").bind('ajax:success', function(){
    $(this).parent().parent().fadeOut();
  });

  // $(staticAncestors).on(eventName, dynamicChild, function() {});
  // $(".delete-comment").on("click", () => { $(this).parent().parent().fadeOut(); } )

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

  // cook-books cuisine list
  $(".cuisine").on("click", function(){
    $(this).toggleClass("pick-cuisine");
  });
  // cook-books ingredient list
  $(".ingredient").on("click", function(){
    $(this).toggleClass("pick-ingredient");
  });
  // cook-books
  $(".season").on("click", function(){
    $(this).toggleClass("pick-season");
  });

  $("form#cookbooks").on("submit", function(){
    getCuisineList();
    getIngredientList();
    getSeasonList();
  });

  $("#filter-btn").on("click", function(){
    getCuisineList();
    getIngredientList();
    getSeasonList();
    getSortList();
    // submit form
    $("form#cookbooks").submit();
  });

  /*
   * Get data for hidden form
   */
  function getCuisineList(){
    // variable
    var $hidden_cuisine = $("<input type='hidden' name='cuisine' id='cuisine'/>");
    // get list data from picked item
    var cuisine_selector = $("ul#cuisine-list").find("li.pick-cuisine");
    // debugger;
    var cuisine = [];
    jQuery.each(cuisine_selector, function(){
      cuisine.push($(this).val());
    });
    // append data to form
    $hidden_cuisine.val((cuisine));
    if (cuisine.length > 0) { $("form#cookbooks").append($hidden_cuisine); }
    return true;
  };
  function getIngredientList() {
    var $hidden_ingredient = $("<input type='hidden' name='main_ingredient' id='main_ingredient'/>");
    var ingredient_selector = $("ul#ingredient-list li.pick-ingredient");
    var ingredient = [];
    jQuery.each(ingredient_selector, function(){
      ingredient.push($(this).val());
    });
    // append data to form
    $hidden_ingredient.val((ingredient));
    if (ingredient.length > 0) { $("form#cookbooks").append($hidden_ingredient); }
  };
  function getSeasonList() {
    var $hidden_season = $("<input type='hidden' name='season' id='season'/>");
    var season_selector = $("ul#season-list li.pick-season");
    var season = [];
    jQuery.each(season_selector, function(){
      season.push($(this).val());
    });
    // append data to form
    $hidden_season.val((season));
    if (season.length > 0) { $("form#cookbooks").append($hidden_season); }
  };

  function getSortList() {
    var $hidden_sort = $("<input type='hidden' name='sort' id='sort'/>");
    const sort_selector =  $(".sort-items li")
    var sort = [];
    sort_selector.each(function(){
      if($(this).attr('dir') !== ''){
        sort.push($(this).attr('id') + '/' + $(this).attr('dir'));
      }
    });
    // stringtify and encode it
    var instruction_json = encodeURIComponent(JSON.stringify(instructions));
    $hidden_step.val(instruction_json);
    $("form#video-upload").append($hidden_step);
  });
  $(function() {
  var stripeResponseHandler, $cardForm;

  $cardForm = $('#card-details');
  stripeResponseHandler = function(status, response) {
    if (response.error) {
      $cardForm.find('.payment-errors').text(response.error.message);
      $cardForm.find('input[type=submit]').prop('disabled', false);
    } else {
      var token = response.id;

      $cardForm.append($('<input type="hidden" name="stripe_token" />').val(token));
      $cardForm.get(0).submit();
    }
  };

  $cardForm.submit(function() {
    Stripe.card.createToken(this, stripeResponseHandler);

    return false;
  });
});

  $("button#video-upload-submit").on("click", () => {
    // check if input filled
    // $("form#video-upload input").each
    $("form#video-upload").submit();
  });
});
