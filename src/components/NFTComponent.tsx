import { useEffect, useState } from "react";
import { testingCollectionContract } from "@/lib/thirdwebClient";

const NFTComponent = () => {
  const [nfts, setNfts] = useState([]);

  useEffect(() => {
    const fetchNFTs = async () => {
      const nfts = await testingCollectionContract.erc721.getAll();
      setNfts(nfts);
    };

    fetchNFTs();
  }, []);

  return (
    <div>
      {nfts.map((nft, index) => (
        <div key={index}>
          <h3>{nft.metadata.name}</h3>
          <p>{nft.metadata.description}</p>
        </div>
      ))}
    </div>
  );
};

export default NFTComponent;
