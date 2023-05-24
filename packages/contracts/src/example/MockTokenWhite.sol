// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { console } from "forge-std/console.sol";
import { Counters } from '@openzeppelin/contracts/utils/Counters.sol';
import { ERC721 } from '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import { OthelloToken } from './OthelloToken.sol';

contract MockTokenWhite is OthelloToken {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenId;    
    constructor() ERC721("MockTokenWhite", "MTW") {
        //mint(msg.sender, 0);        
    }
    function mint(string memory tokenUri) external override returns (uint256) {
        uint256 newTokenId = _tokenId.current();
        console.log(newTokenId);
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, tokenUri);

        _tokenId.increment();

        return newTokenId;
    }    
}
