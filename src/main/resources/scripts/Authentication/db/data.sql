-- Level 1: Parameterized login with a rotated BCrypt credential
INSERT INTO auth_users VALUES (1, 'admin_sqli', '$2y$12$PKD/mq88dHD9PkMU4.w3LeswGDJBkOZb2viAoEYLfdwLpILgdzxZ6', NULL, 'BCRYPT', 1, 'admin_sqli@example.com', 'ADMIN');

-- Level 2: BCrypt credential; login attempts do not log passwords
INSERT INTO auth_users VALUES (2, 'admin_logs', '$2y$12$sdgvxyIsX8rjK7vgeYXiwearsPWjT00ez93a31AreFR/zIDQJhh62', NULL, 'BCRYPT', 2, 'admin_logs@example.com', 'ADMIN');

-- Level 3: Rotated BCrypt credential; no plaintext storage
INSERT INTO auth_users VALUES (3, 'admin_plain', '$2y$12$UF2wGuQvfe6la7/h4iL15Oq7aWpNi66EF3S8uqxulu2aFMGcqtaAG', NULL, 'BCRYPT', 3, 'admin_plain@example.com', 'ADMIN');

-- Level 4: MD5 Hashing (f2C@9tYk*1hP)
INSERT INTO auth_users VALUES (4, 'admin_md5', '0168b6037606df265be7f1f5d9c0e7fe', NULL, 'MD5', 4, 'admin_md5@example.com', 'ADMIN');

-- Level 5: SHA1 Hashing (x5B&3gHq+7vS)
INSERT INTO auth_users VALUES (5, 'admin_sha1', '632e10860bd26278451d3f89d1c46f180e5623e0', NULL, 'SHA1', 5, 'admin_sha1@example.com', 'ADMIN');

-- Level 6: SHA-256 (No Salt) (m8D!4kLr#2jZ)
INSERT INTO auth_users VALUES (6, 'admin_sha256', '8b8eca84f7e2b04f531749f999c3bf9e3f045bab78f4c8a451fa70929b3c3946', NULL, 'SHA256', 6, 'admin_sha256@example.com', 'ADMIN');

-- Level 7: Rotated BCrypt credential and generic login failure
INSERT INTO auth_users VALUES (7, 'admin_enum', '$2y$12$CC6f6/22kOsqzUVeTP2HO.5fqNtD9OJi55m6M983LrL7IPj0K/W/a', NULL, 'BCRYPT', 7, 'admin_enum@example.com', 'ADMIN');

-- Level 8: Rotated high-entropy BCrypt credential
INSERT INTO auth_users VALUES (8, 'admin_weak', '$2y$12$qVdjbC6s5y3EabDJHObtL.Ve/LcKVhoTeC6jvWG0HAQ71Oul.uYSK', NULL, 'BCRYPT', 8, 'admin_weak@example.com', 'ADMIN');

-- Level 9: Secure (Bcrypt + Generic Error) (9fG#2hJk*LmN!8qR)
-- Bcrypt hash for '9fG#2hJk*LmN!8qR'
INSERT INTO auth_users VALUES (9, 'admin_secure', '$2a$10$1WiFUNqUY/vHTzR2QtuMQuzCLK3aZEdjEUpqS4msXOevaCz7Wobe.', NULL, 'BCRYPT', 9, 'admin_secure@example.com', 'ADMIN');

-- Level 10: Rotated high-entropy BCrypt credential at cost 12
INSERT INTO auth_users VALUES (10, 'admin_lowcost', '$2y$12$VUyDcqnNEbTc0BDAY0ThguyBWMq2wKNEBPb25lneMJTJI9bAInD5e', NULL, 'BCRYPT', 10, 'admin_lowcost@example.com', 'ADMIN');
