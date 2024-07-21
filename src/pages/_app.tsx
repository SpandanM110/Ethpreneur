import { ThirdwebProvider } from '@thirdweb-dev/react';
import { AppProps } from 'next/app';
import { Navbar } from '../components/Navbar';
import '../styles/globals.css';

function MyApp({ Component, pageProps }: AppProps) {
  return (
    <ThirdwebProvider>
      <Navbar />
      <Component {...pageProps} />
    </ThirdwebProvider>
  );
}

export default MyApp;
