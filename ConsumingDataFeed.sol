//SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface AggregatorV3 {
    function latestRoundData() external view returns(uint roundId, uint answer,uint startedAt, uint updatedAt, uint answeredInRound);
}

contract ConsumingDataFeed {
    AggregatorV3 internal aggregator;

    constructor() {
        aggregator = AggregatorV3(0x031dB56e01f82f20803059331DC6bEe9b17F7fC9);  //rinkeby BAT/USD aggregator
    }

    function getPrice() public view returns(uint) {
        (,uint price,,,) = aggregator.latestRoundData();
        return price;
    }
}