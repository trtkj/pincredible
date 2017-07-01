$(function() {

  function saveToBoardMsg(board_title, pin_image_url){
    $(".modal").hide();
    $("#upload1").show();
    $("#upload2").hide();
    var target = $("#modal-saveSuccess").find(".content2");
    target.find(".preview").attr("src", pin_image_url)
    target.find(".message-text").text("「" + board_title + "」に保存しました!");
    $("#modal-saveSuccess").show();
    $(".modal__bg, .close-button").click(function(){
      $("#modal-saveSuccess").hide();
    });
  }

  function saveToBoard(board_id, pin_id){
    var selectBoardUrl = "/boards/" + board_id;
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

  $("body").on("click", ".modal-open", function(){
    $(".modal").hide();
    var modal = '#' + $(this).attr('data-target');
    var pin_image = $(this).attr("data-image");
    var pin_id = $(this).attr("data-id");
    $(modal).show();
    $(modal).find(".modal__window").attr("id", pin_id);
    $(modal).find(".preview").attr("src", pin_image);
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

  // 画像アップロード時のプレビュー表示
  $("form").on('change', 'input[type="file"]', function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    var target = $("form");
    reader.onload = function(e){
      // ユーザーのアバター画像の場合
      if (target.hasClass("edit_user")){
        $(".avatar-image").attr({src: e.target.result});
      }
      // ピンの画像の場合
      else if (target.hasClass("newPinForm")){
        var imgHtml = $('<img>').attr({src: e.target.result, class: "preview"});
        $("#upload1").hide();
        $("#upload2").show().css('display', 'flex');
        $(".modal-image").empty();
        $(".modal-image").append(imgHtml);
      }
    };
    reader.readAsDataURL(file);
  });

  // ピン作成画面でボードが選択されたとき
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
      var pin_id = data.pin_id;
      saveToBoard(board_id, pin_id);
    })
    .fail(function(){
    });
  });

  // ピンをボードに保存するボタンが押されたとき
  $(".saveToBoardTrigger").click(function(){
    var board_id = $(this).attr("id");
    var pin_id = $(this).closest(".modal__window").attr("id");
    saveToBoard(board_id, pin_id);
  });

  // アイテムhover時に背景をグレーに
  $("body").on({
    "mouseenter": function(){
      $(this).parent().css('background-color', '#EFEFEF');
      $(this).find(".no-img").css('background-color', '#CDCDCD');
      $(this).find(".item-edit").removeClass("hidden");
      $(this).find(".saveTrigger").removeClass("hidden");
  },
    "mouseleave": function(){
      $(this).parent().css('background-color', 'white');
      $(this).find(".no-img").css('background-color', '#EFEFEF');
      $(this).find(".item-edit").addClass("hidden");
      $(this).find(".saveTrigger").addClass("hidden");
    }
  }, ".hoverTrigger");
  // $(".hoverTrigger").hover(function(){
  //   $(this).parent().css('background-color', '#EFEFEF');
  //   $(this).find(".no-img").css('background-color', '#CDCDCD');
  //   $(this).find(".item-edit").removeClass("hidden");
  //   $(this).find(".releaseTrigger").removeClass("hidden");
  // }, function(){
  //   $(this).parent().css('background-color', 'white');
  //   $(this).find(".no-img").css('background-color', '#EFEFEF');
  //   $(this).find(".item-edit").addClass("hidden");
  //   $(this).find(".releaseTrigger").addClass("hidden");
  // });

  // ボードページでピンを編集する
  $(".releaseToggle").click(function(){
    $(this).toggleClass("toggleOn");
    $(".releaseTrigger").toggle();
  });

});
