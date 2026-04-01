// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SubscriptionService {

    address public owner;

    struct Subscription {
        uint plan;
        uint expiry;
    }

    mapping(address => Subscription) public subscribers;

    uint public basicPrice = 0.01 ether;
    uint public premiumPrice = 0.02 ether;
    uint public vipPrice = 0.03 ether;

    constructor() {
        owner = msg.sender;
    }

    function subscribe(uint _plan) public payable {

        require(_plan >= 1 && _plan <= 3, "Invalid plan");

        uint price;

        if(_plan == 1){
            price = basicPrice;
        }
        else if(_plan == 2){
            price = premiumPrice;
        }
        else{
            price = vipPrice;
        }

        require(msg.value >= price, "Insufficient payment");

        subscribers[msg.sender] = Subscription({
            plan: _plan,
            expiry: block.timestamp + 30 days
        });
    }

    function checkSubscription(address user) public view returns(uint plan, uint expiry) {
        Subscription memory sub = subscribers[user];
        return (sub.plan, sub.expiry);
    }

    function isActive(address user) public view returns(bool){
        return subscribers[user].expiry > block.timestamp;
    }

    function withdraw() public {
    require(msg.sender == owner, "Only owner");

    (bool success, ) = owner.call{value: address(this).balance}("");
    require(success, "Transfer failed");
}
}