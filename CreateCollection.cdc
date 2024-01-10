import CryptoPoops from 0x05

transaction() {
  prepare(signer: AuthAccount) {
    // Check if the account already has a stored collection.
    if signer.borrow<&CryptoPoops.Collection>(from: /storage/CryptoPoopsCollection) != nil {
      log("A collection already exists.")
      return
    }

    // Create a new collection and store it in the account's storage.
    signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/CryptoPoopsCollection)

    // Establish a public link to the created collection.
    signer.link<&CryptoPoops.Collection>(/public/CryptoPoopsCollection, target: /storage/CryptoPoopsCollection)

    log("Successfully created and linked a new collection.")
  }
}
