#pragma solidity ^0.4.0;

import "./Interface.sol";

contract ERC20 is ERC20Interface, Double {

    function ERC20(
        string name,
        string symbol,
        uint256 totalSupply,
        uint8 decimals
    ) 
        public
    {
        require(totalSupply <= MAX_VALUE, "totalSupply too big!");
        creator = msg.sender;
        c_name = name;
        c_symbol = symbol;
        c_totalSupply = totalSupply;
        balances[creator] = totalSupply;
        dscale = decimals;
    }

    function name() public view returns (string name) {
        name = c_name;
    }
    
    function symbol() public view returns (string symbol) {
        symbol = c_symbol;
    }
    
    function totalSupply() public view returns (uint256 totalSupply) {
        totalSupply = c_totalSupply;
    }
    
    function decimals() public view returns (uint8 decimals) {
        decimals = dscale;
    }
    
    function balanceOf(address owner) public view returns (uint256 balance) {
        balance = balances[owner];
    }
}
