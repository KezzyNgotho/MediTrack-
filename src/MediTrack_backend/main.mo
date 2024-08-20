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
    type Patient = {
        id : Principal;
        name : Text;
        age : Nat;
        dependents : [Dependent];
    };

    type Dependent = {
        name : Text;
        age : Nat;
    };

    type Pharmacy = {
        id : Principal;
        name : Text;
    };

    var pharmacies : [Pharmacy] = [];

    var patients : [Patient] = [];

    var products : [Product] = [];
    var manufacturers : [Manufacturer] = [];


     public func viewProduct(productId : Nat) : async ?Product {
        return Array.find<Product>(products, func(p : Product) : Bool { p.id == productId });
    };


    public func registerPharmacy(id : Principal, name : Text) : async () {
        let pharmacy : Pharmacy = { id = id; name = name };
        pharmacies := Array.append<Pharmacy>(pharmacies, [pharmacy]);
    };

    public func buyProduct(pharmacyId : Principal, productId : Nat) : async () {
        var updatedProducts : [Product] = [];
        for (product in products.vals()) {
            if (product.id == productId) {
                // Update product status to "sold"
                let updatedProduct = {
                    id = product.id;
                    name = product.name;
                    description = product.description;
                    status = "sold";
                };
                updatedProducts := Array.append<Product>(updatedProducts, [updatedProduct]);
            } else {
                // Keep the product unchanged
                updatedProducts := Array.append<Product>(updatedProducts, [product]);
            };
        };
        products := updatedProducts;
    };

    public func reportSuspiciousActivity(patientId : Principal, report : Text) : async () {
        // Here you can handle the report, for example, store it in a database or send it to an administrator
        Debug.print(debug_show ({ patientId = patientId; report = report }));
    };

   
    public func completeProfile(id : Principal, name : Text, age : Nat, dependents : [Dependent]) : async () {
        let patient : Patient = {
            id = id;
            name = name;
            age = age;
            dependents = dependents;
        };
        patients := Array.append<Patient>(patients, [patient]);
    };

   

    public func registerManufacturer(id : Principal, name : Text) : async () {
        let manufacturer : Manufacturer = { id = id; name = name; status = "pending" };
        manufacturers := Array.append<Manufacturer>(manufacturers, [manufacturer]);
    };

    public shared (msg) func addProduct(id : Nat, name : Text, description : Text) : async () {
        let caller = msg.caller;
        let manufacturerExists = Array.find<Manufacturer>(manufacturers, func(m : Manufacturer) : Bool { m.id == caller });

        switch (manufacturerExists) {
            case null {
                // Do nothing or handle unauthorized access as needed
            };
            case _ {
                let product : Product = {
                    id = id;
                    name = name;
                    description = description;
                    status = "pending";
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


    public func approveManufacturer(id : Principal) : async () {
        var updatedManufacturers : [Manufacturer] = [];
        for (manufacturer in manufacturers.vals()) {
            if (manufacturer.id == id) {
                updatedManufacturers := Array.append<Manufacturer>(updatedManufacturers, [{ id = id; name = manufacturer.name; status = "approved" }]);
            } else {
                updatedManufacturers := Array.append<Manufacturer>(updatedManufacturers, [manufacturer]);
            };
        };
        manufacturers := updatedManufacturers;
    };

  public func approveProduct(id : Nat) : async () {
        var updatedProducts : [Product] = [];
        for (product in products.vals()) {
            if (product.id == id) {
                updatedProducts := Array.append<Product>(updatedProducts, [{ id = id; name = product.name; description = product.description; status = "approved" }]);
            } else {
                updatedProducts := Array.append<Product>(updatedProducts, [product]);
            };
        };
        products := updatedProducts;
        
    };




    public func flagProduct(id : Nat) : async () {
        var updatedProducts : [Product] = [];
        for (product in products.vals()) {
            if (product.id == id) {
                updatedProducts := Array.append<Product>(updatedProducts, [{ id = id; name = product.name; description = product.description; status = "flagged" }]);
            } else {
                updatedProducts := Array.append<Product>(updatedProducts, [product]);
            };
        };
        products := updatedProducts;
    
    };

        public func flagManufacturer(id : Principal) : async () {
            var updatedManufacturers : [Manufacturer] = [];
            for (manufacturer in manufacturers.vals()) {
                if (manufacturer.id == id) {
                    updatedManufacturers := Array.append<Manufacturer>(updatedManufacturers, [{ id = id; name = manufacturer.name; status = "flagged" }]);
                } else {
                    updatedManufacturers := Array.append<Manufacturer>(updatedManufacturers, [manufacturer]);
                };
            };
            manufacturers := updatedManufacturers;
        };














}