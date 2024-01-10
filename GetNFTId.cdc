import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Primary function to retrieve NFT IDs from a user's public collection
pub fun main(acctAddress: Address): [UInt64] {
    
    // Obtain a reference to the user's publicly accessible NFT collection
    let collectionRef = getAccount(acctAddress)
        .getCapability(/public/CryptoPoopsCollection)
        .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
        ?? panic("No associated collection found for the address.")

    // Fetch NFT IDs from the public collection by invoking the getIDs function
    return collectionRef.getIDs()
}
