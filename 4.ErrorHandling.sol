pragma solidity ^0.6.12;

contract errorHandlingSample{
    uint balance = 1000;

    function deductBalanceRequire(uint _amount) public returns(uint){
        require(_amount>100,"Invalid Amount Requires");
        balance -= _amount;
        return balance;
    }

    function deductBalanceAssert(uint _amount) public returns(uint){
        assert(_amount>100);
        balance -= _amount;
        return balance;
    }

    function deductBalanceRevert(uint _amount) public returns(uint){
        balance -= _amount;
        if(_amount>100){
            revert("Invalid Amount Revert");
        }
        return balance;
    }

    function showBalance() public view returns(uint){
        return balance;
    }
}