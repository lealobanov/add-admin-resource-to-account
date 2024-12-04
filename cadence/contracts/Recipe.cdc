access(all) contract Recipe {
    // Admin is a special authorization resource that 
    // allows the owner to perform important NFT 
    // functions
    //
    access(all) resource Admin {

        access(all) fun createNewAdmin(): @Admin {
            return <-create Admin()
        }
        
    }
}