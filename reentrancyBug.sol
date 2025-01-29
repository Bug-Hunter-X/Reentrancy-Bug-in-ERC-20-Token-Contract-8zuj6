```solidity
function transfer(address _to, uint256 _value) public {
    require(balanceOf[msg.sender] >= _value, "Insufficient balance");
    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;
    emit Transfer(msg.sender, _to, _value);
}
```

This code has a classic reentrancy vulnerability.  If the recipient of the transfer is a malicious contract, it can call back into the `transfer` function before the state changes are fully committed, leading to multiple transfers from the sender.