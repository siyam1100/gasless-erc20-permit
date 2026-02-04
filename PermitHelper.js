/**
 * Helper utility to sign EIP-712 permit data for the GaslessToken.
 */
const signPermit = async (signer, token, spender, value, deadline) => {
  const chainId = (await signer.provider.getNetwork()).chainId;
  const nonce = await token.nonces(signer.address);

  const domain = {
    name: await token.name(),
    version: "1",
    chainId: chainId,
    verifyingContract: token.address,
  };

  const types = {
    Permit: [
      { name: "owner", type: "address" },
      { name: "spender", type: "address" },
      { name: "value", type: "uint256" },
      { name: "nonce", type: "uint256" },
      { name: "deadline", type: "uint256" },
    ],
  };

  const message = {
    owner: signer.address,
    spender: spender,
    value: value,
    nonce: nonce,
    deadline: deadline,
  };

  const signature = await signer._signTypedData(domain, types, message);
  const { v, r, s } = ethers.utils.splitSignature(signature);

  return { v, r, s };
};

module.exports = { signPermit };
