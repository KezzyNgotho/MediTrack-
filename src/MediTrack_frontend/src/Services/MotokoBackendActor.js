import { Actor, HttpAgent } from '@dfinity/agent';
import { idlFactory as motoko_idlFactory, canisterId as motoko_canisterId } from '../../../declarations/MediTrack_backend';

// Initialize the agent with the correct host for your network
const agent = new HttpAgent({
  host: 'http://127.0.0.1:4943'  // Local replica URL; adjust as needed for production
});

// Optionally, fetch the root key when using local development environments
// await agent.fetchRootKey();

// Create the actor for the Motoko backend canister
const motokoBackendActor = Actor.createActor(motoko_idlFactory, {
  agent,
  canisterId: motoko_canisterId,
});

export default motokoBackendActor;
