pragma solidity ^0.6.12;

contract propertyTransferApp{
    address public contractOwner;

    constructor() public{
        contractOwner=msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender==contractOwner);
        _;
    }

    struct Property{
        uint256 id;
        string name;
        string owner;
        uint256 value;
        uint256 area;
    }

    mapping(uint256 => Property) public property;

    function checkOwner() public view returns(address ContractOwner){
        return contractOwner;
    }

    function addProperty(uint256 _propertyId, string memory _name, string memory _owner, uint256 _value, uint256 _area) public{
        property[_propertyId].name = _name;
        property[_propertyId].owner = _owner;
        property[_propertyId].value = _value;
        property[_propertyId].area = _area;
    }

    function queryPropertyById(uint256 _propertyId) public view returns(string memory Name, string memory Owner, uint256 Value, uint256 Area){
        return(
            property[_propertyId].name,
            property[_propertyId].owner,
            property[_propertyId].value,
            property[_propertyId].area
        );
    }

    function tranferPropertyOwnership(uint256 _propertyId, string memory _newOwner) public{
        property[_propertyId].owner = _newOwner;
    }


}