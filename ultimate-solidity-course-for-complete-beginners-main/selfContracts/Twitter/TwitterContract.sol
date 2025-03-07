
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

    struct tweetLikes {
        address _liker;
    }
     tweetLikes memory newLiker = tweetLikes({_liker: msg.sender});
        Liker.push(newLiker);
    tweetLikes[] public Liker;
    uint16 likes=0;
    address public owner;
    uint16 public MAX_LENGTH = 30;
    mapping (address=>Twittes[]) public  myTweets;
    constructor(){
    owner=msg.sender;
    likes=0;
    }
    modifier onlyOwner (){
        require(msg.sender==owner,"I need owner");
        _;
        }
      modifier  noSelf  (){
        require(msg.sender!=owner,"I dont need owner");
        _;
        }
    function createTweet(string memory _content,string memory _author,uint256  _timestamp,uint256  _likes) public onlyOwner {
        require(bytes(_content).length <=MAX_LENGTH,"No more tweet");
       
        Twittes memory newTweet = Twittes({
        author:_author,
        content:_content,
        timestamp:_timestamp,
        likes:_likes
        });
        myTweets[msg.sender].push(newTweet);
      
    
    }
    
    function getTweet(address _owner) public view returns (Twittes[] memory) {
        return  myTweets[_owner];
    }
function likeTweet(address tweetOwner, uint256 tweetIndex) public noSelf {
        // Ensure the tweet exists
        require(tweetIndex < myTweets[tweetOwner].length, "Invalid tweet index");

        // Increment the likes for the specific tweet
        myTweets[tweetOwner][tweetIndex].likes += 1;

        // Optionally, track who liked the tweet
        tweetLikes memory newLiker = tweetLikes({_liker: msg.sender});
        Liker.push(newLiker);
    }
     
    function incContentLen(uint16 i) public  onlyOwner {
        MAX_LENGTH = i;
    } 

}