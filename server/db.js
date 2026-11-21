require("dotenv").config();
const { Pool, types } = require("pg");

// Keep DATE columns as plain text like "2026-11-15"
types.setTypeParser(1082, (value) => value);

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

module.exports = pool;