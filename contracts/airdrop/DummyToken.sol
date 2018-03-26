pragma solidity 0.4.19;

import "./Ownable.sol";
import "./SafeMath.sol";

/// @author Kongliang Zhong - <kongliang@loopring.org>
contract DummyToken is Ownable {
    using SafeMath for uint;

    string public name;
    string public symbol;
    uint8  public decimals;
    uint   public totalSupply;

    mapping(address => uint) public balances;

    function DummyToken(
        string _name,
        string _symbol,
        uint8  _decimals,
        uint   _totalSupply
        )
        public
    {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _totalSupply;
        balances[msg.sender] = _totalSupply;
    }

    function transfer(address _to, uint _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= balances[msg.sender]);
        // SafeMath.sub will throw if there is not enough balance.
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        return true;
    }

    function balanceOf(address _owner) public view returns (uint) {
        return balances[_owner];
    }

    function setBalance(
        address _target,
        uint _value
        )
        onlyOwner
        public
    {
        uint currBalance = balanceOf(_target);
        if (_value < currBalance) {
            totalSupply = totalSupply.sub(currBalance.sub(_value));
        } else {
            totalSupply = totalSupply.add(_value.sub(currBalance));
        }
        balances[_target] = _value;
    }

}
