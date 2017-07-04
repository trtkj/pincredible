$(function(){
  var levels = 4;
  var items = $(".tag-cloud__item");
  var tagNums = [];
  items.each(function(i, item){
    tagNums.push($(item).attr("data-tagNum"));
  });
  var maxNum = Math.max.apply(null, tagNums);
  var minNum = Math.min.apply(null, tagNums);
  var sqrtMax = Math.sqrt(maxNum);
  var sqrtMin = Math.sqrt(minNum);
  var a = (sqrtMax - sqrtMin) / levels

  if (a == 0) {
      items.addClass("cloud-level-2");
  }else{
    items.each(function(i, item){
      var tagNum = $(item).attr("data-tagNum");
      var sqrtNum = Math.sqrt(tagNum);
      var level = Math.floor((sqrtNum - sqrtMin) / a);
      $(item).addClass("cloud-level-" + level);
    });
  }
});
