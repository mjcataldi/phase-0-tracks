$(function(){
  // $('li:nth-child(3)').addClass('groovy');
  $('li:even').addClass('groovy');
  $(':header').css({
    'color': 'gray',
    'text-decoration':'underline'
  });
  
  var $myNumber = $('li').length - 3;
  $('p:first + p').before("<h2>" + $('li:nth-child(' + $myNumber + ')').text() + "</h2>");
  
  $('p').on('click', function(){
    var $myString = "";
    $myString += "Window h/w: " + $(window).height() + " x " + $(window).width() + "\n";
    $myString += "Window inner h/w: " + $(window).innerHeight() + " x " + $(window).innerWidth() + "\n";
    $myString += "Window outer h/w: " + $(window).outerHeight() + " x " + $(window).outerWidth();
    
    alert($myString);
  });
  
  $('li:first + li').on('click', function(){
    var $myNumber = 2;
    $('li:nth-child(' + $myNumber + ')').before('<li>Cola</li>');
  });
  
  $('button#myButton').on('click', appendClass);
});

function appendClass(){
  $(this).addClass('btn btn-primary');
};