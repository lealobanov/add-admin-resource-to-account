import "NonFungibleToken"
import "ExampleNFT"


transaction {

    prepare(signer: auth(Storage) &Account) {
        // Check if the Admin resource already exists
        if signer.storage.borrow<&ExampleNFT.Admin>(from: /storage/nftAdminResource) != nil {
            log("Admin resource already exists in the account.")
            return
        }

        // Create a new Admin resource
        let adminResource <- ExampleNFT.createAdmin()

        // Save the Admin resource to the account's storage
        signer.storage.save(<-adminResource, to: /storage/nftAdminResource)

        log("Admin resource added to the account.")
    }

    execute {
        log("Transaction complete.")
    }
}
