const admin = require("firebase-admin");
const fs = require("fs");

// Firebase Admin SDK key
const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  databaseURL: "https://your-project-id.firebaseio.com"
});

const db = admin.firestore();

async function fetchAndSaveCollection(collectionName) {
  const snapshot = await db.collection(collectionName).get();
  let data = [];

  snapshot.forEach(doc => {
    data.push({ id: doc.id, ...doc.data() });
  });

  fs.writeFileSync(`${collectionName}.json`, JSON.stringify(data, null, 2));
  console.log(`✅ ${collectionName}.json saved!`);
}

// Change 'Java_questions' to your Firestore collection name
fetchAndSaveCollection("Java_questions");
fetchAndSaveCollection("cpp_questions");
fetchAndSaveCollection("python_questions");
fetchAndSaveCollection("c_questions");
fetchAndSaveCollection("html_questions");
fetchAndSaveCollection("javascript_questions");
