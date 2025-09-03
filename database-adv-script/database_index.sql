Indexes for high-usage columns
-- This is crucial for speeding up joins with the 'property' table,
-- as seen in the ranking query.
CREATE INDEX idx_booking_property_id ON booking (property_id);
-- This helps enforce the unique constraint and makes searching for users by email much faster.
CREATE UNIQUE INDEX idx_user_email ON users (email);
-- This would be beneficial for queries that need to find all properties for a specific host.
CREATE INDEX idx_property_host_id ON property (host_id);
