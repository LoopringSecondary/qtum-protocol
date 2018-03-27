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
pragma solidity 0.4.19;

import './Claimable.sol';
import './SafeMath.sol';
import './TransferableToken.sol';

/// @title Lrx Airdrop Contract
/// @author Kongliang Zhong - <kongliang@loopring.org>
contract LrxAirdrop is Claimable {
    using SafeMath for uint;

    mapping(address => uint) public lrxAmountMap;
    mapping(address => uint) public lastWithdrawSecondMap;

    uint public startSecond;
    uint public releaseDays;
    address public tokenAddress;

    uint private constant SECONDS_IN_DAY = 60 * 60 * 24;

    function LrxAirdrop() public {
        startSecond = now;
        releaseDays = 365 * 3; // 3 years.
        tokenAddress = 0x0; // change this to real token address when deploy to main-net.
    }

    /// tokenAddress can only be set once by owner.
    function setTokenAddress(address _tokenAddress)
        external
        onlyOwner
    {
        require(tokenAddress == 0x0);
        tokenAddress = _tokenAddress;
    }

    function setLrxAmount(address recipient, uint amount)
        external
        onlyOwner
    {
        require(recipient != 0x0 && amount > 0);
        lrxAmountMap[recipient] = amount;
    }

    function withdrawl() external {
        uint lastWithdrawSecond = lastWithdrawSecondMap[msg.sender];
        if (lastWithdrawSecond < startSecond) {
            lastWithdrawSecond = startSecond;
        }

        uint _days = (now.sub(lastWithdrawSecond)).div(SECONDS_IN_DAY);
        uint allowedAmount = lrxAmountMap[msg.sender].mul(_days).div(releaseDays);

        require(allowedAmount > 0);

        lastWithdrawSecondMap[msg.sender] = now;
        require(TransferableToken(tokenAddress).transfer(msg.sender, allowedAmount));
    }

}
