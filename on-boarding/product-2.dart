void main(){


  Product p1 = Product("Shoes", "Nike", 4200);
  Product p2 = Product("Car", "Ford", 5000000);
  Product p3 = Product("Laptop", "Dell", 85000);
  Product p4 = Product("Smartphone", "Samsung", 65000);
  Product p5 = Product("Watch", "Rolex", 150000);
  Product p6 = Product("Backpack", "Wildcraft", 2500);
  Product p7 = Product("Headphones", "Sony", 12000);
  Product p8 = Product("Bicycle", "Giant", 35000);
  Product p9 = Product("Tablet", "Apple", 90000);
  Product p10 = Product("Camera", "Canon", 70000);

  ProductManager PM1 = ProductManager();

  PM1.AddProduct(p1);
  PM1.AddProduct(p2);
  PM1.AddProduct(p3);
  PM1.AddProduct(p4);
  PM1.AddProduct(p5);
  PM1.AddProduct(p6);
  PM1.AddProduct(p7);
  PM1.AddProduct(p8);
  PM1.AddProduct(p9);
  PM1.AddProduct(p10);
  
  PM1.ViewAllProducts();
  



}

class Product{
  String? Name, Description;
  int? Price;

  Product(this.Name, this.Description, this.Price);
  @override
  String toString(){
     return ("Name : $Name, Description : $Description, Price : $Price ");
  }
}

class ProductManager {

  List<Product> Products = [];

  void AddProduct(Product product){
    Products.add(product);
  }

  void ViewAllProducts(){
    if(Products.isEmpty){
      print("No products available.");
    }
    else{
      for(Product product in Products){
        print(product);
      }
    }
  }

  void Viewproduct(Product product){
    print(product);
  }

  void DeleteProduct(Product product){
    Products.remove(product);
  }
    
}