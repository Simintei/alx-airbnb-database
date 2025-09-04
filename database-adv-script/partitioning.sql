--Assume the Booking table is large and query performance is slow. Implement partitioning on the Booking table based on the start_date column.

-- Step 1: Create the main partitioned table
-- This table acts as a parent and does not contain any data itself.
-- We use a RANGE partition on the 'start_date' column.
CREATE TABLE booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(20) CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
PARTITION BY RANGE (start_date);
-- Partition for 2023 bookings
-- Each partition handles a specific date range.
CREATE TABLE booking_2023 PARTITION OF booking
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Partition for 2024 bookings
CREATE TABLE booking_2024 PARTITION OF booking
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Default partition (optional) for any future/old dates
CREATE TABLE booking_default PARTITION OF booking
DEFAULT;
-- Common indexes for query optimization
CREATE INDEX idx_booking_2023_property ON booking_2023(property_id);
CREATE INDEX idx_booking_2023_user ON booking_2023(user_id);

CREATE INDEX idx_booking_2024_property ON booking_2024(property_id);
CREATE INDEX idx_booking_2024_user ON booking_2024(user_id);
