//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "./ERC404.sol";

contract DUST is Ownable, ERC404 {
    string public baseURI = "";
    uint256 public constant MAX_SUPPLY = 1000;
    uint8 public constant DECIMALS = 18;
    constructor(
        string memory name_,
        string memory symbol_
    ) ERC404(name_, symbol_, DECIMALS) Ownable(msg.sender) {}

    function mintERC20(address account, uint256 amount) external onlyOwner {
        require(
            erc20TotalSupply() + amount <= MAX_SUPPLY * (10 ** DECIMALS),
            "DUST: MAX_SUPPLY_EXCEEDED"
        );
        _mintERC20(account, amount);
    }

    function setBaseURI(string memory baseURI_) external onlyOwner {
        baseURI = baseURI_;
    }

    function tokenURI(
        uint256 id_
    ) public view override returns (string memory) {
        return string.concat(baseURI, Strings.toString(id_), ".json");
    }

    function setERC721TransferExempt(
        address account_,
        bool value_
    ) external onlyOwner {
        _setERC721TransferExempt(account_, value_);
    }
}
