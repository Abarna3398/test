pragma solidity ^0.4.0;
contract erc20
{
    function trans(){}
    function tot_sup()public constant returns(uint256){}
    function transfer(address to_address,uint256 amnt)public {}
    function mint(uint256 amnt)public constant returns(uint256){}
    function approve(address _spender,uint256 _value) returns(bool success){}
    function allowance(address _owner,address _spender) constant returns(uint256 remaining){}
    function transferFrom(address _from,address _to,uint256 _value) returns(bool success) {}
    function view_balance() public constant returns(uint256){}
    
}
