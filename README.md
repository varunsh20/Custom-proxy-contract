**Task-2 Implementation**
- Implemented a Proxy Contract for Load Balancing and Function Delegation.
- This proxy contract accepts the function id of a specific function in contract and updates the implementaion address dynamically.
- We can write our implementaion contract logic in another contract and update it if needed without worrying about the loss of data as all the data will be stored in the storage of proxy contract.
- I have combined 3 different implementation contract i.e Voting Contract, Token Transfer and Staking contract.
- Proxy contract will delegate the call to appropriate functions of these contrats based on the function id identified.
- Users can update the funtion id as well if they deploy a new implementation contract.
