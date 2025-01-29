# Reentrancy Vulnerability in ERC-20 Token

This repository demonstrates a common reentrancy vulnerability in a Solidity smart contract implementing a simple ERC-20 token.  The vulnerable code allows a malicious actor to recursively call the transfer function, potentially draining funds from the sender.

## Vulnerable Code (`reentrancyBug.sol`)
The vulnerable code is found in the `transfer` function, which lacks proper checks to prevent reentrancy attacks.

## Solution (`reentrancySolution.sol`)
The solution involves using the Checks-Effects-Interactions pattern to prevent the reentrancy vulnerability.  The state is updated only after all external calls are completed.

## How to Reproduce
1. Compile and deploy both contracts to a local blockchain or testnet.
2. Send some tokens to a malicious contract (which will need to be implemented to exploit the vulnerability).
3. Trigger a transaction that calls the `transfer` function from the vulnerable contract to the malicious contract.
4. Observe the unintended token transfers.

## Lessons Learned
Always use the Checks-Effects-Interactions pattern to prevent reentrancy vulnerabilities in your smart contracts.