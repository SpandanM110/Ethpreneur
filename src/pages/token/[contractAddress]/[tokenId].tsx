import { useRouter } from 'next/router';
import { useContract, useNFT, ThirdwebNftMedia } from '@thirdweb-dev/react';
import { MARKETPLACE_ADDRESS, NFT_COLLECTION_ADDRESS } from '../../../const/addresses';
import { useState } from 'react';
import { useForm } from 'react-hook-form';

export default function TokenPage() {
  const router = useRouter();
  const { contractAddress, tokenId } = router.query;
  const { contract } = useContract(contractAddress as string);
  const { data: nft, isLoading } = useNFT(contract, tokenId as string);
  const { contract: marketplace } = useContract(MARKETPLACE_ADDRESS, "marketplace-v3");
  const [bidValue, setBidValue] = useState<string>("");

  async function buyListing() {
    let txResult;

    if (auctionListing?.[0]) {
      txResult = await marketplace?.englishAuctions.buyoutAuction(
        auctionListing[0].id
      );
    } else if (directListing?.[0]) {
      txResult = await marketplace?.directListings.buyFromListing(
        directListing[0].id,
        1
      );
    } else {
      throw new Error("No listing found");
    }

    return txResult;
  }

  async function createBidOffer() {
    if (!bidValue) {
      throw new Error("Please enter a bid value");
    }

    let txResult;

    if (auctionListing?.[0]) {
      txResult = await marketplace?.englishAuctions.makeBid(
        auctionListing[0].id,
        bidValue
      );
    } else if (directListing?.[0]) {
      txResult = await marketplace?.offers.makeOffer({
        assetContractAddress: contractAddress as string,
        tokenId: tokenId as string,
        totalPrice: bidValue,
      });
    } else {
      txResult = await marketplace?.offers.makeOffer({
        assetContractAddress: contractAddress as string,
        tokenId: tokenId as string,
        totalPrice: bidValue,
      });
    }

    return txResult;
  }

  const { register, handleSubmit } = useForm<AuctionFormData>({
    defaultValues: {
        nftContractAddress: contractAddress as string,
        tokenId: tokenId as string,
        buyoutBidAmount: "1",
        startDate: new Date(),
        endDate: new Date(),
        floorPrice: "0",
    },
  });

  async function handleSubmissionAuction(data: AuctionFormData) {
      await checkAndProvideApproval();
      const txResult = await createAuctionListing({
          assetContractAddress: data.nftContractAddress,
          tokenId: data.tokenId,
          buyoutBidAmount: data.buyoutBidAmount,
          minimumBidAmount: data.floorPrice,
          startTimestamp: new Date(data.startDate),
          endTimestamp: new Date(data.endDate),
      });

      return txResult;
  }

  return (
    <div>
      {isLoading ? (
        <p>Loading...</p>
      ) : (
        <div>
          <ThirdwebNftMedia metadata={nft?.metadata} />
          <p>{nft?.metadata.name}</p>
          <p>{nft?.metadata.description}</p>
          <button onClick={buyListing}>Buy</button>
          <form onSubmit={handleSubmit(createBidOffer)}>
            <input
              type="text"
              placeholder="Enter bid amount"
              value={bidValue}
              onChange={(e) => setBidValue(e.target.value)}
            />
            <button type="submit">Place Bid</button>
          </form>
          <form onSubmit={handleSubmit(handleSubmissionAuction)}>
            <input
              type="text"
              placeholder="Buyout Bid Amount"
              {...register("buyoutBidAmount")}
            />
            <input
              type="text"
              placeholder="Start Date"
              {...register("startDate")}
            />
            <input
              type="text"
              placeholder="End Date"
              {...register("endDate")}
            />
            <input
              type="text"
              placeholder="Floor Price"
              {...register("floorPrice")}
            />
            <button type="submit">List for Auction</button>
          </form>
        </div>
      )}
    </div>
  );
}
