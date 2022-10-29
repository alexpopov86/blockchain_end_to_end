// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity  ^0.5.0;

contract Marketplace {
    string public name;

    struct Product {
        uint id;
        string name;
        uint price;
        address owner;
        bool purchased;
    }

    mapping(uint => Product) public products;
    uint public productCount = 0;

    event ProductCreated(
        uint id,
        string name,
        uint price,
        address owner,
        bool purchased
    );

    constructor() public {
        name = "Alex MarketPlace";
    }

    function createProduct(string memory _name, uint _price) public {
        require(bytes(_name).length > 0);
        require(_price > 0);
        productCount++;
        products[productCount] = Product(productCount, _name, _price, msg.sender, false);
        emit ProductCreated(productCount, _name, _price, msg.sender, false);
    }
}