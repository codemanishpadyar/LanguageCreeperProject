const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const { executeCode } = require("./codeExecution");

const app = express();
const PORT = 5000;

app.use(cors());
app.use(bodyParser.json());

app.get("/", (req, res) => {
    res.send("Server is running...");
});

app.post("/run", async (req, res) => {
    const { language, code } = req.body;

    if (!language || !code) {
        return res.status(400).json({ error: "Missing language or code" });
    }

    try {
        const output = await executeCode(language, code);
        res.json({ output });
    } catch (error) {
        res.json({ error: error.toString() });
    }
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running on http://192.168.0.1:${PORT}`);
});

