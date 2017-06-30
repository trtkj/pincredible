$(function(){
  var $tiles = $('.tiles').css({ opacity: 0 });
  var $tilesM = $tiles.masonry({
      itemSelector: ".tiles__item",
      fitWidth: true,
      transitionDuration: 0
    });

  // Masonry並び替え
  function setTiles(){
    $('.tiles').masonry({
      itemSelector: ".tiles__item",
      fitWidth: true,
      transitionDuration: 0
    });
  }
  
  // ユーザーページのボードとピンの表示切り替え
  $(".show-trigger__option").click(function(){
    var showId = $(this).attr("data-target")
    $(".tiles").addClass("hidden");
    $(showId).removeClass("hidden");
    $(".show-trigger__option").removeClass("select");
    $(this).addClass("select");
    setTiles();
  });

  $tiles.imagesLoaded(function(){
    $tiles.animate({ opacity: 1 });
    $tiles.masonry({
      itemSelector: ".tiles__item",
      fitWidth: true,
      transitionDuration: 0
    });
  });

  var msnry = $tilesM.data('masonry');
  $tilesM.infiniteScroll({
    path: '.next a',
    append: '.tiles__item',
    history: false,
    outlayer: msnry,
    elementScroll: '.container',
    hideNav: '.pagination',
    status: '.page-load-status'
  });
  $tilesM.on( 'append.infiniteScroll', function() {
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
