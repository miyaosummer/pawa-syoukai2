$(function(){
  $.when(
    $(".howto-main").animate({
      'margin':'0px',
      'opacity':'1'
    },1000)
  ).done(function(){ 
    $(".howto-main__notise__first").animate({
      'opacity':'1',
    },1000);
    $(".howto-main__img__second").animate({
      'opacity':'1',
    },1000);
  });  
});




