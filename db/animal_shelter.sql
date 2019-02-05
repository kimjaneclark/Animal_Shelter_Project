DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  address VARCHAR(255),
  contact_num VARCHAR(255)
);

CREATE TABLE animals(
  id SERIAL8 primary key,
  name VARCHAR(255),
  type VARCHAR(255),
  entry_date DATE,
  status VARCHAR(255) not null,
  owner_id INT8 references owners(id) ON DELETE SET NULL
);
