export function someMutation(/* state */) {}

export function setAccount(state, val) {
  state.account = val;
}

export function setWeb3(state, val) {
  state.web3 = val;
}

export function setProvider(state, val) {
  console.log('PPPPPPPPPPPPPPPP:', val);
  state.provider = val;
}

export function setBalance(state, val) {
  state.balance = val;
}
