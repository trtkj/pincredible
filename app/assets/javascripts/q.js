$(function() {

  function setTiles(){
    $(".tiles").masonry({
      itemSelector: ".tiles__item",
      fitWidth: true,
      transitionDuration: 0
    });
  }

  function saveToBoardMsg(board_title, pin_image_url){
    $(".modal").hide();
    $("#upload1").show();
    $("#upload2").hide();
    var target = $("#modal-saveSuccess").find(".content2");
    var imgHtml = $('<img>').attr({src: pin_image_url, class: "preview"});
    target.append(imgHtml);
    target.append("「" + board_title + "」に保存しました!");
    $("#modal-saveSuccess").show();
    $(".modal__bg, .close-button").click(function(){
      $("#modal-saveSuccess").hide();
    });
  }

  function saveToBoard(board_id, pin_id){
    var selectBoardUrl = "/boards/" + board_id;
    console.log("saveToBoardメソッドが呼ばれました")
    $.ajax({
      type: "POST",
      url: "/board_pins",
      data: {
        "board_id": board_id,
        "pin_id": pin_id
      },
      dataType: "json"
    })
    .done(function(data){
      saveToBoardMsg(data.board_title, data.pin_image.url);
    })
    .fail(function(){
      alert("ボードへの登録に失敗しました");
    });
  }
  setTiles();

  $(".modal-open").click(function(){
    $(".modal").hide();
    var modal = '#' + $(this).attr('data-target');
    $(modal).show();
    $(".modal__bg, .close-button").click(function(){
      var thisForm = $(this).parents("form")[0];
      if (thisForm) {
        thisForm.reset();
      };
      $(modal).hide();
      $("#upload1").show();
      $("#upload2").hide();
    });
  });

  $('form').on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    reader.onload = function(e){
      var imgHtml = $('<img>').attr({src: e.target.result, class: "preview"});
      $("#upload1").hide();
      $("#upload2").show().css('display', 'flex');
      $(".modal-image").empty();
      $(".modal-image").append(imgHtml);
    };
    reader.readAsDataURL(file);
  });

  $("#boardsOn").click(function() {
    $("#boards").css('display','block');
    setTiles();
    $("#pins").css('display','none');
    $("#pinsOn").removeClass('select');
    $(this).addClass('select')
  });

  $("#pinsOn").click(function() {
    $("#pins").css('display','block');
    setTiles();
    $("#boards").css('display','none');
    $("#boardsOn").removeClass('select');
    $(this).addClass('select')
  });

  $(".newPinTrigger").click(function(){
    var board_id = $(this).attr("id");
    var thisForm = $(".newPinForm")
    var newPinUrl = thisForm.attr("action");
    var fd = new FormData(thisForm.get(0));
    $.ajax({
      type: "POST",
      url: newPinUrl,
      data: fd,
      processData: false,
      contentType: false,
      dataType: "json"
    })
    .done(function(data){
      console.log("ピン作成OK");
      var pin_id = data.pin_id;
      saveToBoard(board_id, pin_id);
    })
    .fail(function(){
      alert("ピンの作成に失敗しました");
    });
  });

  $(".saveToBoardTrigger").click(function(){
    var board_id = $(this).attr("id");
    var pin_id = $(this).closest(".modal__window").attr("id");
    saveToBoard(board_id, pin_id);
  });

  $(".hoverTrigger").hover(function(){
    $(this).parent().css('background-color', '#EFEFEF');
    $(this).find(".no-img").css('background-color', '#CDCDCD');
    $(this).find(".item-edit").removeClass("hidden");
  }, function(){
    $(this).parent().css('background-color', 'white');
    $(this).find(".no-img").css('background-color', '#EFEFEF');
    $(this).find(".item-edit").addClass("hidden");
  });

  $(".releaseToggle").click(function(){
    $(this).toggleClass("toggleOn");
    $(".releaseTrigger").toggle();
  });

});
