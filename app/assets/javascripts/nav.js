$(function(){

  $('.bar').on('click', function(){
    location.href= "http://localhost:3000/images"
  });
  $('.bar').on('click', function(){
    $('.bar1,.bar2').removeClass('bar-ext');
    $(this).addClass('bar-ext');
  });

  $('.bar1').on('click', function(){
    location.href= "http://localhost:3000/images/favorite"
  });
  $('.bar1').on('click', function(){
    $('.bar,.bar2').removeClass('bar-ext');
    $(this).addClass('bar-ext');
  });

  $('.bar2').on('click', function(){
    location.href= "http://localhost:3000/images/access"
  });
  $('.bar2').on('click', function(){
    $('.bar,.bar1').removeClass('bar-ext');
    $(this).addClass('bar-ext');
  });

});