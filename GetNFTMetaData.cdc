// Import the NonFungibleToken and CryptoPoops contracts from 0x05
import NonFungibleToken from 0x05
import CryptoPoops from 0x05

// Main script function to retrieve the metadata of a specific NFT from an account's public collection
pub fun main(acctAddress: Address, id: UInt64): &NonFungibleToken.NFT {
    
    // Borrow a reference to the public CryptoPoops collection using the provided account address
    let contract = getAccount(acctAddress)
        .getCapability(/public/CryptoPoopsCollection)
        .borrow<&CryptoPoops.Collection>() ?? panic("Could not borrow collection reference")
    
    // Borrow a reference to the NFT metadata using the borrowAuthNFT function
    let nftData = contract.borrowAuthNFT(id: id)
    
    // Return the borrowed NFT reference
    return nftData
}
