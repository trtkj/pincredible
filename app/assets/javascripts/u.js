$(function(){
  $('.tiles').imagesLoaded(function(){
    $('.tiles').masonry({
      itemSelector: ".tiles__item",
      fitWidth: true,
      transitionDuration: 0
    });
  });
  var $tiles = $('.tiles').masonry({
    itemSelector: ".tiles__item",
    fitWidth: true,
    transitionDuration: 0
  });
  var msnry = $tiles.data('masonry');
  $tiles.infiniteScroll({
    path: '.next a',
    append: '.tiles__item',
    history: false,
    outlayer: msnry,
    elementScroll: '.container',
    hideNav: '.pagination',
    status: '.page-load-status'
  });
  $tiles.on( 'append.infiniteScroll', function() {
    $(".hoverTrigger").hover(function(){
      $(this).parent().css('background-color', '#EFEFEF');
      $(this).find(".no-img").css('background-color', '#CDCDCD');
      $(this).find(".item-edit").removeClass("hidden");
    }, function(){
      $(this).parent().css('background-color', 'white');
      $(this).find(".no-img").css('background-color', '#EFEFEF');
      $(this).find(".item-edit").addClass("hidden");
    });
  });
});
