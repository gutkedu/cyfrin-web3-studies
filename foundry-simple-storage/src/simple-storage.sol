// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract SimpleStorage {
    uint256 myFavoriteNumber = 0; // public is a getter from a external function

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    //dynamic array
    Person[] public listOfPeople; // []

    //map name->number
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _myFavoriteNumber) public {
        myFavoriteNumber = _myFavoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        // view (No transaction)
        return myFavoriteNumber;
    }

    // calldata, memory, storage
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(
            Person({name: _name, favoriteNumber: _favoriteNumber})
        );
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
