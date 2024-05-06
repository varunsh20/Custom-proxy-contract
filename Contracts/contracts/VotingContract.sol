// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract VotingContract {

    mapping(uint256=>mapping(uint256=>uint256)) public campaignAndCandidatesMap;
    mapping(uint256=>mapping(address=>bool)) public campaignUserMap;

    function getVotes(uint256 _campaignId, uint256 _candidateId) public view returns (uint256) {
        return campaignAndCandidatesMap[_campaignId][_candidateId];
    }

    function vote(uint256 _campaignId, uint256 _candidateId, address _user) public {
        require(campaignUserMap[_campaignId][_user]==false,"Already voted");
        campaignAndCandidatesMap[_campaignId][_candidateId]+=1;
        campaignUserMap[_campaignId][_user] = true;
    }
}