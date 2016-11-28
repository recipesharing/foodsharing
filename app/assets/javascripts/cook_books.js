function cookbooks_handler() {
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
    $hidden_sort.val(sort);
    if (sort.length > 0) { $("form#cookbooks").append($hidden_sort); }
  };

  $('#cuisine-toggle').on('click', function(){
    if($(this).hasClass('fa-chevron-circle-up')){
      $(this).attr('class', 'fa fa-chevron-circle-down');
      $('#cuisine-list').hide();
    }else{
      $(this).attr('class', 'fa fa-chevron-circle-up');
      $('#cuisine-list').show();
    };
  });
  $('#ingredient-toggle').on('click', function(){
    if($(this).hasClass('fa-chevron-circle-up')){
      $(this).attr('class', 'fa fa-chevron-circle-down');
      $('#ingredient-list').hide();
    }else{
      $(this).attr('class', 'fa fa-chevron-circle-up');
      $('#ingredient-list').show();
    };
  });
  $('#season-toggle').on('click', function(){
    if($(this).hasClass('fa-chevron-circle-up')){
      $(this).attr('class', 'fa fa-chevron-circle-down');
      $('#season-list').hide();
    }else{
      $(this).attr('class', 'fa fa-chevron-circle-up');
      $('#season-list').show();
    };
  });
  $("#filter-btn").on("click", function(){
    var $hidden_cuisine = $("<input type='hidden' name='cuisine' id='cuisine'/>");
    var cuisine_selector = $("ul#cuisine-list").find("li.pick-cuisine");
    var cuisine = [];
    jQuery.each(cuisine_selector, function(){
      cuisine.push($(this).val());
    });
    $hidden_cuisine.val((cuisine));
    if (cuisine.length > 0) { $(this).append($hidden_cuisine); }
    $("form#cookbooks").submit();
  });
}
