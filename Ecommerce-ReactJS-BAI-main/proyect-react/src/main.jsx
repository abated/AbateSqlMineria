
import React from 'react';
import ReactDOM from 'react-dom/client'
import App from './App';
import './index.css';
import './app.css';

// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAqCsJmNr2_xmOOEVp8fyXxR3GiWiOi9Fs",
  authDomain: "baires-instruments.firebaseapp.com",
  projectId: "baires-instruments",
  storageBucket: "baires-instruments.appspot.com",
  messagingSenderId: "106606305701",
  appId: "1:106606305701:web:accf4f74bbf000721e884c"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

ReactDOM.createRoot(document.getElementById('root')).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
