# Airbnb Database Schema

This project contains a relational database schema for an Airbnb-like platform.  
The schema is normalized up to Third Normal Form (3NF) to avoid redundancy and ensure data integrity.  

## What the Schema Does

- Defines a Users table for guests, hosts, and admins, with secure authentication and role management.  
- Defines a Property table where hosts can list rental properties, including pricing and location details.  
- Defines a Booking table that connects users and properties, enforcing booking periods and statuses.  
- Defines a Payment table to track transactions, including payment method and amount.  
- Defines a Review table that allows users to rate and comment on properties.  
- Defines a Message table for user-to-user communication within the platform.  

## Key Features

- Primary Keys and UUIDs: Every record is uniquely identifiable.  
- Foreign Keys with Cascading Deletes: Maintains referential integrity between related tables.  
- Constraints: Enforces rules such as valid roles, booking statuses, and rating ranges.  
- Timestamps: Tracks creation and update times automatically.  
- Indexes: Improves query performance on frequently accessed fields (e.g., email, property_id, booking_id).  

## Usage

- The schema can be created by running the SQL statements in `schema.sql`.  
- This serves as the foundation for building applications similar to Airbnb, with user accounts, property listings, bookings, payments, reviews, and messaging.  
