require('dotenv').config();
const mysql = require('mysql2/promise');

// debugging connection details
console.log("Connecting to MySQL with:");
console.log("Host:", process.env.AZURE_MYSQL_HOST);
console.log("User:", process.env.AZURE_MYSQL_USER);
console.log("Database:", process.env.AZURE_MYSQL_DATABASE);
console.log("Port:", process.env.AZURE_MYSQL_PORT);

const pool = mysql.createPool({
  host: process.env.AZURE_MYSQL_HOST,
  user: process.env.AZURE_MYSQL_USER,
  password: process.env.AZURE_MYSQL_PASSWORD,
  database: process.env.AZURE_MYSQL_DATABASE,
  port: process.env.AZURE_MYSQL_PORT || 3306,
  ssl: {
    rejectUnauthorized: false,
  },

});

pool.getConnection()
  .then(conn => {
    console.log('✅ Connected to MySQL database');
    conn.release();
  })
  .catch(err => {
    console.error('❌ MySQL connection error:', err);
  });

module.exports = pool;
