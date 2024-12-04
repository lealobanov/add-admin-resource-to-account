import SetAndSeries from 0x01

transaction {

    prepare(signer: auth(Storage) &Account) { 
        let acct = signer.storage.borrow<&SetAndSeries>(from: /storage/myCollection)
            ?? panic("Failed to borrow reference to collection")

        let result1 = acct.performOperation()
        log(result1)

        let acct2 = signer.storage.borrow<&SetAndSeries>(from: /storage/anotherCollection)
            ?? panic("Failed to borrow reference to another collection")
        let result2 = acct2.performAnotherOperation()
        log(result2)
    }

    execute {
        log("New Admin Resource Created")
    }
}
