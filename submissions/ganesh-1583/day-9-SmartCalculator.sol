// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Calculator.sol";

contract SmartCalculator {
    address public calculatorAddress;

    constructor(address _calculatorAddress) {
        calculatorAddress = _calculatorAddress;
    }

    function addUsingCalculator(uint a, uint b) external view returns (uint) {
        Calculator calc = Calculator(calculatorAddress); // address casting
        return calc.add(a, b);
    }

    function subtractUsingCalculator(uint a, uint b) external view returns (uint) {
        Calculator calc = Calculator(calculatorAddress);
        return calc.subtract(a, b);
    }

    function multiplyUsingCalculator(uint a, uint b) external view returns (uint) {
        Calculator calc = Calculator(calculatorAddress);
        return calc.multiply(a, b);
    }

    function divideUsingCalculator(uint a, uint b) external view returns (uint) {
        Calculator calc = Calculator(calculatorAddress);
        return calc.divide(a, b);
    }
}

