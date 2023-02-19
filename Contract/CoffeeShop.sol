//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CoffeeShop {
  uint public availableCoffeeTokens = 20; // number of available coffee tokens to sell
  uint public coffeePrice = 1 ether;  // 1 ETH 
  mapping(address => uint) public soldCoffeeTokensArray; // map of coffee tokens

  function buyToken(uint amount) public payable {
    require( availableCoffeeTokens >= amount, "Not Enough Coffee Tokens, aborting" ); // checks if the are enough coffe tokens! 
    require( msg.value == (amount * coffeePrice), "Not Enough Eth, aborting" ); // checks if the correct amount of eth is being recieved 
    soldCoffeeTokensArray[msg.sender] += amount; 
    availableCoffeeTokens -= amount;
  }

}