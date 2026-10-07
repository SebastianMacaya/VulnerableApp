-- Table is seeded by CryptographicFailuresSeeder in vulnerability.service.cryptographicFailures

-- Keep existing rows so CryptographicFailuresSeeder can migrate legacy values to BCrypt.
CREATE TABLE IF NOT EXISTS cryptographic_failures_vault (
    level INT PRIMARY KEY ,
    password VARCHAR(500),
    algorithm VARCHAR(50)
);

-- Application user has full access (for functional purposes)
GRANT ALL ON cryptographic_failures_vault TO application;

-- Remove the former public account when upgrading an existing database. Keeping it would expose
-- password hashes for offline guessing even after the vault switches to adaptive hashing.
DROP USER IF EXISTS cryptographic_failures_user;
