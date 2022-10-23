// define verison
pragma solidity ^0.8.0; 

// define contract
contract Score {
    //variable
    uint score = 5;
    mapping(address => uint) score_list;
    uint my_score = score_list[owner];

    struct Funder {
        address addr;
        uint amount;
    }

    Funder giver = ({
        addr: address(0xBA7283457B0A138890F21DE2ebCF1AfB9186A2EF),
        amount: 2500
    });

    address owner;

    // constructor - only runs when contract deployed
    constructor() {
        owner = msg.sender;
    }

    // modifier - change the behavior
    modifier onlyOwner {
        if (msg.sender == owner){
            _;
        }
    }

    // event - show changes to contract
    event Score_set(uint indexed);

    // getter function - read a variable
    function getScore() public view returns (uint) {
        return score;
    }

    // setter function - take action
    function setScore(uint new_score) public onlyOwner {
        score = new_score;
        emit Score_set(new_score);
    }

    function getUserScore(address user) public view returns (uint) {
        return score_list[user];
    }
}