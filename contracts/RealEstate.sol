//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract RealEstate is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address private _owner;

    constructor() ERC721("Real Estate", "REAL") {}

    function mint(string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }
}















// contract RealEstate is ERC721URIStorage {
//     using Counters for Counters.Counter;
//     Counters.Counter private _tokenIds;
//     address private _owner;

//     constructor() ERC721("RealEstate", "RE") {
//         _owner = msg.sender;
//     }

//     function mint(address recipient, string memory tokenURI) public {
//         require(msg.sender == _owner, "Only owner can mint");
//         _tokenIds.increment();
//         uint256 newTokenId = _tokenIds.current();
//         _mint(recipient, newTokenId);
//         _setTokenURI(newTokenId, tokenURI);
//     }
// }