# Database Seed Data

This seed data reflects a simplified Airbnb-clone-project system with users, properties, bookings, payments, reviews, and messages.

## Seed Data Overview
Users
- Three sample users are included:
  - A **guest** who makes bookings.
  - A **host** who owns properties.
  - An **admin** for system management.

Properties
- Three properties are created and linked to the host:
  - A **Beach House** in Mombasa.
  - A **City Apartment** in Nairobi.
  - A **Safari Lodge** in Narok.

Bookings
- Three bookings are added for the guest:
  - A **confirmed** booking for the Beach House.
  - A **pending** booking for the City Apartment.
  - A **canceled** booking for the Safari Lodge.

Payments
- Three payments are recorded, each linked to a booking:
  - One made via **credit card**.
  - One made via **PayPal**.
  - One made via **Stripe**.

Reviews
- Three reviews are created by the guest:
  - A **5-star positive review** for the Beach House.
  - A **4-star review** for the City Apartment.
  - A **3-star review** for the Safari Lodge.

Messages
- Three sample messages exchanged between the guest and host:
  - The guest asking about property availability.
  - The host confirming availability.
  - The guest confirming their booking.

Purpose
- Provides ready-to-use **test data** for queries and joins.  
- Ensures all **relationships** between tables (users, properties, bookings, etc.) are functional.  
-Helps developers and testers simulate real-world usage.
-Makes it easier to demo your project without manually typing everything.
