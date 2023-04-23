// const AVALANCHE_MAINNET_PARAMS = {
//   chainId: `0x${(43114).toString(16)}`,
//   chainName: 'Avalanche Mainnet C-Chain',
//   nativeCurrency: {
//     name: 'Avalanche',
//     symbol: 'AVAX',
//     decimals: 18,
//   },
//   rpcUrls: ['https://api.avax.network/ext/bc/C/rpc'],
//   blockExplorerUrls: ['https://snowtrace.io/'],
// };

// const AVALANCHE_TESTNET_PARAMS = {
//   chainId: `0x${(43113).toString(16)}`,
//   chainName: 'Avalanche FUJI C-Chain',
//   nativeCurrency: {
//     name: 'Avalanche',
//     symbol: 'AVAX',
//     decimals: 18,
//   },
//   rpcUrls: ['https://api.avax-test.network/ext/bc/C/rpc'],
//   blockExplorerUrls: ['https://testnet.snowtrace.io/'],
// };

// const ARBITRUM_MAINNET_PARAMS = {
//   chainId: `0x${(42161).toString(16)}`,
//   chainName: 'Arbitrum One',
//   nativeCurrency: {
//     name: 'Ethereum',
//     symbol: 'ETH',
//     decimals: 18,
//   },
//   rpcUrls: ['https://arb1.arbitrum.io/rpc'],
//   blockExplorerUrls: ['https://arbiscan.io/'],
// };

// const ARBITRUM_TESTNET_PARAMS = {
//   chainId: `0x${(421613).toString(16)}`,
//   chainName: 'Arbitrum Testnet',
//   nativeCurrency: {
//     name: 'Ethereum',
//     symbol: 'ETH',
//     decimals: 18,
//   },
//   rpcUrls: ['https://arbitrum-goerli.public.blastapi.io'],
//   blockExplorerUrls: ['https://goerli.arbiscan.io/'],
// };

const ETHERIUM_MAINNET_PARAMS = {
  chainId: `0x${(1).toString(16)}`,
  chainName: 'Ethereum Mainnet',
  nativeCurrency: {
    name: 'Etherium',
    symbol: 'ETH',
    decimals: 18,
  },
  rpcUrls: ['https://mainnet.infura.io/v3/'],
  blockExplorerUrls: ['https://etherscan.io'],
};

const SEPOLIA_TESTNET_PARAMS = {
  chainId: `0x${(11155111).toString(16)}`,
  chainName: 'Sepolia test network',
  nativeCurrency: {
    name: 'SepoliaETH',
    symbol: 'SepoliaETH',
    decimals: 18,
  },
  rpcUrls: ['https://sepolia.infura.io/v3/'],
  blockExplorerUrls: ['https://sepolia.etherscan.io/'],
};

const ENV = 'TEST'; // MAIN
export const CURRENT_RPC = ENV === 'MAIN' ? ETHERIUM_MAINNET_PARAMS : SEPOLIA_TESTNET_PARAMS;
export const CONTRACT_ADDRESS = ENV === 'MAIN' ? '???' : '0xcc326108eBfb3cceCb8bda5175A453D4B9b73040';

export const GAME_ABI = require('src/assets/ABIs/Luckify.json');

console.log(GAME_ABI);
