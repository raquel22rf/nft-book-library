// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";

contract Book is ERC721, ERC721URIStorage{

    using Counters for Counters.Counter;
    Counters.Counter private bookIdCounter;

    address private author;

    constructor() ERC721("Book", "BK"){
        bookIdCounter.increment();
    }

    function mint(address _author, address to, string memory uri) public payable {
        uint bookId = bookIdCounter.current();
        _setTokenURI(bookId, uri);
        bookIdCounter.increment();
        super._mint(to, bookId);
        author = _author;
    }

    function _burn(uint256 bookId)
        internal
        override(ERC721, ERC721URIStorage)
    {
        super._burn(bookId);
    }

    function tokenURI(uint256 bookId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(bookId);
    }

    function _isApprovedOrOwner(address spender, uint256 tokenId) internal view override(ERC721) returns (bool) {
        return (msg.sender == author);
    }
}