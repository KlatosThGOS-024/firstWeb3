// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

interface  IBank {
    function  deposit(uint256 amount) external;    
    function  withdraw(uint256 amount) external;
    function  getBalance() external;

}

contract BankBase  {
     uint256 internal  balance;
        address internal  owner;
      
    constructor(){
        balance= 0;
        owner = msg.sender;
    }
    function deposity(uint256 amount) public {
        balance +=amount;
    }
    function withdraw(uint256 amount) public {
        balance -=amount;
    }
    function getBalance() public view  returns (uint256){
        return balance;
    }}

contract BankExtended is BankBase {
    string public accountHolder ;
    constructor(string memory name)   {
           accountHolder = name;

        

    }
    modifier onlyOwner(){
        require(owner==msg.sender,"U r not the owenr");
        _;
    }

   function setAccountHolder(string memory name) public {
        accountHolder = name;

    }
   function withdrawAll() public onlyOwner returns (uint256) {
        uint256 tempBalance = balance;
        balance = 0;
        return tempBalance;
    }
}
