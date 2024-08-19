import Array "mo:base/Array";
import Principal "mo:base/Principal";
import ManufacturerActor "./ManufacturerActor";
import GovernmentActor "./GovernmentActor";
import PatientActor "./PatientActor";

actor MediTrack {
  let manufacturer: ManufacturerActor = Actor.fromPrincipal(Principal.fromText("principal_id_for_manufacturer"));
  let government: GovernmentActor = Actor.fromPrincipal(Principal.fromText("principal_id_for_government"));
  let patient: PatientActor = Actor.fromPrincipal(Principal.fromText("principal_id_for_patient"));

  public func createManufacturer(name: Text): async () {
    await manufacturer.initManufacturer(name);
  };

  public func addProductForManufacturer(productName: Text): async () {
    await manufacturer.addProduct(productName);
  };

  public func getManufacturerProducts(): async [Text] {
    return await manufacturer.getProducts();
  };

  public func registerManufacturerToGovernment(id: Nat, name: Text, products: [Text]): async () {
    await government.registerManufacturer(id, name, products);
  };

  public func getRegisteredManufacturers(): async [ManufacturerInfo] {
    return await government.getManufacturers();
  };

  public func createPatient(name: Text): async () {
    await patient.initPatient(name);
  };

  public func addMedicalRecordForPatient(record: MedicalRecord): async () {
    await patient.addMedicalRecord(record);
  };

  public func getPatientRecords(): async [MedicalRecord] {
    return await patient.getMedicalRecords();
  };
}
