// Create function that find's longest phrase
// Argument of an array
// loop through each one and see about longest one
// create condition where if phrase is longest, saves the ordinal value in a number variable
// return value based on ordinal value

// RELEASE 0
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


// COME BACK TO THIS LATER
function hasSamePair(object_1) {
  // for(var i = 0; i < Object.keys(object_1).length; i++){
  //   if object_1[i]
  // }

  for (var key in object_1) {
    if (object_1.hasOwnProperty(key)) {
      console.log(key);
      console.log(object_1[key]);
      // console.log(key + " -> " + object_1[key]);
    }
  }
  
  // console.log(Object.keys(object_1).length);
}
// console.log(hasSamePair({
//   name: "Matthew",
//   age: 35
// }));


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


function generateRandomWordArray(number_of_words){
  var array = [];
  
  for (var i = 0; i < number_of_words; i++){
    array.push(generateWord(Math.random() * (10 - 4) + 4));
  }
  
  return array;
}

console.log(generateRandomWordArray(10));