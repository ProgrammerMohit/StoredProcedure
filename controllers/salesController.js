const db = require("../db");

exports.getSalesSummary = async (req, res) => {
  try {
    const [rows] = await db.execute("CALL GetSalesSummary()");
    res.json(rows);
  } catch (error) {
    console.error("Error fetching sales summary:", error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

// Get Monthly Sales Data
exports.getMonthlySales = async (req, res) => {
  try {
    const [rows] = await db.execute("CALL GetMonthlySales()");
    res.json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Database error" });
  }
};

// Get Location-wise Sales Data
exports.getLocationWiseSales = async (req, res) => {
  try {
    const [rows] = await db.execute("CALL GetLocationWiseSales()");
    res.json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Database error" });
  }
};

// Get Customer-wise Sales Data
exports.getCustomerWiseSales = async (req, res) => {
  try {
    const [rows] = await db.execute("CALL GetCustomerWiseSales()");
    res.json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Database error" });
  }
};
