// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; 

contract VolcanoCoin {
    uint total_supply = 10000;

    address owner;

    mapping(address => uint) balances;

    struct Payment {
        uint transfer_amount;
        address addr;
    }

    mapping(address => Payment) user_balance;

    constructor() {
        owner = msg.sender;
        balances[owner] = total_supply;
        console.log("setup owner")
    }

    modifier onlyOwner {
        if (msg.sender == owner){
            _;
        }
    }

    event NewSupplyTotal(uint)
    event newTransfer(address, uint indexed)

    function getTotalSupply public view (uint) {
        return total_supply;
    }

    function increaseSupply public onlyOwner{
        total_supply += 1000;
        emit NewSupplyTotal(total_supply)
    }

    function transfer(uint amount, address recipient) public {
        require(total_supply > amount, "not enough supply left");
        require(amount > 0, "have to pick a number greater than 0");
        
        if(balances[recipient] > 0){
            total_supply -= amount;
            balances[recipient] += amount
        } else {
            total_supply -= amount;
            balances[recipient] = amount;
        }
        Payment memory payment = Payment({
            transfer_amount = amount,
            addr = recipient
        })
        user_balance[senderAddy] = payment;
        emit newTransfer(recipient, amount)
    }
}