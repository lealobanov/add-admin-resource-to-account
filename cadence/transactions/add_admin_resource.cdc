import "NonFungibleToken"
import "ExampleNFT"

transaction {

    prepare(signer: auth(Storage, Capabilities) &Account) {

        // Return early if the account already has a collection
        if signer.storage.borrow<&ExampleNFT.Collection>(from: ExampleNFT.CollectionStoragePath) != nil {
            return
        }

        // Create a new empty collection
        let collection <- ExampleNFT.createEmptyCollection()

        // Save it to the account
        signer.storage.save(<-collection, to: ExampleNFT.CollectionStoragePath)

        // Issue a capability for the collection
        let cap = signer.capabilities.storage.issue<&ExampleNFT.Collection>(
            ExampleNFT.CollectionStoragePath
        )

        // Publish the capability for public use
        signer.capabilities.publish(cap, at: ExampleNFT.CollectionPublicPath)

        let acct = signer.storage.borrow<&{NonFungibleToken.Collection}>(from: /storage/myNFTCollection)
            ?? panic("Failed to borrow reference to the NFT collection")

        let count = acct.getIDs().length
        log("Number of NFTs in my collection: ".concat(count.toString()))

        let acct2 = signer.storage.borrow<&{NonFungibleToken.Collection}>(from: /storage/anotherNFTCollection)
            ?? panic("Failed to borrow reference to another NFT collection")

        let anotherCount = acct2.getIDs().length
        log("Number of NFTs in another collection: ".concat(anotherCount.toString()))
    }

    execute {
        log("Transaction complete.")
    }
}
