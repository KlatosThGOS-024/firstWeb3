// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
contract PausableToken {
    address public owner;
    bool public paused;
    mapping(address => uint256) public balances;

    constructor() {
        owner = msg.sender;
        paused=false;
        balances[owner]=2000;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }
     modifier notPaused() {
        require(!paused,"Contract is paused");
        _;
    }
    function transfer(address to, uint256 amount) public notPaused {
        require(balances[owner] >= amount,"NO money");
        balances[owner]-=amount;
        balances[to]+=amount;     

    }


}