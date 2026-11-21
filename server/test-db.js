const pool = require("./db");

async function testConnection() {
  try {
    const result = await pool.query("SELECT * FROM applications");
    console.log(result.rows);
  } catch (err) {
    console.error("Database connection failed:", err.message);
  } finally {
    await pool.end();
  }
}

testConnection();
