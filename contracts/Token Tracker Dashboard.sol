// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract TokenTrackerDashboard {
    address public owner;

    struct TokenInfo {
        string name;
        string symbol;
        uint256 totalSupply;
    }

    mapping(address => TokenInfo) private tokens;
    address[] public tokenList;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not contract owner");
        _;
    }

    function addToken(address token, string memory name, string memory symbol, uint256 supply) public onlyOwner {
        require(bytes(tokens[token].name).length == 0, "Token already exists");
        tokens[token] = TokenInfo(name, symbol, supply);
        tokenList.push(token);
    }

    function getToken(address token) public view returns (string memory, string memory, uint256) {
        TokenInfo memory info = tokens[token];
        return (info.name, info.symbol, info.totalSupply);
    }

    function updateSupply(address token, uint256 newSupply) public onlyOwner {
        require(bytes(tokens[token].name).length != 0, "Token not found");
        tokens[token].totalSupply = newSupply;
    }

    function getAllTokens() public view returns (address[] memory) {
        return tokenList;
    }
}

