import { NFT as NFTType } from '@thirdweb-dev/sdk';
import Link from 'next/link';
import NFTComponent from './NFTComponent';
import { NFT_COLLECTION_ADDRESS } from '@/const/addresses';

type Props = {
  isLoading: boolean;
  data: NFTType[] | undefined;
  overrideOnclickBehavior?: (nft: NFTType) => void;
  emptyText?: string;
};

export default function NFTGrid({
  isLoading,
  data,
  overrideOnclickBehavior,
  emptyText = "No Comapnies found",
}: Props) {
  return (
    <div>
      {isLoading ? (
        <p>Loading...</p>
      ) : data && data.length > 0 ? (
        data.map((nft) =>
          !overrideOnclickBehavior ? (
            <Link
              href={`/token/${NFT_COLLECTION_ADDRESS}/${nft.metadata.id}`}
              key={nft.metadata.id}
            >
              <NFTComponent nft={nft} />
            </Link>
          ) : (
            <div
              key={nft.metadata.id}
              onClick={() => overrideOnclickBehavior(nft)}
            >
              <NFTComponent nft={nft} />
            </div>
          ))
      ) : (
        <p>{emptyText}</p>
      )}
    </div>
  );
}
