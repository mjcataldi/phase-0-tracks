// create a function for reversing a string using a loop in javascript
// drover code method first, then user interface

function reverseWord (word_to_reverse){
  var word_reversed = "";
  var word_to_reverse_array = word_to_reverse.split('');
  
  for(var i = word_to_reverse_array.length; i > 0; i--){
    word_reversed += word_to_reverse_array[i-1];
  }
  
  return word_reversed;
}


// // This method is not yet functional
// function userWord(){
//   var repeat = true;

//   while (repeat == true) {
//   repeat = false;
//   console.log("What word would you like to reverse today?");
  
//   // readline() is not implementable
//   var response = readline();
  
//   if (response.length == 0){
//     console.log ("Oops! We need sone text. Let's try that again.");
//     repeat = true;
//     continue;
//   }
  
//   console.log("Your word of " + response + "' reversed is '" + reverseWord (response));
//   }
// }

var newWord = "Flipper";
console.log("The backwards iteration of '" + newWord + "' is '" + reverseWord(newWord).toLocaleLowerCase() + "'");