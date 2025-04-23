const express = require("express");
const router = express.Router();
const admin = require("firebase-admin");

const db = admin.database();

router.post("/", async (req, res) => {
  const { userId, score } = req.body;
  try {
    await db.ref(scores/${userId}).set(score);
    res.json({ success: true, message: "Score updated!" });
  } catch (error) {
    res.status(500).json({ success: false, error });
  }
});

module.exports = router;