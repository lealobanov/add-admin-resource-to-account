import Test
import "test_helpers.cdc"

access(all) let account = Test.getAccount(0x0000000000000007)

access(all)
fun setup() {
    let err = Test.deployContract(
        name: "Recipe",
        path: "../contracts/Recipe.cdc",
        arguments: [],
    )

    Test.expect(err, Test.beNil())
}


access(all) fun testExample() {
    let array = [1, 2, 3]
    Test.expect(array.length, Test.equal(3))
}
