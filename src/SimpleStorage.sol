// SPDX-License-Identifier: MIT
// contract address 0x94953a47a9385e4549ca575c541937b38f4dd7a4
pragma solidity ^0.8.17;

contract SimpleStorage {
    uint256 myFavoriteNumber; // Default internal favorite number

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    mapping(string => uint256) mapNameToNumber; // Mapping to store number by name
    mapping(uint256 => string[]) mapNumberToName; // Mapping to store names by number

    Person[] PersonArray; // Array to store Person structs

    /**
     * @dev Stores the favorite number.
     * @param _favoriteNumber The favorite number to be stored.
     */
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    /**
     * @dev Adds a new person with the given name and favorite number.
     * @param _name The name of the person.
     * @param _peopleNumber The favorite number of the person.
     */
    function addPerson(string memory _name, uint256 _peopleNumber) public {
        PersonArray.push(Person(_name, _peopleNumber));

        // Add to mappings
        mapNameToNumber[_name] = _peopleNumber;
        mapNumberToName[_peopleNumber].push(_name);
    }

    /**
     * @dev Retrieves the stored favorite number.
     * @return The stored favorite number.
     */
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }

    /**
     * @dev Retrieves the person at the given index in the PersonArray.
     * @param _index The index of the person to retrieve.
     * @return The person at the given index.
     */
    function getPersonAtIndex(uint256 _index) public view returns (Person memory) {
        require(_index < PersonArray.length, "Invalid index");
        return PersonArray[_index];
    }

    /**
     * @dev Retrieves the number associated with the given name.
     * @param _name The name to retrieve the number for.
     * @return The number associated with the given name.
     */
    function getNumberFromName(string memory _name) public view returns (uint256) {
        return mapNameToNumber[_name];
    }

    /**
     * @dev Retrieves all names associated with the given number.
     * @param _number The number to retrieve the names for.
     * @return An array of names associated with the given number.
     */
    function getNameFromNumber(uint256 _number) public view returns (string[] memory) {
        return mapNumberToName[_number];
    }
}
