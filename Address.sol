pragma solidity ^0.6.12;

contract sampleMoney{

    //address of owner where currency is getting transfer
    address owner = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

    //transfer money to contract address
    function getMoney() public payable{}

    function checkContractBalance() public view returns (uint){
        return address(this).balance;
    }

    //transfer currency to owner's address
    function transferToAddress() public{
        payable(owner).transfer(address(this).balance);
    }

    //transfer input amount from contract to owner's address
    function transferToAddress(uint _amount) public{
        payable(owner).transfer(_amount);
    }

    function checkAddressBalance() public view returns(uint){
        return owner.balance;
    }
}