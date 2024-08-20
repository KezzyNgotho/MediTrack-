import Array "mo:base/Array";

// Define the MedicalRecord type
module MedicalRecord = {
  type MedicalRecord = {
    date: Text;
    description: Text;
    doctor: Text;
  };
};

// Define the PatientActor
actor PatientActor {

  // Mutable state within the actor
  var name: Text = "Unnamed Patient";
  var records: [MedicalRecord.MedicalRecord] = [];

  // Initialize a new patient
  public func initPatient(_name: Text): async () {
    name := _name;
  };

  // Add a medical record for the patient
  public func addMedicalRecord(record: MedicalRecord.MedicalRecord): async () {
    records := records # [record]; // Concatenate arrays
  };

  // Get the list of medical records for the patient
  public func getMedicalRecords(): async [MedicalRecord.MedicalRecord] {
    return records;
  };
};
