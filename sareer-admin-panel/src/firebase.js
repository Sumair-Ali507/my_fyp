
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

const firebaseConfig = {
  apiKey: "AIzaSyAasaWRjkxUPhlnqiK-lb3t1LVSil8P5Ko",
  authDomain: "sareer-publications-80391.firebaseapp.com",
  databaseURL: "https://sareer-publications-80391-default-rtdb.asia-southeast1.firebasedatabase.app",
  projectId: "sareer-publications-80391",
  storageBucket: "sareer-publications-80391.firebasestorage.app",
  messagingSenderId: "437893918475",
  appId: "1:437893918475:web:375b656d1586d562d6bc0e",
  measurementId: "G-51S5JHHR1Q"
};


const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);