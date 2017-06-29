$(function(){

  function insertHtml(element){
    var target = $(".header__search");
    target.remove(".search_result");
    target.append(".search_result")
    $(".header__search").append(element);
  }

  function resultHTML(models, results){
    var targetElement = $("#result-" + models);
    if (results.length == 0){
      var noResult =  $('<div class = "result__text">').append("該当するデータはありません");
      targetElement.append(noResult)
    }else{
      for(var i=0; i < results.length; i++){
        var html = $('<div class = "result__text">');
        var text = results[i].text;
        var link = $("<a>").attr("href", "/" + models + "/" + results[i].id)
        var a_html = link.append(text);
        html.append(a_html);
        targetElement.append(html)
      }
    }
  }

  function clearList(models){
    var targetId = "#result-" + models
    $(targetId).find(".result__text").remove();
  }

  function incrementalSearch(models, input){
    var url = "/" + models
    $.ajax({
      type: "GET",
      url: url,
      data: {
        content: input
      },
      dataType: "json"
    })
    .done(function(results){
      clearList(models);
      var html = resultHTML(models, results);
    })
    .fail(function(){
      alert("検索に失敗しました");
    });
  }

  function closeSearch(){
    $(target).hide();
    overlayHtml.remove();
  }

  var target = $(".search__result");
  var overlayHtml = $('<div class = "container-overlay">');
  $(".search-input").focusin(function(){
    var preInput;
    $(target).show();
    $(".container").append(overlayHtml);
    $(this).on("keyup", function(e) {
      $(".result").show();
      $(".message").hide();
      var input = $(this).val();
      if (input.length == 0) {
        $(".result").hide();
        $(".message").show();
      }
      if (input != preInput && input.length !== 0) {
        var pins = "pins"
        var users = "users"
        var boards = "boards"
        incrementalSearch(pins, input);
        incrementalSearch(users, input);
        incrementalSearch(boards, input);
      }
      preInput = input;
    });

  }).focusout(function(){
    setTimeout(function(){
      closeSearch();
    }, 200);
  });
});
