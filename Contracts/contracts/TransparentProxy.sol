// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
/* 
    *Proxy contract that will delegate the calls to the respective implementaion contracts based on the functionId.
*/

contract TransparentProxy {

    //owner of proxy contract, can update implementation contracts address.
    //address public admin;

    //maintains the mapping of a campaign id and its candidate's vote count
    mapping(uint256=>mapping(uint256=>uint256)) public campaignAndCandidatesMap;

    //maintains the record of user's voted for a campaign
    mapping(uint256=>mapping(address=>bool)) public campaignUserMap;
    address public implementation;

    //mapping to maintain balance of addresses
    mapping(address => uint256) public balances;

    //mapping to maintain stakes of addresses
    mapping(address => uint256) public stakes;
 
    /* 
        * FunctionId is the first 4 bytes of the Keccack 256 hash of the function signature.
    */

    //mapping to link function ids with their contract's address. 
    mapping(bytes4 => address) public idToContractAddressMap;

    //event emitted when a function id is registered of an implementation contract
    event ImplementationUpdated(
        bytes4 indexed functionId, 
        address indexed implementationContract
    );

    /*
        * Function that adds or updates function ids with their contract's address mapping. Use to add a new 
        * contract implementaion to the proxy or update an existing implementation. 
        * Only admin operation.
    */
    function updateImplementationContract(bytes4 functionId, address newImplementation) external {
        idToContractAddressMap[functionId] = newImplementation;
        emit ImplementationUpdated(functionId, newImplementation);
    }

    /*
        * Returns the number of votes for a candidate of a campaign.
    */
    function getVotes(uint256 _campaignId, uint256 _candidateId) public view returns (uint256) {
        return campaignAndCandidatesMap[_campaignId][_candidateId];
    }

    function winner(uint256 _campaignId) public view returns (uint256) {
        uint256 maxVotes = 0;
        uint256 winnerId;

        for (uint256 i = 0; i < 3; i++) {
            if (campaignAndCandidatesMap[_campaignId][i] > maxVotes) {
                maxVotes = campaignAndCandidatesMap[_campaignId][i];
                winnerId = i;
            }
        }
        return winnerId;
    }

    /*
        * Returns the balance of an address.
    */
    function viewBalance(address _account) external view returns(uint256){
        return balances[_account];
    }

    /*
        * Returns the stake amount of an address.
    */
    function viewStake(address _account) external view returns(uint256){
        return stakes[_account];
    }

    fallback() external {
        //fetches the address of the implementation contract through the function id.
        address _impl = idToContractAddressMap[msg.sig];
        require(_impl != address(0), "Invalid implementation contract.");
        implementation = _impl;

        assembly {
            let ptr := mload(0x40) // allocating free memory from 0x40 location.

            //calldatasize() --> returns the size of the calldata
            calldatacopy(ptr, 0, calldatasize()) // copies the entire calldata from function call to memory at location ptr.

            // delegatecall --> maintains the context of the calling contract and performs a call to the impl contract.
            // gas(), provided by the current transaction
            let result := delegatecall(gas(),sload(implementation.slot),ptr,calldatasize(),0,0)
            let size := returndatasize() // calculates size of returned data in bytes.
            returndatacopy(ptr, 0, size) // copies the entire returned data from return data area to the memory at position ptr.

            switch result
            case 0 { revert(ptr, size)} // if size of returned data is 0, it reverts the tx.
            default {return(ptr, size)} // else returns the data to the caller.
        }
    }
}