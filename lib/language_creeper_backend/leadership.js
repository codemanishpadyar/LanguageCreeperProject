const express = require("express");
const router = express.Router();
const admin = require("firebase-admin");

const db = admin.database();

router.get("/", async (req, res) => {
  try {
    const snapshot = await db.ref("scores").orderByValue().limitToLast(10).once("value");
    res.json(snapshot.val());
  } catch (error) {
    res.status(500).json({ error });
  }
});

module.exports = router;