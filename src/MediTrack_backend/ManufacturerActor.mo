import Array "mo:base/Array";
import Debug "mo:base/Debug";

module ManufacturerModule {
  public type ManufacturerInfo = {
    id: Nat;
    name: Text;
    products: [Text];
  };

  
  public type MedicalRecord = {
    date: Text;
    description: Text;
    doctor: Text;
  };

  public func reportProductIssue(productName: Text, issueDetails: Text): () {
    Debug.print("Reported issue for product: " # productName # ". Details: " # issueDetails);
  };
}