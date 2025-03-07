// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;


contract Twitter{
     struct  Transaction   {
        address sender;
        address receiver;
        uint256 amntTransfer;
        uint256 timeStamp;
    }

        address public  userAdd;
        uint256  public  balance;
        bool  public  pause;
        Transaction[]  public  transcations;
    constructor(){
        userAdd = msg.sender;
        balance = 1000;
        pause = false;
    }

modifier onlyOwner ()  {
            require (msg.sender==userAdd,"User invalid");
            _;

}
modifier isPause  ()  {
            require (!pause,"User paused");
_;
}
function pauseFunc() isPause public {
                pause = true;
            }
            
    function transfer(address  to, uint256 amount) onlyOwner isPause public {
        require(balance>=amount,"User doesnt have enough balance");
        Transaction memory newTrans = Transaction({sender:msg.sender,receiver:to,amntTransfer:amount,timeStamp:123});
    transcations.push(newTrans);
        balance -= amount;

    }
    function getTransactionHistory() public view   returns ( Transaction[] memory){
        return  transcations;
        
    }
        function mint() isPause onlyOwner public {

            balance+=100;
        
    }
          function burn() isPause onlyOwner public {      
                          require(balance >= 100, "Insufficient balance to burn");

            balance-=100;
        
    }
   
}