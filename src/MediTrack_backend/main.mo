import Patient "./patient";
import Regulator "./Regulator";
import Manufacturer "Manufacturer.mo";
import Government "Government.mo";

actor Main {

  // Create instances of the actors
  stable var patientActor: [Principal] = [];
  stable var regulatorActor: Principal = Regulator;
  stable var manufacturerActor: [Principal] = [];
  stable var governmentActor: Principal = Government;

  // Function to add a new patient actor
  public func createPatient(): async Principal {
    let newPatient = await Patient();
    patientActor := Array.append(patientActor, [newPatient]);
    return newPatient;
  };

  // Function to add a new manufacturer actor
  public func createManufacturer(): async Principal {
    let newManufacturer = await Manufacturer();
    manufacturerActor := Array.append(manufacturerActor, [newManufacturer]);
    return newManufacturer;
  };

  // Expose the government actor
  public func getGovernmentActor(): async Principal {
    return governmentActor;
  };

  // Expose the regulator actor
  public func getRegulatorActor(): async Principal {
    return regulatorActor;
  };

  // Get the list of all patients
  public func getPatientActors(): async [Principal] {
    return patientActor;
  };

  // Get the list of all manufacturers
  public func getManufacturerActors(): async [Principal] {
    return manufacturerActor;
  };

  // Clean up a patient actor (Example of deletion - might depend on certain criteria)
  public func removePatient(patientId: Principal): async () {
    patientActor := patientActor.filter(func (p) { p != patientId });
  };

  // Clean up a manufacturer actor (Example of deletion - might depend on certain criteria)
  public func removeManufacturer(manufacturerId: Principal): async () {
    manufacturerActor := manufacturerActor.filter(func (m) { m != manufacturerId });
  };
}
