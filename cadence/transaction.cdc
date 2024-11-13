import SetAndSeries from 0x01

transaction {

    let adminCheck: &SetAndSeries.Admin

    prepare(acct: auth(Storage) &Account, acct2: auth(Storage) &Account) {
        self.adminCheck = acct.borrow<&SetAndSeries.Admin>(from: SetAndSeries.AdminStoragePath)
            ?? panic("Could not borrow admin reference")

        acct2.storage.save(<-self.adminCheck.createNewAdmin(), to: SetAndSeries.AdminStoragePath)
    }

    execute {
        log("New Admin Resource Created")
    }
}
