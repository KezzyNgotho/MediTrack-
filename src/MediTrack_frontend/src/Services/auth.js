// src/services/auth.js
import { Actor, HttpAgent } from '@dfinity/agent';
import { idlFactory as internetIdentityIDL } from 'internet-identity/idl';

export async function authenticate() {
  const agent = new HttpAgent({ host: 'https://icp0.io' });
  const identity = await window.ic.plug.requestConnect({
    whitelist: ['your-canister-id'],
  });

  if (identity) {
    const actor = Actor.createActor(internetIdentityIDL, {
      agent,
      canisterId: 'your-canister-id',
    });
    const principal = identity.getPrincipal();
    return { principal, actor };
  }

  return null;
}
