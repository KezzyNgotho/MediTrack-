import Array "mo:base/Array";
actor Patient {

  type Dependant = {
    id: Nat;
    name: Text;
    age: Nat;
    relationship: Text;
    lastCheckup: Text;
    healthStatus: Text;
  };

  type Appointment = {
    id: Nat;
    doctorName: Text;
    specialty: Text;
    date: Text;
    notes: Text;
  };

  var dependants: [Dependant] = [];
  var appointments: [Appointment] = [];

  public func addDependant(dep: Dependant): async () {
    dependants := Array.append(dependants, [dep]);
  };

  public func getDependants(): async [Dependant] {
    return dependants;
  };

  public func addAppointment(app: Appointment): async () {
    appointments := Array.append(appointments, [app]);
  };

  public func getAppointments(): async [Appointment] {
    return appointments;
  };

  public func getMedicalHistory(): async [Text] {
    // Demo medical history data
    return ["Hypertension - Under control", "Diabetes Type 2 - Regular monitoring required"];
  };

  public func getMedication(): async [Text] {
    // Demo medication data
    return ["Metformin - 500mg twice daily", "Lisinopril - 10mg daily"];
  };

  public func getLabResults(): async [Text] {
    // Demo lab results data
    return ["Blood Glucose - 140 mg/dL", "Cholesterol Level - 180 mg/dL"];
  };
}
