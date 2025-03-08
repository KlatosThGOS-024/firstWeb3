// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract TwitterContract {
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }

    event TweetCreated(uint256 id, string content, address author, uint256 timestamp);
    event TweetLiked(  address liker,address tweetAuthor, uint256 LikeCount);
    event TweeUntLiked( address Unliker,address tweetAuthor, uint256 LikeCount);

    address public owner;
    uint16 public maxLength = 30;
    mapping(address => Tweet[]) public myTweets;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    modifier noSelf(address tweetOwner) {
        require(msg.sender != tweetOwner, "Cannot like your own tweet");
        _;
    }

    function createTweet(string memory _content) public {
        require(bytes(_content).length <= maxLength, "Tweet exceeds max length");

        Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _content,
            timestamp: block.timestamp,
            likes: 0
        });

        myTweets[msg.sender].push(newTweet);
        emit TweetCreated(myTweets[msg.sender].length - 1, newTweet.content, msg.sender, block.timestamp);
    }

    function getTweet(address _owner) public view returns (Tweet[] memory) {
        return myTweets[_owner];
    }

    function likeTweet(address tweetOwner, uint256 tweetIndex) public noSelf(tweetOwner) {
        require(tweetIndex < myTweets[tweetOwner].length, "Invalid tweet index");

        myTweets[tweetOwner][tweetIndex].likes += 1;
        emit TweetLiked(msg.sender,tweetOwner,myTweets[tweetOwner][tweetIndex].likes);
        emit TweeUntLiked(msg.sender,tweetOwner,myTweets[tweetOwner][tweetIndex].likes);
 }

    function incContentLen(uint16 i) public onlyOwner {
        maxLength = i;
    }
}
