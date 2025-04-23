
const admin = require("firebase-admin");
const fs = require("fs");
const path = require("path");

// Initialize Firebase Admin
const serviceAccount = require("./path-to-your-service-account.json");
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: "your-project-id.appspot.com",
});

const db = admin.firestore();
const bucket = admin.storage().bucket();

// Folder where .mov files are stored locally
const localFolder = "./characters";

// Function to upload a file and store its URL in Firestore
async function uploadCharacter(fileName) {
  const localFilePath = path.join(localFolder, fileName);
  const destination = `characters/${fileName}`;

  // Upload to Firebase Storage
  await bucket.upload(localFilePath, { destination });
  const file = bucket.file(destination);

  // Make file public & get URL
  await file.makePublic();
  const fileUrl = `https://storage.googleapis.com/${bucket.name}/${destination}`;

  // Store in Firestore
  await db.collection("characters").doc(fileName).set({
    name: path.basename(fileName, ".mov"),
    url: fileUrl,
  });

  console.log(`Uploaded ${fileName} - URL: ${fileUrl}`);
}

// Read local folder & upload all .mov files
fs.readdir(localFolder, async (err, files) => {
  if (err) return console.error("Error reading folder:", err);

  const movFiles = files.filter((file) => file.endsWith(".mov"));
  for (const file of movFiles) {
    await uploadCharacter(file);
  }
  console.log("All characters uploaded!");
});


---




  console.log(`Uploaded ${fileName} - URL: ${fileUrl}`);
}

// Read local folder & upload all .mov files
fs.readdir(localFolder, async (err, files) => {
  if (err) return console.error("Error reading folder:", err);

  const movFiles = files.filter((file) => file.endsWith(".mov"));
  for (const file of movFiles) {
    await uploadCharacter(file);
  }
  console.log("All characters uploaded!");
});








