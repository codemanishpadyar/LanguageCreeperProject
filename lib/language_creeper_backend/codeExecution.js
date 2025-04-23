const { exec } = require("child_process");
const fs = require("fs");
const path = require("path");

function getFileExtension(language) {
    const extensions = { "Python": "py", "C++": "cpp", "JavaScript": "js", "Java": "java" };
    return extensions[language] || "txt";
}

async function executeCode(language, code) {
    const fileExtension = getFileExtension(language);
    const fileName = `temp.${fileExtension}`;
    fs.writeFileSync(fileName, code);

    let command;
    switch (language) {
        case "Python":
            command = `python ${fileName}`;
            break;
        case "C++":
            command = `g++ ${fileName} -o temp && ./temp`;
            break;
        case "JavaScript":
            command = `node ${fileName}`;
            break;
        case "Java":
            command = `javac ${fileName} && java Main`;
            break;
        default:
            return "Unsupported language";
    }

    return new Promise((resolve, reject) => {
        exec(command, (error, stdout, stderr) => {
            fs.unlinkSync(fileName); // Clean up file
            if (error) reject(stderr || "Execution error");
            else resolve(stdout || "No output");
        });
    });
}

module.exports = { executeCode };
