import Array "mo:base/Array";
import Principal "mo:base/Principal";
import Debug "mo:base/Debug";
import Result "mo:base/Result";

actor {
    type Product = {
        id : Nat;
        name : Text;
        description : Text;
    };

    type Manufacturer = {
        id : Principal;
        name : Text;
    };
    type AddProductError = {
        #unauthorized;
    };
    var products : [Product] = [];
    var manufacturers : [Manufacturer] = [];

    public func registerManufacturer(id : Principal, name : Text) : async () {
        let manufacturer : Manufacturer = { id = id; name = name };
        manufacturers := Array.append<Manufacturer>(manufacturers, [manufacturer]);
    };

    public shared(msg) func addProduct(id: Nat, name: Text, description: Text) : async () {
    let caller = msg.caller;
    let manufacturerExists = Array.find<Manufacturer>(manufacturers, func(m: Manufacturer) : Bool { m.id == caller });

    switch (manufacturerExists) {
        case null {
            // Do nothing or handle unauthorized access as needed
        };
        case _ {
            let product: Product = {
                id = id;
                name = name;
                description = description
            };
            products := Array.append<Product>(products, [product]);
        };
    };
};

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
