pragma solidity ^0.6.12;

contract LibraryManagement{

    address private contractOwner;

    constructor() public{
        contractOwner = msg.sender;
    }

    modifier onlyOwner(){
        require(contractOwner==msg.sender);
        _;
    }

    struct Book{
        uint256 id;
        string name;
        string author;
        string rentedBy;
        string rentedDate;
    }

    mapping(uint256 => Book) public book;

    function addBook(uint256 _id, string memory _name, string memory _author) public onlyOwner{
        book[_id].name = _name;
        book[_id].author = _author;
    }

    function rentBook(uint256 _id, string memory _newRenter, string memory _currentDate) public{
        book[_id].rentedBy = _newRenter;
        book[_id].rentedDate = _currentDate;
    }

    function checkBookStatusById(uint256 _id) public view returns(string memory Name, string memory CurrentlyRentedBy, 
    string memory RentedDate){
        return(
            book[_id].name,
            book[_id].rentedBy,
            book[_id].rentedDate
        );
    }
}