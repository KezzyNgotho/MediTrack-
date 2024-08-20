import Array "mo:base/Array";

actor {
    type Product = {
        id : Nat;
        name : Text;
        description : Text;
    };

    var products : [Product] = [];

   public func updateProduct(id : Nat, newName : Text, newDescription : Text) : async () {
    var updatedProducts : [Product] = [];
    for (product in products.vals()) {
        if (product.id == id) {
            updatedProducts := Array.append<Product>(updatedProducts, [{ id = id; name = newName; description = newDescription }]);
        } else {
            updatedProducts := Array.append<Product>(updatedProducts, [product]);
        };
    };
    products := updatedProducts;
};
};
