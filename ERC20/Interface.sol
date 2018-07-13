#pragma solidity ^0.4.0;

/**
* ERC20 Interface https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
*/

contract ERC20Interface {
    public string c_name;
    public string c_symbol;
    public uint256 c_totalSupply;
    public address creator;
    mapping(address => uint) public balances;
    public constant uint256 MAX_VALUE = 256**2 - 1;
    
    /**
    * Standard ERC20 functions
    */
    function name() view returns (string name);
    
    function symbol() view returns (string symbol);
    
    function decimals() view returns (uint8 decimals);
    
    function totalSupply() view returns (uint256 totalSupply);
    
    function balanceOf(address owner) view returns (uint256 balance);
    
    function transfer(address _to, uint256 _value) returns (bool success);
    
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success);
    
    function approve(address _spender, uint256 _value) returns (bool success);
    
    function allowance(address owner, address _spender) view returns (uint256 remaining);
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    
    event Approval(address indexed owner, address indexed _spender, uint256 _value);
    
    /**
    * Non-standard functions
    */
    function decimal_balanceOf(address owner) view returns (uint256 integral, uint256 fractional);
    
    function setName(string name) public onlyowner;
    
    function setSymbol(string symbol) public onlyowner;
    
    function supply(uint256 amount) public onlyowner;
    
    modifier onlyowner();
}
