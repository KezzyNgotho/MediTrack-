import Array "mo:base/Array";
import Debug "mo:base/Debug";

type ManufacturerInfo = {
  id: Nat;
  name: Text;
  products: [Text];
};

type MedicalRecord = {
  date: Text;
  description: Text;
  doctor: Text;
};

actor ManufacturerActor {

  stable var name: Text = "Unnamed Manufacturer";
  stable var products: [Text] = [];

  public func initManufacturer(_name: Text): async () {
    name := _name;
  };

  public func getName(): async Text {
    return name;
  };

  public func addProduct(productName: Text): async () {
    // Use Array.foldLeft to avoid the deprecated append method
    products := Array.foldLeft<Text, [Text]>(products, [productName], func(acc, product) {
      Array.append<Text>(acc, [product])
    });
  };

  public func getProducts(): async [Text] {
    return products;
  };

  public func reportProductIssue(productName: Text, issueDetails: Text): async () {
    Debug.print("Reported issue for product: " # productName # ". Details: " # issueDetails);
  };
}
