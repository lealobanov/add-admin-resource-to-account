import "NonFungibleToken"

transaction {

    prepare(signer: auth(Storage) &Account) {
        let acct = signer.storage.borrow<&{NonFungibleToken.Collection}>(from: /storage/myNFTCollection)
            ?? panic("Failed to borrow reference to the NFT collection")

        let count = acct.getIDs().length
        log("Number of NFTs in my collection: " + count)

        let acct2 = signer.storage.borrow<&{NonFungibleToken.Collection}>(from: /storage/anotherNFTCollection)
            ?? panic("Failed to borrow reference to another NFT collection")

        let anotherCount = acct2.getIDs().length
        log("Number of NFTs in another collection: " + anotherCount)
    }

    execute {
        log("Transaction complete.")
    }
}
