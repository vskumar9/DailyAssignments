/* 1. Write a JS program to append an Object to a const Array. */

// Define a constant array
const myArray1 = [];

// Define a constant Object
const myObject = {
  name: 'Alice',
  age: 30
};

// Append the object to the array using the push method
myArray1.push(myObject);

// Log the updated array to the console
console.log(myArray1);


/* 2. Insert,Remove element at the end of Arrray and add element at the front. */
// Define a constant array
const myArray2 = [1, 2, 3, 4, 5];

// insert an element at the end
myArray2.push(6);


// remove the last element
myArray2.pop();

// Add an element at the front
myArray2.unshift(10);

/* 3. Reverse a string using Javascript.*/
// Function to reverse a string
function reverseString(str) { 
    return str.split('').reverse().join('');
}
function reverseStringLoop(str) {
  let reversed = '';
  for (let i = str.length - 1; i >= 0; i--) {
    reversed += str[i];
  }
  return reversed;
}
const reverseString = function reverseStringSpread(str) {
    return [...str].reverse().join('');
}
  
// Example usage
const originalString = 'Hello, World!';
const reversedString = reverseString(originalString);
const reversedStringLoop = reverseStringLoop(originalString);
const reversedStringSpread = reverseStringSpread(originalString);
console.log('Original String:', originalString);
console.log('Reversed String:', reversedString);
console.log('Reversed String:', reversedStringLoop);
console.log('Reversed String:', reversedStringSpread);
  
