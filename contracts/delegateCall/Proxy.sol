pragma solidity ^0.8.0;

contract Proxy {

    // These variables cannot be changed in the updgraded versions
    address public logicContract; 
    address public owner;
    uint public counter;

    modifier onlyOwner(){
        require(owner==msg.sender, 'ONLY OWNER');
        _;
    }

    constructor(address _logicContract){
        logicContract = _logicContract;
        owner = msg.sender;
    }

    function updateContract(address _logicContract) public onlyOwner {
        logicContract = _logicContract;
    }

    function increment(uint256 number) external returns (bytes memory){
        (bool success, bytes memory data) = logicContract.delegatecall(
            abi.encodeWithSignature('increment(uint256)', number)
        );
        require(success == true);
        return data;
    
    }
}