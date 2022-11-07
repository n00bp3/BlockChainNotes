pragma solidity ^0.6.12;

contract sampleStruct{

    address myAccount;

    constructor() public{
        myAccount = msg.sender;
    }

    //to restrict access for other than mentioned account
    modifier onlyMyAccount{
        require(myAccount==msg.sender);
        _;
    }

    struct learner{
        string name;
        uint8 age;
    }

    mapping (uint => learner) learners;

    event newLearner(string name, uint8 age);

    function setLearnerDetails(uint8 _key, string memory _name, uint8 _age) public onlyMyAccount{
        learners[_key].name = _name;
        learners[_key].age = _age;
        emit newLearner(_name,_age);
    }

    function getLearnerDetails(uint _key) public view returns(string memory, uint8){
        return(learners[_key].name, learners[_key].age);
    }
}