// Types.mo

type ManufacturerInfo = {
  id : Nat;
  address : Text;
  name : Text;
  products : [Text]
};

type Patient = {
  id : Nat;
  name : Text;
  medical_records : [MedicalRecord]
};

type MedicalRecord = {
  patient_id : Nat;
  // other fields...
};

type BasicDaoStableStorage = {
  manufacturers : [ManufacturerInfo];
  patients : [Patient];
  reports : [Text];
  system_params : SystemParams;
};

type SystemParams = {
  transfer_fee : {
    amount_e8s : Nat
  };
  proposal_vote_threshold : {
    amount_e8s : Nat
  };
  proposal_submission_deposit : {
    amount_e8s : Nat
  };
};

type ProposalPayload = {
  canister_id : Principal;
  method : Text;
  message : Blob
};

type UpdateSystemParamsPayload = {
  transfer_fee : ?{
    amount_e8s : Nat
  };
  proposal_vote_threshold : ?{
    amount_e8s : Nat
  };
  proposal_submission_deposit : ?{
    amount_e8s : Nat
  };
};

type ProposalState = {
  #open;
  #accepted;
  #rejected;
  #executing;
  #succeeded;
  #failed:(Text)
};

type VoteArgs = {
  proposal_id : Nat;
  vote : {
    #yes;
    #no
  }
};

type TransferArgs = {
  to : Principal;
  amount : {
    amount_e8s : Nat
  }
};