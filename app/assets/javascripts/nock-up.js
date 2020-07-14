$(function(){
  $(".howto-main__notise__basic").on("mouseover", function(){
    console.log("乗ってます");
    $(".howto-main__img__second").after("<div class='howto-main__img__basic'></div>");
  });
  $(".howto-main__notise__basic").on("mouseout", function(){
    console.log("離れました");
    $(".howto-main__img__basic").remove();
  });
});

$(function(){
  $(".howto-main__notise__special").on("mouseover", function(){
    console.log("乗ってます");
    $(".howto-main__img__second").after("<div class='howto-main__img__special'></div>");
  });
  $(".howto-main__notise__special").on("mouseout", function(){
    console.log("離れました");
    $(".howto-main__img__special").remove();
  });
});