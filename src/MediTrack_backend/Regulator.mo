import Array "mo:base/Array";
// Regulator.mo
actor {
  stable var approvedManufacturers: [Principal] = [];

  public func approveManufacturer(manufacturerId: Principal): async () {
    approvedManufacturers := Array.append(approvedManufacturers, [manufacturerId]);
  };

  public func getApprovedManufacturers(): async [Principal] {
    return approvedManufacturers;
  };

  public func revokeManufacturerApproval(manufacturerId: Principal): async () {
    approvedManufacturers := approvedManufacturers.filter(func (m) { m != manufacturerId });
  };

  public func monitorCompliance(manufacturerId: Principal): async Bool {
    // Add logic to monitor compliance; for now, return a simple check
    return approvedManufacturers.contains(manufacturerId);
  };
}
