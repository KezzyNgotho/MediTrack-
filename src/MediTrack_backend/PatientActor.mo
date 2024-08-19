import Array "mo:base/Array";

type MedicalRecord = {
  date: Text;
  description: Text;
  doctor: Text;
};

actor PatientActor {

  stable var name: Text = "Unnamed Patient";
  stable var records: [MedicalRecord] = [];

  public func initPatient(_name: Text): async () {
    name := _name;
  };

  public func getName(): async Text {
    return name;
  };

  public func addMedicalRecord(record: MedicalRecord): async () {
    // Use Array.append instead of Array.concat
    records := Array.append<MedicalRecord>(records, [record]);
  };

  public func getMedicalRecords(): async [MedicalRecord] {
    return records;
  };
}
