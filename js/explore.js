// create a function for reversing a string using a loop in javascript
// drover code method first, then user interface

function reverseWord (word_to_reverse){
  word_reversed = ""
  word_to_reverse_array = word_to_reverse.split('');
  for(var i = word_to_reverse_array.length; i > 0; i--){
    word_reversed = word_to_reverse_array[i];
    
  }
  return word_reversed;
}

function userWord()
  var repeat = true;

  while (repeat == true){
  repeat = false;
  console.log ("What word would you like to reverse today?");
  
  response = readline();
  
  if (response.length == 0){
    console.log ("Oops! We need sone text. Let's try that again.");
    
    repeat = true;
    continue;
  }
  
  console.log("Your word of " + response + "' reversed is '" + reverseWord (response);)
  
  }
  
}