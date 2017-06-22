$(function(){
  function setTiles(selector){
    $(selector).masonry({
      // options
      itemSelector: selector + "__item",
      // columnWidth: 200
      fitWidth: true,
      transitionDuration: 0
    });
  }

  setTiles(".pins");
  setTiles(".boards");

  $(".modal-open").click(function(){
    $(".modal").hide();
    var modal = '#' + $(this).attr('data-target');
    $(modal).show();
    $(".modal__bg, .button").click(function(){
      $(modal).hide();
    });
  });

  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e){
      var imgHtml = $('<img>').attr({src: e.target.result, class: "preview"});
      $("#upload1").hide();
      $("#upload2").show();
      console.log(imgHtml);
      $(".modal-image").append(imgHtml);
    };
    reader.readAsDataURL(file);
  });

  $("#boardsOn").click(function() {
    $(".boards").css('display','block');
    setTiles(".boards");
    $(".pins").css('display','none');
    $("#pinsOn").removeClass('select');
    $(this).addClass('select')
  });

  $("#pinsOn").click(function() {
    $(".pins").css('display','block');
    setTiles(".pins");
    $(".boards").css('display','none');
    $("#boardsOn").removeClass('select');
    $(this).addClass('select')
  });
});
