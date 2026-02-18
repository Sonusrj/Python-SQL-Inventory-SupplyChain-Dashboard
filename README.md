# Streamlit SQL Inventory Dashboard

A Python-driven web application that allows non-technical users to interact with a MySQL database without writing SQL queries.

## 🚀 Project Overview

This application provides a simple web interface built using Streamlit that enables users to:

- View inventory data
- Perform stock updates (sales/restock)
- Analyze recent sales and restock value
- Access pre-defined reports and summaries

The system is designed for managers or team leads who need database interaction without SQL knowledge.

## 🛠 Tech Stack

- Python
- Streamlit
- MySQL
- SQL (Views & Stored Procedures)


## 🗄 Database Setup

1. Create MySQL database.
2. Run schema.sql
3. Run procedures.sql
4. Run views.sql
5. Import sample_data.sql

## ▶ How to Run

```bash
pip install -r requirements.txt
streamlit run app/main.py
