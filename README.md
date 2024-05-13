
- Implemented a Proxy Contract for Load Balancing and Function Delegation.
- This proxy contract accepts the function id of a specific function in contract and updates the implementaion address dynamically.
- We can write our implementaion contract logic in another contract and update it if needed without worrying about the loss of data as all the data will be stored in the storage of proxy contract.
- I have combined 3 different implementation contract i.e Voting Contract, Token Transfer and Staking contract.
- Proxy contract will delegate the call to appropriate functions of these contrats based on the function id identified.
- Users can update the funtion id as well if they deploy a new implementation contract.

### Contract Addresses
 - Proxy Contract - 0xD38B80BD2F3BEB19459cBcA16e79892684C42C37
 - Voting Contract - 0xeC0cDB347ECB492bDccaa7e023337864D83a5ff5
 - Transfer Token - 0x5FBD05Ec4eB8CB7511E204449a4FB6d88a92ab64
 - Staking Contract - 0xb18F71e36b0Fca6c183989961E6DB37042238493
