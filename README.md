# 📊 Inventory & Supply Chain Dashboard
## Python-Driven UI for Enterprise-Style Database Operations

---

## 📌 Project Overview
This project demonstrates the design and implementation of a **production-style system** that enables users to interact with a relational database without writing SQL queries.

Built using **Python (Streamlit)** and **MySQL**, the application provides a web-based interface that allows business users—such as managers or operations teams—to perform database operations, run business logic, and generate reports through an intuitive UI.

The system simulates a real-world inventory and supply chain environment where database rules, calculations, and workflows are embedded directly into the database layer and exposed through a controlled frontend interface.

---

## 🏗 System Architecture
The system is built in two major layers:

### 1️⃣ Database Layer (MySQL)
The backend database is structured using enterprise-style components:
* **Tables:** Designed to manage core entities such as Products, Inventory, Orders, Shipments, and Stock entries.
* **Views:** Created to provide aggregated summaries and product history reports without exposing raw query complexity.
* **Stored Procedures:** Used to enforce controlled business workflows (e.g., receiving orders, updating stock, processing restocks).
* **Functions:** Implemented for reusable business logic such as restock checks and inventory threshold calculations.

### 2️⃣ Application Layer (Streamlit Frontend)
The frontend provides a simple and interactive web interface where users can:
* View and filter table data.
* Access pre-built analytical views.
* Execute stored procedures via UI buttons.
* Insert or update records without writing SQL.
* Run business calculations and instantly see results.

---

## 🛠 Tech Stack
* **Language:** Python
* **Frontend:** Streamlit
* **Database:** MySQL
* **Logic:** SQL (Views, Stored Procedures, Functions)
* **Data Handling:** Pandas
* **Connector:** `mysql-connector-python`

---

## 🔍 Key Features
* **No-SQL interface** for business users.
* **Modular separation** of database logic and frontend logic.
* **Stored procedure-driven operations** for safe updates.
* **View-based reporting system** for quick insights.
* **Inventory & Supply Chain simulation.**
* **Clean project structure** suitable for production-style systems.

---

## 📊 Business Impact Simulation
This project simulates how real businesses:
* Maintain inventory integrity through database constraints.
* Enforce business rules at the database level rather than the app level.
* Provide controlled data access to stakeholders.
* Separate backend logic from frontend presentation.

---

## ⚙️ Setup Instructions
1. Database Setup
Create a new MySQL database.

3. Install Dependencies
```bash
pip install -r requirements.txt
```
4. Run the Application
```bash
streamlit run app/main.py
```
