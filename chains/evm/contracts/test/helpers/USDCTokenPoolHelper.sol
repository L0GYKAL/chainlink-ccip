// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import {ITokenMessenger} from "../../pools/USDC/interfaces/ITokenMessenger.sol";
import {IBurnMintERC20} from "@chainlink/contracts/src/v0.8/shared/token/ERC20/IBurnMintERC20.sol";

import {CCTPMessageTransmitterProxy} from "../../pools/USDC/CCTPMessageTransmitterProxy.sol";
import {USDCTokenPool} from "../../pools/USDC/USDCTokenPool.sol";

contract USDCTokenPoolHelper is USDCTokenPool {
  constructor(
    ITokenMessenger tokenMessenger,
    CCTPMessageTransmitterProxy messageTransmitterProxy,
    IBurnMintERC20 token,
    address[] memory allowlist,
    address rmnProxy,
    address router,
    address previousPool
  ) USDCTokenPool(tokenMessenger, messageTransmitterProxy, token, allowlist, rmnProxy, router, previousPool) {}

  function validateMessage(bytes memory usdcMessage, SourceTokenDataPayload memory sourceTokenData) external view {
    return _validateMessage(usdcMessage, sourceTokenData);
  }
}
