CREATE TABLE IF NOT EXISTS user_data(
    user_data_id BIGSERIAL PRIMARY KEY,
    email_address TEXT,
    password_hash CHAR(33),
    phone_number CHAR(11),
    modification_date DATE
);

CREATE TABLE IF NOT EXISTS caretaker(
    caretaker_id BIGSERIAL PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS help_group(
    help_group_id BIGSERIAL NOT NULL PRIMARY KEY,
    poverty_level INT,
    help_group_caretaker_ref_id BIGINT REFERENCES caretaker(caretaker_id)

);

CREATE TABLE IF NOT EXISTS product(
    product_id BIGSERIAL PRIMARY KEY,
    kind VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS needs(
    need_id BIGSERIAL PRIMARY KEY,
    count INT NOT NULL,
    needs_help_group_ref BIGINT REFERENCES help_group(help_group_id),
    needs_products_ref BIGINT REFERENCES product(product_id)

);

CREATE TABLE IF NOT EXISTS donor(
    donor_id BIGSERIAL NOT NULL PRIMARY KEY,
    pack_count INT NOT NULL,
    donations_sum money NOT NULL,
    points INT,
    donor_help_group_ref_id BIGINT REFERENCES help_group(help_group_id)
);

CREATE TABLE IF NOT EXISTS person(
    person_id BIGSERIAL PRIMARY KEY,
    pesel CHAR(11) NOT NULL,
    forename TEXT NOT NULL,
    surname TEXT NOT NULL,
    address TEXT NOT NULL,
    birth DATE NOT NULL,
    person_donor_ref_id BIGINT REFERENCES donor(donor_id),
    person_help_group_ref_id BIGINT REFERENCES help_group(help_group_id),
    person_caretaker_ref_id BIGINT REFERENCES caretaker(caretaker_id),
    person_user_data_ref_id BIGINT REFERENCES user_data(user_data_id)
);