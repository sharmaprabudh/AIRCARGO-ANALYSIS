# ✈️ AirCargo Analysis (SQL Project)

**Author:** Prabudh Sharma  
🔗 **GitHub Profile:** https://github.com/sharmaprabudh  
📂 **Project Repository:** AIRCARGO-ANALYSIS  
💼 **LinkedIn:** https://www.linkedin.com/in/prabudh-sharma-680235205/

---

## 📌 Project Overview
This project focuses on **SQL-based AirCargo data analysis and optimization** to improve customer experience and airline operational efficiency.

The system analyzes:
- Passenger travel data
- Ticket sales
- Revenue insights
- Business class performance
- Customer booking behavior
- Route efficiency
- Aircraft utilization
- Query optimization

The project uses **advanced SQL concepts** such as joins, subqueries, window functions, indexing, execution plans, views, rollup, and stored procedures.

---

## 🎯 Objectives
- Identify regular airline customers
- Analyze busiest routes
- Optimize aircraft allocation
- Generate ticket sales reports
- Improve SQL query performance
- Build reusable database objects
- Strengthen database design with ER diagrams

---

## 🗂️ Dataset Tables
The database contains:

### 👤 Customer
- `customer_id`
- `first_name`
- `last_name`
- `date_of_birth`
- `gender`

### 🛫 passengers_on_flights
- `aircraft_id`
- `route_id`
- `customer_id`
- `depart`
- `arrival`
- `seat_num`
- `class_id`
- `travel_date`
- `flight_num`

### 🎟️ ticket_details
- `p_date`
- `customer_id`
- `aircraft_id`
- `class_id`
- `no_of_tickets`
- `a_code`
- `price_per_ticket`
- `brand`

### 🌍 routes
- `route_id`
- `flight_num`
- `origin_airport`
- `destination_airport`
- `aircraft_id`
- `distance_miles`

---

## 🏗️ SQL Concepts Implemented

### ✅ Data Import & Schema Design
- Created `AirCargo` database
- Imported CSV datasets
- Designed **ER Diagram**
- Established table relationships

---

### ✅ Passenger & Route Analysis
- Passengers traveling on routes `01–25`
- Route ID-based filtering
- Busiest route analysis
- Average passengers per aircraft

---

### ✅ Revenue Analysis
- Business class passenger count
- Total business class revenue
- Revenue threshold check using `IF`
- Total customer ticket spend
- Total price paid by each customer

---

### ✅ Customer Insights
- Full customer names using concatenation
- Registered customers who booked tickets
- Emirates brand customer filtering
- Economy Plus travelers using subquery

---

### ✅ Advanced SQL Features
Implemented:
- `JOIN`
- `SUBQUERY`
- `GROUP BY`
- `ROLLUP`
- `WINDOW FUNCTIONS`
- `VIEWS`
- `STORED PROCEDURES`
- `INDEX`
- `EXPLAIN PLAN`
- `IF`
- `USER ACCESS MANAGEMENT`

---

## ⚡ Performance Optimization
Improved query speed by:
- Creating index on `route_id`
- Query tuning for route-specific lookups
- Execution plan analysis
- Faster passenger retrieval

---

## 🔄 SQL Workflow
```text
Import CSV Data
      ↓
Create ER Diagram
      ↓
Run Business Queries
      ↓
Customer Insights
      ↓
Revenue Analysis
      ↓
Performance Tuning
      ↓
Stored Procedures + Views
      ↓
Final Airline Reports
```

---

## 📊 Key Business Insights
- Frequent travelers identified
- Business class revenue calculated
- Route-based passenger demand analyzed
- Customer booking behavior tracked
- Airline brand-specific customer filtering
- Revenue threshold validation
- Distance-based route summaries

---

## 🧰 Tech Stack
- SQL
- MySQL / PostgreSQL
- ER Diagram
- CSV Import
- Indexing
- Views
- Stored Procedures
- Window Functions
- Query Optimization

---

## 🚀 Business Value
- Better customer targeting
- Route optimization
- Revenue visibility
- Faster query performance
- Improved aircraft utilization
- Better operational decision-making
- Strong airline data analytics

---

## 📈 Future Enhancements
- Connect with Power BI dashboards
- Add booking trend analysis
- Predict busiest routes
- Customer segmentation model
- Real-time airline analytics
- Integrate with Python reporting

---

## 👨‍💻 Author
**Prabudh Sharma**  
🔗 GitHub: https://github.com/sharmaprabudh  
📂 Repository: AIRCARGO-ANALYSIS  
💼 LinkedIn: https://www.linkedin.com/in/prabudh-sharma-680235205/

---

## ⭐ Project Outcome
Successfully built a **production-style SQL airline analytics project** using advanced SQL techniques for customer insights, route analysis, revenue reporting, and performance optimization.
