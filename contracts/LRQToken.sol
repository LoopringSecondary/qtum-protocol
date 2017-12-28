/*

  Copyright 2017 Loopring Project Ltd (Loopring Foundation).

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

*/
pragma solidity 0.4.18;

import './StandardToken.sol';

/// @title Loopring Protocol Token on Qtum.
/// @author Kongliang Zhong - <kongliang@loopring.org>
contract LRQToken is StandardToken {
    string public name = "Loopring Qtum Token";
    string public symbol = "LRQ";
    uint8  public decimals = 18;

    address public initialHolder;

    /// totalSupply of LRC token on Ethereum.
    /// See https://etherscan.io/address/0xEF68e7C694F40c8202821eDF525dE3782458639f#readContract
    uint private constant LRC_TOTAL_SUPPLY = 1395076054523857892274603100;

    function LRQToken(address _initialHolder) public {
        require(0x0 != _initialHolder);

        totalSupply = LRC_TOTAL_SUPPLY;
        initialHolder = _initialHolder;

        balances[initialHolder] = totalSupply;
    }

    /// @dev Disable default function.
    function () payable public {
        revert();
    }
}
