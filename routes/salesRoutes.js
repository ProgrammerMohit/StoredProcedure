const express = require("express");
const router = express.Router();
const salesController = require("../controllers/salesController");

// API Endpoints
router.get("/sales-summary", salesController.getSalesSummary);
router.get("/monthly", salesController.getMonthlySales);
router.get("/location", salesController.getLocationWiseSales);
router.get("/customer", salesController.getCustomerWiseSales);

module.exports = router;
