 // SPDX-License-Identifier: MIT
 
 pragma solidity ^0.8.7;

contract AdditionalTask {

    
        uint a = 3;
        uint b = 2;
    
    function divVariables() external view returns (uint){
         uint c = (a * 10^1) / b ;
         return  c;
    }
}