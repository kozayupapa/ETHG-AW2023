// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { ERC721 } from '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import { ERC721Burnable } from '@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol';
import { ERC721URIStorage } from '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import { ERC721Enumerable } from '@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol';
import { console } from "forge-std/console.sol";

abstract contract OthelloToken is ERC721,ERC721Burnable,ERC721URIStorage, ERC721Enumerable {

    event TokenCreated(uint256 indexed tokenId);

    event TokenBurned(uint256 indexed tokenId);

    function mint() external virtual returns (uint256) {
        uint256 newTokenId = totalSupply();
        console.log(newTokenId);
        _mint(msg.sender, newTokenId);
        _setTokenURI(newTokenId, "");
        return newTokenId;
    }
    function tokenURI(uint256 tokenId) public view override(ERC721,ERC721URIStorage) returns (string memory) {
        return ERC721URIStorage.tokenURI(tokenId);
    }
    function _burn(uint256 tokenId) internal override(ERC721,ERC721URIStorage) {
            ERC721URIStorage._burn(tokenId);
    }    
    function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal virtual override(ERC721,ERC721Enumerable) {
        console.log(from,to);
        ERC721Enumerable._beforeTokenTransfer(from,to,tokenId);
    }    
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721, ERC721Enumerable) returns (bool) {
        ERC721Enumerable.supportsInterface(interfaceId);
    }    


}
