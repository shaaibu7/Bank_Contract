// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => bool) validAccount;

    struct Account {
        address accountNumber;
        uint256 balance;
        mapping(address => uint256) accountBalance;
    }

    Account[] public userAccounts;

    modifier onlyOwner() {
        for(uint i = 0; i < userAccounts.length; i++) {
            if(msg.sender != userAccounts[i].accountNumber) {
                require(false);
            }
        }
        _;
    }

    function createAccount() public {
        if(validAccount[msg.sender]) {
            require((false));
        }
        validAccount[msg.sender] = true;
        Account storage newAccount = userAccounts.push();
        newAccount.accountNumber = msg.sender;
        validAccount[msg.sender] = true;
    }

    function accountBalance() public view  onlyOwner returns(uint balance) {
        for(uint i = 0; i < userAccounts.length; i++) {
            if(userAccounts[i].accountNumber == msg.sender) {
                balance = userAccounts[i].balance;
                return balance;
            }
        }
    }



    function deposit(address accountToDeposit) public payable  {
            for(uint i = 0; i < userAccounts.length; i++) {
                if(accountToDeposit == userAccounts[i].accountNumber) {
                    userAccounts[i].balance += msg.value;
                }
            }
    }

    function withdraw() public payable onlyOwner {
        for(uint256 i = 0; i < userAccounts.length; i++) {
            if(msg.sender == userAccounts[i].accountNumber) {
                (bool success,) = (msg.sender).call{ value: msg.value }("");
                require(success);
                userAccounts[i].balance -= msg.value;
            }
        }
    }

    function transfer(address sendAddress) public payable onlyOwner {
        for(uint256 i = 0; i < userAccounts.length; i++) {
            if(msg.sender == userAccounts[i].accountNumber) {
                (bool success,) = sendAddress.call{ value: msg.value }("");
                require(success);
                userAccounts[i].balance -= msg.value;
            }
        }
    }

    

}
