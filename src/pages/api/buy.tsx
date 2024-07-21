import { useContract, useNFTs } from '@thirdweb-dev/react';
import NFTGrid from '@/components/NFTGrid';
import { NFT_COLLECTION_ADDRESS } from '@/const/addresses';

export default function Buy() {
  const { contract } = useContract(NFT_COLLECTION_ADDRESS);
  const { data, isLoading } = useNFTs(contract);

  return (
    <div>
      <h1>Buy NFTs</h1>
      <p>Browse and buy NFTs from this collection.</p>
      <NFTGrid
        isLoading={isLoading}
        data={data}
        emptyText={"No NFTs found"}
      />
    </div>
  );
}
