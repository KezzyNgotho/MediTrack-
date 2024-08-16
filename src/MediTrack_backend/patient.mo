import Array "mo:base/Array";
// Patient.mo
actor {
  stable var name: Text = "Unnamed";
  stable var age: Nat = 0;
  stable var healthRecords: [Text] = [];
  stable var appointments: [Text] = [];

  public func initPatient(_name: Text, _age: Nat): async () {
    name := _name;
    age := _age;
  };

  public func getName(): async Text {
    return name;
  };

  public func getAge(): async Nat {
    return age;
  };

  public func addHealthRecord(record: Text): async () {
    healthRecords := Array.append(healthRecords, [record]);
  };

  public func getHealthRecords(): async [Text] {
    return healthRecords;
  };

  public func scheduleAppointment(details: Text): async () {
    appointments := Array.append(appointments, [details]);
  };

  public func getAppointments(): async [Text] {
    return appointments;
  };

  public func updateName(newName: Text): async () {
    name := newName;
  };

  public func updateAge(newAge: Nat): async () {
    age := newAge;
  };
}
