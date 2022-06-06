// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Book is ERC721{

    constructor() ERC721("Book", "BK")
    {}

    function mint() public {
        //tokenID
        //mint
        //set token id
        //increment tokenid 
    }

    function transferFrom(address from, address to, uint tokenId) public override{

        super.transferFrom(from, to, tokenId);
        // add transfer to author

    }

    function burn() external{

    }



}