pragma solidity ^0.8.0;

contract LogicContractV2 {

    address public contractA; 
    address public owner;
    uint public counter;
    event NewCounter(uint counter); // <== Added new event

    modifier onlyOwner(){
        require(owner==msg.sender, 'ONLY OWNER');
        _;
    }

    constructor(){}

    function updateContract(address _contractA) public onlyOwner {
        contractA = _contractA;
    }

    function increment(uint256 number) external {
        counter = counter + number;
        emit NewCounter(counter); // <== Emiting the new event
    }

}