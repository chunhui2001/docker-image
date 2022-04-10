pragma solidity >=0.4.25 <0.7.0;

// SPDX-License-Identifier: UNLICENSED

import "./ERC20Factory.sol";

contract USDT is ERC20, Ownable {

    constructor () public ERC20 ("USDT Token", "USDT", 18) {
        _mint(msg.sender, 21 * ((10000 * 10000) * (10 ** 18)));
    }
    
    function mint(address account, uint256 value) public onlyOwner {
        _mint(account, value);
    }
    
    function burn(address account, uint256 value) public onlyOwner {
        _burn(account, value);
    }
}

contract USDC is ERC20, Ownable {

    constructor () public ERC20 ("USDC Token", "USDC", 18) {
        _mint(msg.sender, 21 * ((10000 * 10000) * (10 ** 18)));
    }

    function mint(address account, uint256 value) public onlyOwner {
        _mint(account, value);
    }

    function burn(address account, uint256 value) public onlyOwner {
        _burn(account, value);
    }
}

contract DAI is ERC20, Ownable {

    constructor () public ERC20 ("DAI Token", "DAI", 18) {
        _mint(msg.sender, 21 * ((10000 * 10000) * (10 ** 18)));
    }

    function mint(address account, uint256 value) public onlyOwner {
        _mint(account, value);
    }
    
    function burn(address account, uint256 value) public onlyOwner {
        _burn(account, value);
    }
}

contract INCH1 is ERC20, Ownable {

    constructor () public ERC20 ("1INCH Token", "1INCH", 18) {
        _mint(msg.sender, 21 * ((10000 * 10000) * (10 ** 18)));
    }

    function mint(address account, uint256 value) public onlyOwner {
        _mint(account, value);
    }
    
    function burn(address account, uint256 value) public onlyOwner {
        _burn(account, value);
    }
}
