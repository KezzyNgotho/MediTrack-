import Array "mo:base/Array";
actor {
    // Define Product type with additional fields for category and expiry date
    type Product = {
        id: Nat;
        name: Text;
        description: Text;
        category: Text;
        quantity: Int;
        price: {
            min: Float;
            max: Float;
        };
        status: Text;
        expiryDate: Text;
    };

    // State variables
    var products: [Product] = [];
    var nextId: Nat = 1;  // Auto-increment ID

    // Function to add a new product
    public func addProduct(
    name: Text,
    description: Text,
    category: Text,
    quantity: Int,
    minPrice: Float,
    maxPrice: Float,
    expiryDate: Text
    ): async () {
        // Create a new product with auto-generated ID and pending status
        let product: Product = {
            id = nextId;
            name = name;
            description = description;
            category = category;
            quantity = quantity;
            price = { min = minPrice; max = maxPrice };
            status = "pending";  // Initial status
            expiryDate = expiryDate;
        };

        // Add the product to the products list
        products := Array.append(products, [product]);

        // Increment the ID for the next product
        nextId := nextId + 1;
    };

    // Function to fetch all products
    public func getAllProducts(): async [Product] {
        return products;
    };

    // Function to view a specific product by ID
    public func viewProduct(productId: Nat): async ?Product {
        return Array.find(products, func(p: Product): Bool { p.id == productId });
    };
}
