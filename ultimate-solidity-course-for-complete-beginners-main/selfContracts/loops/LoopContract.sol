// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract SimpleContract {
    struct Expense {
        address user;
        string description;
        uint256 amount;
    }
    address private owner;

    Expense[] public expenses;
    constructor(){
        owner = msg.sender;
        expenses.push(Expense(msg.sender,"Groceries",50));
        expenses.push(Expense(msg.sender,"Transportaion",500));
        expenses.push(Expense(msg.sender,"Dining out",200));
    }
    function BuySomething(string memory _expense, uint256 cost) public{
        Expense memory newExpense = Expense({user:msg.sender,description:_expense,amount :cost});
        expenses.push(newExpense);
        


    }
    modifier onlyOwner () {
        require(msg.sender==owner,"I need owner");
        _;
    }
    function addExpenses(uint256   _sum) onlyOwner view public returns (uint256){
       for(uint i=0;i<expenses.length;i++){
        _sum += expenses[i].amount;
       }
       return  _sum;
        

    }
}