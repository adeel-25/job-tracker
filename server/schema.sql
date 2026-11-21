CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  password_hash TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE applications (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  company VARCHAR(255) NOT NULL,
  role VARCHAR(255) NOT NULL,
  job_link TEXT,
  status VARCHAR(20) NOT NULL DEFAULT 'Saved'
    CHECK (status IN ('Saved', 'Applied', 'Interview', 'Offer', 'Rejected')),
  date_applied DATE,
  notes TEXT,
  created_at TIMESTAMP DEFAULT NOW()
);