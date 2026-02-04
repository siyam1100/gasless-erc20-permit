# Gasless ERC20 Permit

This repository provides a standard implementation of the **EIP-2612** permit pattern. By leveraging off-chain signatures, users can authorize token transfers without an initial `approve()` transaction, saving gas and improving the user experience.

## Features
* **EIP-712 Compliance**: Secure typed data signing.
* **Gasless Approvals**: Move tokens via signature.
* **OpenZeppelin Based**: Built on industry-standard security patterns.

## How it Works
1. The user signs a permit message off-chain.
2. The relayer/dApp submits the signature to the `permit` function.
3. The allowance is updated, and the transfer is executed in a single atomic transaction.

## License
MIT
