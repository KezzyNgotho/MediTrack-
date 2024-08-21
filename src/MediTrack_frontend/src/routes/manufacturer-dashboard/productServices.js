// Assuming a REST API is used
export async function createProduct(product) {
    const response = await fetch('/api/products', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(product)
    });
    return response.json();
  }
  
  export async function getProducts() {
    const response = await fetch('/api/products');
    return response.json();
  }
  