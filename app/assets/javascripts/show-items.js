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

  // ログイン画面の背景
  var scrollSpeed = 1;
  var posX = 0;
  setInterval(function(){
    posX += scrollSpeed;
    $(".container-signup").css("background-position" , posX + "px 50%")
  } , 50);
});
