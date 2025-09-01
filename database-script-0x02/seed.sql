-- =========================
-- SEED DATA FOR USERS
-- =========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Mary', 'Karanja', 'mary@example.com', 'hashed_pw_123', '+2547234561', 'guest'),
  ('22222222-2222-2222-2222-222222222222', 'John', 'Doe', 'john@example.com', 'hashed_pw_456', '+2547123467', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw_789', '+254732899200', 'admin');

-- =========================
-- SEED DATA FOR PROPERTY
-- =========================
INSERT INTO property (property_id, host_id, name, description, location, price_per_night)
VALUES
  ('44444444-4444-4444-4444-444444444444', '22222222-2222-2222-2222-222222222222', 'Beach House', 'A lovely beachside house.', 'Mombasa, Kenya', 120.00),
  ('55555555-5555-5555-5555-555555555555', '22222222-2222-2222-2222-222222222222', 'City Apartment', 'Modern apartment in Nairobi.', 'Nairobi, Kenya', 80.00),
  ('66666666-6666-6666-6666-666666666666', '22222222-2222-2222-2222-222222222222', 'Safari Lodge', 'Lodge near Maasai Mara.', 'Narok, Kenya', 200.00);

-- =========================
-- SEED DATA FOR BOOKING
-- =========================
INSERT INTO booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
  ('77777777-7777-7777-7777-777777777777', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', '2025-09-01', '2025-09-05', 'confirmed'),
  ('88888888-8888-8888-8888-888888888888', '55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', '2025-10-10', '2025-10-15', 'pending'),
  ('99999999-9999-9999-9999-999999999999', '66666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', '2025-11-01', '2025-11-03', 'canceled');

-- =========================
-- SEED DATA FOR PAYMENT
-- =========================
INSERT INTO payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '77777777-7777-7777-7777-777777777777', 480.00, 'credit_card'),
  ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '88888888-8888-8888-8888-888888888888', 400.00, 'paypal'),
  ('cccccccc-cccc-cccc-cccc-cccccccccccc', '99999999-9999-9999-9999-999999999999', 600.00, 'stripe');

-- =========================
-- SEED DATA FOR REVIEW
-- =========================
INSERT INTO review (review_id, property_id, user_id, rating, comment)
VALUES
  ('dddddddd-dddd-dddd-dddd-dddddddddddd', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 5, 'Amazing stay, highly recommend!'),
  ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '55555555-5555-5555-5555-555555555555', '11111111-1111-1111-1111-111111111111', 4, 'Very clean and modern.'),
  ('ffffffff-ffff-ffff-ffff-ffffffffffff', '66666666-6666-6666-6666-666666666666', '11111111-1111-1111-1111-111111111111', 3, 'Good location but a bit pricey.');

-- =========================
-- SEED DATA FOR MESSAGE
-- =========================
INSERT INTO message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('11111111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hello, is the Beach House available?'),
  ('22222222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available for your dates.'),
  ('33333333-cccc-cccc-cccc-cccccccccccc', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Great, I will book it now.');
