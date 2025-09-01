# Database Normalization to Third Normal Form (3NF)
1. 1NF (First Normal Form)  
   - No repeating groups or arrays.  
   - Every attribute is atomic (no multiple values in one field).  

2. 2NF (Second Normal Form)  
   - Must be in 1NF.  
   - No partial dependency: non-key attributes must depend on the whole key (important for composite keys).  

3. 3NF (Third Normal Form)  
   - Must be in 2NF.  
   - No transitive dependency: non-key attributes must depend only on the primary key, not on other non-key attributes.
   - 
## Checking the Schema

### User
- Primary Key: user_id  
- Other attributes (first_name, last_name, email, password_hash, phone_number, role, created_at) are atomic.  
- email has a unique constraint, good for avoiding duplicates.  
- No partial dependency (single primary key).  
- No transitive dependency (role is stored as ENUM, not derived).  
->Already in 3NF.  

### Property
- Primary Key: property_id  
- host_id → Foreign Key referencing User(user_id)  
- Attributes: name, description, location, pricepernight, created_at, updated_at are atomic.  
- No repeating groups.  
- host_id only depends on property_id, not on other non-key attributes.  
->In 3NF.  

### Booking
- Primary Key: booking_id  
- property_id and user_id → Foreign Keys.  
- Attributes: start_date, end_date, status, created_at are atomic.  
- Issue: total_price  
   - This can be derived as (end_date - start_date) × pricepernight.  
   - Keeping it introduces a transitive dependency on Property.pricepernight.  
   - To strictly meet 3NF, remove total_price and calculate it when needed.  
Result: After removing derived data, in 3NF.  

### Payment
- Primary Key: payment_id  
- Foreign Key → booking_id  
- Attributes: amount, payment_date, payment_method are atomic.  
- amount could be argued as derived from Booking.total_price.  
   - But since payments may be partial or multiple per booking, it makes sense to keep it.  
Result: In 3NF.  

### Review
- Primary Key: review_id  
- Foreign Keys → property_id, user_id  
- Attributes: rating, comment, created_at are atomic.  
- Rating has a check constraint (1–5), which is valid.  
Result: In 3NF.  

### Message
- Primary Key: message_id  
- Foreign Keys → sender_id, recipient_id  
- Attributes: message_body, sent_at are atomic.  
Result: In 3NF.  

## Summary of Adjustments for 3NF
1. User → No changes.  
2. Property → No changes.  
3. Booking → Remove total_price (derived attribute).  
4. Payment → Keep amount (since it’s not always equal to booking total).  
5. Review → No changes.  
6. Message → No changes.  

Final Result:  
After these adjustments, the schema is fully in Third Normal Form (3NF).  
If performance is a concern, total_price can be denormalized (kept in Booking) for faster queries, but that is a trade-off.  
