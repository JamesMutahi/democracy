# democracy

A true democracy means that the power lies solely with the people and that the people alone are entitled to it and thus, parties, rulers, the powerful, the hierarchical and other rulers are not allowed to decide on any matters independently or even to make propaganda for their ideas.

<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/a15cef59-8501-4dd0-be23-66b65a29471f" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/805315fe-4aa3-45be-b07a-caa2623046fb" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/3f8448cb-7156-474c-b8f2-fd9a74665eaa" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/1cc9b395-bef7-4d25-b0e9-d519855fab6e" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/768b6876-50b2-4518-ac91-d2593f2a0149" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/37d3bda9-1760-49c6-b9ba-666a3a89175f" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/f3c728cb-d050-445e-9c71-b986b2f6354b" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/da1363a9-47fb-4600-89f4-4353b1a16f94" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/eda87443-2717-4fe0-bd22-65967a80f1b2" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/8a4863f4-cc56-4264-b61f-71bfff6ff330" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/f3c6e890-e9b1-43ec-8b2c-8532697f678d" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/18d3c892-4060-4979-9aef-d0eb92b0d4b4" />
<img width="320" height="714" alt="Image" src="https://github.com/user-attachments/assets/26e12fcf-d70e-4415-888f-9c4e1bf7d3d4" />



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
