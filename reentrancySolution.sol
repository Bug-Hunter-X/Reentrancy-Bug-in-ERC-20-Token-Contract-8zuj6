```solidity
function transfer(address _to, uint256 _value) public {
    require(balanceOf[msg.sender] >= _value, "Insufficient balance");
    balanceOf[msg.sender] -= _value;
    //Check effect
    emit Transfer(msg.sender, _to, _value);
    //Interaction
    balanceOf[_to] += _value;
}
```
The solution uses Checks-Effects-Interactions pattern to avoid reentrancy.