importScripts("https://www.gstatic.com/firebasejs/12.17.1/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/12.17.1/firebase-messaging-compat.js");

firebase.initializeApp({
    apiKey: 'AIzaSyC8IyXNuWYaVMo8GmP8tTftd0yaozYNsYg',
    appId: '1:828417705445:web:b7759b8333711f85f15b0c',
    messagingSenderId: '828417705445',
    projectId: 'people-of-kenya',
    authDomain: 'people-of-kenya.firebaseapp.com',
    storageBucket: 'people-of-kenya.firebasestorage.app',
    measurementId: 'G-VENCB729EE',
});

const messaging = firebase.messaging();

// Handle background messages
messaging.onBackgroundMessage((payload) => {
  console.log("[firebase-messaging-sw.js] Received background message", payload);

  const notificationTitle = payload.notification?.title || "New Notification";
  const notificationOptions = {
    body: payload.notification?.body || "",
    icon: "/icons/web-app-manifest-192x192.png",
    data: payload.data,
  };

  self.registration.showNotification(notificationTitle, notificationOptions);
});