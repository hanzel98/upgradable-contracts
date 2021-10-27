pragma solidity ^0.8.0;

contract LogicContractV1 {

    address public contractA; 
    address public owner;
    uint public counter;

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
    }

}