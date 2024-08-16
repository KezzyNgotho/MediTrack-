import Debug "mo:base/Debug";
// Manufacturer.mo
actor {
  stable var name: Text = "Unnamed Manufacturer";
  stable var products: [Text] = [];

  public func initManufacturer(_name: Text): async () {
    name := _name;
  };

  public func getName(): async Text {
    return name;
  };

  public func addProduct(productName: Text): async () {
    products := Array.append(products, [productName]);
  };

  public func getProducts(): async [Text] {
    return products;
  };

  public func reportProductIssue(productName: Text, issueDetails: Text): async () {
    // This could be enhanced to store issues in a separate data structure
    Debug.print("Reported issue for product " # productName # ": " # issueDetails);
  };
}
