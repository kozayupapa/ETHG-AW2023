// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC721 } from '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import { OthelloToken } from './OthelloToken.sol';

contract MockTokenBlack is OthelloToken  {
    constructor() ERC721("MockTokenBlack", "MTB") {
        //mint(msg.sender, 0);        
    }
}
