import Array "mo:base/Array";
import Principal "mo:base/Principal";

actor {
  type Product = {
    id: Nat;
    name: Text;
    description: Text;
  };

  var products: [Product] = [];
  var manufacturers: [Principal] = [];

  public func registerManufacturer(manufacturer: Principal): async () {
    manufacturers := Array.append<Principal>(manufacturers, [manufacturer]);
  }

  public func addProduct(id: Nat, name: Text, description: Text): async () {
    let caller = Principal.fromActor(msg.caller);
    if (Array.contains<Principal>(manufacturers, caller)) {
      let product: Product = {id=id; name=name; description=description};
      products := Array.append<Product>(products, [product]);
    } else {
      throw "Unauthorized";
    }
  }

  public func updateProduct(id: Nat, newName: Text, newDescription: Text): async () {
    var updatedProducts: [Product] = [];
    for (product in products.vals()) {
      if (product.id == id) {
        updatedProducts := Array.append<Product>(updatedProducts, [{id=id; name=newName; description=newDescription}]);
      } else {
        updatedProducts := Array.append<Product>(updatedProducts, [product]);
      }
    }
    products := updatedProducts;
  }
};