contract parent {
    string name;
    function setname(string memory _name) public {
        name=_name;
    }
}
contract child is parent {
	function getName() public view returns(string memory){
	return name;
	}
}