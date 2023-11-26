// SPDX-License-Identifier: MIT
//0x0000000000000000000000000000000000000000

pragma solidity ^0.8.13;

contract error{

    //s_owner of the contract 

    address public s_owner;

    //mapping to keep a track of the storageAmount

    mapping (address => uint) public storageAmount;

    constructor (){

        //setting the deployer as the s_owner of the contract.

        s_owner = msg.sender;

    }

    function contribute() 
    public 
    payable{

        storageAmount[msg.sender] += msg.value;
        if(msg.value <= 2000 wei){

            revert("Insufficient storage balance");
        }

         

    }

    function addNewMember(
        address _add) 
        public 
        payable{

        storageAmount[_add] += msg.value;

        assert (_add != address(0));

        
    }

    function changePrevOwner(
        address _new) 
        public{

        require(msg.sender == s_owner, "You are not the owner");
        s_owner = _new;

    }


}
