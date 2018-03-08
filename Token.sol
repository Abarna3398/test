pragma solidity ^0.4.0;
import './erc20token.sol';
contract trans is erc20
{
    address owner;
    uint256 total_supply;
    string public name="mnw";
    string public symbol="#";
    uint256 public decimal=12;
    mapping(address => uint256)balance;
    mapping( address => mapping(address => uint256))alowed;
    
    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    function trans()
    {
         total_supply=10000;
         owner=msg.sender;
         balance[msg.sender] = total_supply;
    }
    modifier onlyOwner()
        {
            require(owner==msg.sender);
            _;
        }
    function tot_sup()public constant returns(uint256)
    {
        return(total_supply);
    }
    function transfer(address to_address,uint256 amnt)public onlyOwner() 
    {
        require(amnt<total_supply);
        balance[owner] -= amnt;
        balance[to_address] += amnt;
        //return(balance[msg.sender]);
    }
    function mint(uint256 amnt)public onlyOwner() constant returns(uint256)
    {
        require(amnt+balance[owner]<total_supply);
        balance[owner] += amnt;
        return(balance[msg.sender]);
    }
    function approve(address _spender,uint256 _value) returns(bool success){
         alowed[msg.sender][_spender] = _value;
         Approval(msg.sender,_spender,_value);
         return true;
     }
      function allowance(address _owner,address _spender) constant returns(uint256 remaining){
         return alowed[_owner][_spender];
     }
     function transferFrom(address _from,address _to,uint256 _value) returns(bool success) {
         require(balance[_from] >= _value && _value > 0 && alowed[_from][_to] >= _value);
             
             balance[_from] -= _value;
             balance[_to] += _value;
             alowed[_from][_to] -= _value;
             Transfer(_from,_to,_value);
             return true;
     }
     function view_balance() public constant returns(uint256)
     {
         return(balance[owner]);
     }
}
