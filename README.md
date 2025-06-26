# OnlineShop

A comprehensive database project for an e-commerce platform. It models a real-world online shopping system inspired by platforms like Amazon, Hepsiburada, and Trendyol. The project includes conceptual design, relational modeling, SQL implementation, triggers, constraints, and example queries, demonstrating end-to-end database development.
---

## 👤 Contribution

This was a group project.

I was responsible for:
- Designing the initial EER schema and entity relationships
- Creating the first version of the relational model and normalization
- Implementing core logic such as foreign keys, triggers, and joins
- Debugging SQL scripts during development

---

## 🔧 Features & Scope

* User registration and account management (including addresses and wishlists)
* Product catalog with images, categories, and seller offerings
* Order tracking with logistics and delivery details
* Review system with rating aggregation triggers
* Promotions and coupon handling
* Shopping cart management and payment method integration
* Relational modeling with normalization and entity relationships

---

## 🌍 Technologies Used

* MySQL / SQL
* EER modeling tools (e.g., draw\.io)
* Structured relational schema design
* Trigger-based business logic

---

## 🔄 Database Structure Highlights

* **USER, PRODUCT, SHOP, ORDERS**: Core transactional entities
* **ADDRESSES, WISHLIST, CART**: Support personalization and organization
* **REVIEW, LOGISTICS, CATEGORY**: Enhance user experience and fulfillment
* **PROMOTION, COUPON, REDEEMS**: Marketing and discounts
* **CREDIT\_CARD, WALLET, PAYMENT\_METHOD**: Flexible payment processing

---

## ⚡ Advanced SQL Features

* **Triggers**:

  * `after_review_insert`: Updates product's average rating
  * `after_order_created`: Decreases product stock
  * `after_product_added_to_order`: Dynamically updates order price

* **Constraints & Checks**:

  * Positive pricing and stock
  * Rating range enforcement (1–5)

* **Sample Queries**:

  * Top-selling products
  * Orders with delayed delivery
  * Customers using specific payment types
  * Sales per shop

---

## 🔍 Example Query

```sql
SELECT p.Name, SUM(c.Quantity) AS TotalSold
FROM PRODUCT p
JOIN CONTAINS c ON p.ProductID = c.ProductID
GROUP BY p.Name
ORDER BY TotalSold DESC
LIMIT 1;
```

This returns the most popular product based on units sold.
