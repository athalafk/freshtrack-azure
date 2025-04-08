const fs = require('fs');
const db = require('./config/db');

const sql = fs.readFileSync('freshtrack.sql', 'utf8');

async function importSQL() {
  try {
    await db.query(sql);
    console.log('✅ SQL import berhasil!');
  } catch (err) {
    console.error('❌ Error importing SQL:', err.message);
    process.exit(1);
  } finally {
    await db.end();
    process.exit(0);
  }
}

importSQL();
