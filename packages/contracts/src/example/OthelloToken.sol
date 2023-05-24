// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC721 } from '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import { ERC721Burnable } from '@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol';
import { ERC721URIStorage } from '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';

abstract contract OthelloToken is ERC721,ERC721Burnable,ERC721URIStorage {
    event TokenCreated(uint256 indexed tokenId);

    event TokenBurned(uint256 indexed tokenId);

    function mint(string memory tokenUri) external virtual returns (uint256);

    function tokenURI(uint256 tokenId) public view override(ERC721,ERC721URIStorage) returns (string memory) {
        return ERC721URIStorage.tokenURI(tokenId);
    }
    function _burn(uint256 tokenId) internal override(ERC721,ERC721URIStorage) {
            ERC721URIStorage._burn(tokenId);
        }    

}
