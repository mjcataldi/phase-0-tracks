// Release 0

// Declare arrays
var colors = ["blue", "red", "black", "pink"];
var names = ["Jaguar", "Domino", "Pirate", "Fiona"];

// Add another color and horse to arrays

colors.push("brown");
names.push("Olaf");


console.log(colors, names);

// Release 1

var horse_object = {};

for (var i = 0; i < colors.length; i++) {
  horse_object[names[i]] = colors[i];
}

console.log(horse_object);

// Car object
function Car(color, year, isWorking) {
  console.log("Initializing car. . .", this)
  
  this.color = color;
  this.year = year;
  this.isWorking = isWorking;
  
  this.revEngine = function() {
    console.log("Vroom, vroom!");
  }
  
  console.log("Initialization complete. . . ", this);
}

// var car_1 = new Car("red", 1995, true);
// car_1.revEngine();

// var car_2 = new Car("blue", 2017, false);
// car_2.revEngine();

// var car_3 = new Car("black", 2014, true);
// car_3.revEngine();

console.log("I will now ask you for your name.");
var name = prompt("Enter your name");
console.log("Hello ".concat(name, ". How are you"));