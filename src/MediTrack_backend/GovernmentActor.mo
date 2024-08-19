import Array "mo:base/Array";
import Debug "mo:base/Debug";
import Types "./Types";
import Buffer "mo:base/Buffer";

actor GovernmentActor {
  var manufacturers = Buffer.Buffer<Types.ManufacturerInfo>(0, null);
  var reports = Buffer.Buffer<Text> (0, null);

  public func registerManufacturer(id: Nat, name: Text, products: [Text]): async () {
    let manufacturer = Types.ManufacturerInfo {
      id = id;
      name = name;
      products = products
    };
    let _ = Buffer.push<Types.ManufacturerInfo>(manufacturers, manufacturer);
    Debug.print("Registered manufacturer: " # name # " with ID: " # Nat.toText(id));
  };

  public func reportIssue(issueDetails: Text): async () {
    let _ = Buffer.push<Text>(reports, issueDetails);
    Debug.print("New issue report: " # issueDetails);
  };

  public func getManufacturers(): async [Types.ManufacturerInfo] {
    return Buffer.toArray(manufacturers);
  };

  public func getReports(): async [Text] {
    return Buffer.toArray(reports);
  };
}