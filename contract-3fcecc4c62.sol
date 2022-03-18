// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

pragma solidity ^0.8.4;
contract RichCoin is ERC20, Ownable {
    constructor() ERC20("RichCoin", "RCN") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver) external payable returns (uint256) {
        require(msg.value > 0, "You cannot mint RCN with zero ETH");

        uint256 amount = msg.value * 1000/ 10 ** 18;
        _mint(receiver, amount);
    }
}
