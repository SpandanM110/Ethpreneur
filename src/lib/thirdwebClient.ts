import { createThirdwebClient, getContract } from "thirdweb";
import { defineChain } from "thirdweb/chains";


// create the client with your clientId, or secretKey if in a server environment
const client = createThirdwebClient({ 
  clientId: "ebb4b1d0e7ba31c7fa81ec21fb4452fe"
});

export const testingCollectionContract = getContract({ 
  client, 
  chain: defineChain(11155111), 
  address: "0x11Ba544b59A6d3552fe2899308CEDB474505ECAF"
});

export const ethpreneurContract = getContract({ 
  client, 
  chain: defineChain(11155111), 
  address: "0xA600229C84eCCD9a22468D30EB0704Fb5abdA319"
});
