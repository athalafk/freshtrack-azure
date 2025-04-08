const fs = require('fs');
const db = require('./config/db'); 

const sql = fs.readFileSync('freshtrack.sql', 'utf8');

db.query(sql, (err, results) => {
  if (err) {
    console.error('❌ Error importing SQL:', err.message);
    process.exit(1);
  }
  console.log('✅ SQL import berhasil!');
  process.exit(0);
});
