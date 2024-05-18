CREATE TABLE public.passenger_info
(
    id INT PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    customer_type VARCHAR(20),
    type_of_travel VARCHAR(20)
);

CREATE TABLE public.flight_experience
(
    id INT REFERENCES Passenger_Info(id),
    class VARCHAR(20),
    flight_distance INT,
    departure_delay INT,
    arrival_delay INT,
    departure_arrival_time_convenience INT,
    ease_of_online_booking INT,
    checkin_service INT,
    online_boarding INT,
    gate_location INT,
    onboard_service INT,
    seat_comfort INT,
    leg_room_service INT,
    cleanliness INT,
    food_and_drink INT,
    inflight_service INT,
    inflight_wifi_service INT,
    in_flight_entertainment INT,
    baggage_handling INT,
    satisfaction TEXT
);
