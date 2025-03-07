
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// 1️⃣ Create a Twitter Contract ✔️
// 2️⃣ Create a mapping between user and tweet ✔️
// 3️⃣ Add function to create a tweet and save it in mapping ✔️
// 4️⃣ Create a function to get Tweet ✔️
// 5️⃣ Add array of tweets ✔️

contract TiwtterContract {
    struct Twittes {
        string author;
        string content ;
        uint256 timestamp;
        uint256 likes;
    }
    mapping (address=>Twittes[]) myTweets;

    function createTweet(string memory _content,string memory _author,uint256  _timestamp,uint256  _likes) public {
       // require(bytes(_content).length <=28,"No more tweet");
       
    if(bytes(_content).length <=28){
           Twittes memory  newTweet = Twittes({
        author:_author,
        content:_content,
        timestamp:_timestamp,
        likes:_likes
        });
        myTweets[msg.sender].push(newTweet);
    }else {
        
    }
    }
    
    function getTweet(address _owner) public view returns (Twittes[] memory) {
        return  myTweets[_owner];
    }

}