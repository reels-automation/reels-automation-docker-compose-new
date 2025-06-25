db = db.getSiblingDB('reels_automation');

if (!db.getCollectionNames().includes('temas')) {
  db.createCollection('temas');
}

if (!db.getCollectionNames().includes('videos')) {
  db.createCollection('videos');
}
