const db = require('./db');

const BelegungService = {
  getAll: async (req, res) => {
    const result = await db.query(
      'SELECT * FROM `allocations` INNER JOIN room ON roomFk = room.id',
      []
    );
    res.send(result);
  },
};

module.exports = BelegungService;
