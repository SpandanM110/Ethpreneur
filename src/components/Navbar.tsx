import { useAddress, ConnectWallet } from '@thirdweb-dev/react';
import Link from 'next/link';

export function Navbar() {
  const address = useAddress();

  return (
    <nav className="bg-gray-800 p-4">
      <div className="container mx-auto flex justify-between items-center">
        <div className="text-white">
          <Link href='/' legacyBehavior>
            <a className="text-xl font-bold">Marketplace</a>
          </Link>
        </div>
        <div className="flex space-x-4">
          <Link href='/buy' legacyBehavior>
            <a className="text-white">Buy</a>
          </Link>
          <Link href='/sell' legacyBehavior>
            <a className="text-white">Sell</a>
          </Link>
        </div>
        <div className="flex items-center space-x-4">
          <ConnectWallet />
          {address && (
            <Link href={`/profile/${address}`} legacyBehavior>
              <a className="text-white">{address}</a>
            </Link>
          )}
        </div>
      </div>
    </nav>
  );
}

export default Navbar;
