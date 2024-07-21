import { useContract, useOwnedNFTs } from '@thirdweb-dev/react';
import { useAddress } from '@thirdweb-dev/react';
import NFTGrid from '@/components/NFTGrid';
import { NFT_COLLECTION_ADDRESS } from '@/const/addresses';

export default function Sell() {
  const address = useAddress();
  const { contract } = useContract(NFT_COLLECTION_ADDRESS);
  const { data, isLoading } = useOwnedNFTs(contract, address);

  return (
    <div>
      <h1>Sell NFTs</h1>
      <p>List your NFTs for sale.</p>
      <NFTGrid
        isLoading={isLoading}
        data={data}
        emptyText={"You don't own any NFTs."}
      />
    </div>
  );
}
