// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { ERC721, ERC721URIStorage } from '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import { Counters } from '@openzeppelin/contracts/utils/Counters.sol';

contract MockTokenWhite is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenId;    
    constructor() ERC721("MockTokenWhite", "MTW") {
        //mint(msg.sender, 0);        
    }
    function mint(string memory tokenUri) external returns (uint256) {
        uint256 newTokenId = _tokenId.current();
        console.log(newTokenId);
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenUri);

        _tokenId.increment();

        return newTokenId;
    }    
}
