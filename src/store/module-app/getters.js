import { ethers } from 'ethers';

// export function someGetter(/* state */) {}

export function getProvider(/* state */) {
  return new ethers.providers.Web3Provider(window.ethereum);
}
