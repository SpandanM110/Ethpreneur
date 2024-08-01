import { useContract, useNFTs } from '@thirdweb-dev/react';
import NFTGrid from '../components/NFTGrid';
import { NFT_COLLECTION_ADDRESS } from '@/const/addresses';

export default function Home() {
  const { contract } = useContract(NFT_COLLECTION_ADDRESS);
  const { data, isLoading } = useNFTs(contract);

  return (
    <div>
      <h1>Welcome to the Company IPO space</h1>
      <p>Browse and trade companies easily.</p>
      <NFTGrid
        isLoading={isLoading}
        data={data}
        emptyText={"No NFTs found"}
      />
    </div>
  );
}
