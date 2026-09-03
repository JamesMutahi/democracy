# democracy

A true democracy means that the power lies solely with the people and that the people alone are entitled to it and thus, parties, rulers, the powerful, the hierarchical and other rulers are not allowed to decide on any matters independently or even to make propaganda for their ideas.

<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/8a171fed-1e62-43f9-82f7-85a1061df0aa" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/6c0cbe79-bac6-471f-87f8-c6d4191aedf7" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/6f94e5a0-783f-44ef-8b35-5da9b5e8ed84" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/688cbd1a-ffe4-4ee3-b8ce-af9429405d3c" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/b15cb2b6-7477-4fd3-a628-ed7ae6dd0571" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/abb732a3-0d7c-45ae-aeee-c41f29f90be1" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/7030cff7-b179-43d9-a4a4-4b5c1b8077a6" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/283adf75-4cd0-4dd9-af1d-03332bce8f13" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/eda87443-2717-4fe0-bd22-65967a80f1b2" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/8a4863f4-cc56-4264-b61f-71bfff6ff330" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/8b5a5856-c7a1-4bfd-b6cc-dc024f372ede" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/4f914d57-ca30-4dcc-8926-1708d395c04a" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/08f9303f-9783-4235-9d1d-2713fbb54556" />



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
