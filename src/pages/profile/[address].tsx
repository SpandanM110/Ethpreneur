import { useRouter } from 'next/router';
import { useAddress, useContract, useOwnedNFTs } from '@thirdweb-dev/react';
import NFTGrid from '@/components/NFTGrid';
import { NFT_COLLECTION_ADDRESS } from '@/const/addresses';

export default function Profile() {
  const router = useRouter();
  const { address } = router.query;
  const { contract } = useContract(NFT_COLLECTION_ADDRESS);
  const { data, isLoading } = useOwnedNFTs(contract, address as string);

  return (
    <div>
      <h1>Profile</h1>
      <p>NFTs owned by {address}</p>
      <NFTGrid
        isLoading={isLoading}
        data={data}
        emptyText={"No NFTs found for this address."}
      />
    </div>
  );
}
