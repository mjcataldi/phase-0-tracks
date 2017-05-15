// RELEASE 0
// Create function that find's longest phrase
// Argument of an array
// loop through each one and see about longest one
// create condition where if phrase is longest, saves the ordinal value in a number variable
// return value based on ordinal value
function findLongestPhrase(phrase_array) {
  var position = 0;
  var max_length = 0;

  for (var i = 0; i < phrase_array.length; i++) {
    if (phrase_array[i].length > max_length) {
      max_length = phrase_array[i].length;
      position = i;
    }
  }
  return phrase_array[position];
}
// var my_array = ["First Phrase", "Second Phrase", "Third Phrase"];
// console.log("The longest phrase in my_array is '" + findLongestPhrase(my_array) + "'");

// RELEASE 1
// create function
// cycle through all values
// if at any time the object has two values that are the same, return true, else at end of code, return false
function hasSamePair(object_1, object_2){
  for (var key_i in object_1){
    for (var key_j in object_2){
      
      if ((key_j == key_i) && (object_1[key_i] == object_2[key_j])) {
          return true;
      }
    }
  }
  return false;
}
console.log(hasSamePair(
  {name: "Matthew", email: "mcataloe@gmail.com"},
  {name: "Jenna", email: "jcataldi14@gmail.com"}
  ));

// RELEASE 2
// function generates a word based on user preference with number of letters
// Math.random to generate random number, multiply it by 26 and add 1, then round it down to the nearest integer
// add new letter to variable that will hold all subsequent letters and return new generated word at end
function generateWord(number_of_letters){
  var new_position = 0;
  var new_word = "";
  
  for (var i = 0; i < number_of_letters; i++){
    new_position = Math.floor((Math.random() * 26) + 1); // finds a random number from 1 - 26
    var chr = String.fromCharCode(96 + new_position);  // finds the ASCII lower-case letter
    
    new_word += chr;
  }
  new_word = new_word.charAt(0).toUpperCase() + new_word.substring(1, new_word.length - 1);
  return new_word;
}


// generates a random array of words by using the rand() function in the Math static class
// stores these words in an initialized blank array and then returns them when done
// utilizes the code used beforehand via separation of concerns
function generateRandomWordArray(number_of_words){
  var array = [];
  
  for (var i = 0; i < number_of_words; i++){
    array.push(generateWord(Math.random() * (10 - 4) + 4));
  }
  
  return array;
}
console.log(findLongestPhrase(generateRandomWordArray(10)));