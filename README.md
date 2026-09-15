# democracy

A true democracy means that the power lies solely with the people and that the people alone are entitled to it and thus, parties, rulers, the powerful, the hierarchical and other rulers are not allowed to decide on any matters independently or even to make propaganda for their ideas.

<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/355d52c4-d23d-4510-83bd-e1b5c5d0b37d" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/6ee4afd2-dd63-41eb-8ef5-6161f945a7e7" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/722653f2-2ea0-418b-92e7-f8d83a4329a6" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/8e1c562a-c5eb-4a8e-b3e5-7c142565f520" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/9e12e78c-45c6-4804-b2b9-e7281c14b17b" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/c9904191-e740-478c-b478-1d63099f92dc" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/ba0b12dc-23b4-4487-9664-48f13c7ffc9c" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/da92015a-6372-46c8-8382-5816e197d582" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/eda87443-2717-4fe0-bd22-65967a80f1b2" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/8a4863f4-cc56-4264-b61f-71bfff6ff330" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/bcec9a43-a645-4140-b3bf-d58af893d024" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/ca25b4ff-5060-45a5-a43a-541220144eb6" />
<img width="352" height="743" alt="Image" src="https://github.com/user-attachments/assets/63598613-74f4-48cc-8915-858c1b8b9c62" />



```
--dart-define-from-file=env.json --web-port=5000

{
  "BASE_URL":"http://100.100.100.100:8000/",
  "WEBSOCKET_URL":"ws://100.100.100.100:8000/ws/",

  "LINK_URL":"LINK_URL",

  "SENTRY_DSN":"SENTRY_DSN",

  "AGORA_ID":"AGORA_ID",

  "FAKE_USERNAME":"FAKE_USERNAME",
  "FAKE_PASSWORD":"FAKE_PASSWORD"
}
```


```
flutter build appbundle --no-tree-shake-icons --dart-define-from-file=env.json
flutter build apk --no-tree-shake-icons --dart-define-from-file=env.json
flutter install
```
