using System;
using System.Collections.Generic;
using TechShop.Model;

namespace TechShop.Repository
{
    internal interface ITechShopRepository
    {
        // Customer Methods
        int CalculateTotalOrders(int customerID); // Calculates the total number of orders placed by a customer.
        Customer GetCustomerDetails(int customerID); // Retrieves and displays detailed information about a customer.
        bool AddCustomer(Customer customer); // Adds a new customer.
        bool UpdateCustomer(Customer customer); // Updates an existing customer's information.
        bool RemoveCustomer(int customerID); // Removes a customer by ID.
        Customer GetCustomerById(int customerID); // Retrieves a customer by ID.
        List<Customer> SearchCustomers(string keyword); // Searches for customers using a keyword.

        // Product Methods
        Product GetProductDetails(int productID); // Retrieves and displays detailed information about a product.
        bool UpdateProduct(Product product); // Allows updates to product details (e.g., price, description).
        bool IsProductInStock(int productID); // Checks if a product is currently in stock.
        bool AddProduct(Product product); // Adds a new product.
        bool RemoveProduct(int productID); // Removes a product by ID.
        Product GetProductById(int productID); // Retrieves a product by ID.
        List<Product> SearchProducts(string keyword); // Searches for products using a keyword.

        // Order Methods
        decimal CalculateTotalAmount(int orderID); // Calculates the total amount of an order.
        Order GetOrderDetails(int orderID); // Retrieves and displays the details of an order.
        bool UpdateOrderStatus(int orderID, string status); // Updates the status of an order.
        bool CancelOrder(int orderID); // Cancels an order and adjusts stock levels for products.
        bool AddOrder(Order order); // Adds a new order.
        bool UpdateOrder(Order order); // Updates an existing order.
        bool RemoveOrder(int orderID); // Removes an order by ID.
        Order GetOrderById(int orderID); // Retrieves an order by ID.
        List<Order> GetOrdersByCustomerId(int customerID); // Retrieves all orders for a specific customer.

        // OrderDetails Methods
        decimal CalculateSubtotal(int orderDetailID); // Calculates the subtotal for an order detail.
        OrderDetail GetOrderDetailInfo(int orderDetailID); // Retrieves and displays information about an order detail.
        bool UpdateQuantity(int orderDetailID, int newQuantity); // Updates the quantity of a product in an order detail.
        bool AddDiscount(int orderDetailID, decimal discountPercentage); // Applies a discount to an order detail.

        // Inventory Methods
        Product GetProduct(int inventoryID); // Retrieves the product associated with an inventory item.
        int GetQuantityInStock(int productID); // Gets the current quantity of a product in stock.
        bool AddToInventory(int productID, int quantity); // Adds a specified quantity of a product to the inventory.
        bool RemoveFromInventory(int productID, int quantity); // Removes a specified quantity of a product from the inventory.
        bool UpdateStockQuantity(int productID, int newQuantity); // Updates the stock quantity to a new value.
        bool IsProductAvailable(int productID, int quantityToCheck); // Checks if a specified quantity of a product is available in inventory.
        decimal GetInventoryValue(int inventoryID); // Calculates the total value of a product in inventory.
        List<Inventory> ListLowStockProducts(int threshold); // Lists products with quantities below a specified threshold.
        List<Inventory> ListOutOfStockProducts(); // Lists products that are out of stock.
        List<Inventory> ListAllInventoryItems(); // Lists all inventory items.
        bool IsProductAvailable(object productID, object quantity);
    }
}
