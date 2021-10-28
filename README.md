# login_app

A sample Flutter project.

## Getting Started

This project is a sample to introduce a simple login flow.
User will provide username and password and be directed to login result page by hitting `Login` button.
Login Result Page will display user data which is returned from Server.

In order to have a full flow of demo, please check out server code (.NET API) and run from your local:
https://github.com/shinboiz/net-api-login-server

![Screen Shot 2021-10-28 at 12 56 50 AM](https://user-images.githubusercontent.com/82937001/139123970-cecf5892-2cd3-49ea-8ecc-f10aa567b4b1.jpg)

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to run
- Copy the source code into the directory where `flutter` sdk directory is been
- Open the source code with Visual Studio Code
- You might be asked to install missing assets from Dart, please allow to proceed

## Scenario of Failed Login
- When user put "failure" in `user name` field, regardless non-null password.
- Or either username or password is blank

## Issues Encountered and Fixed during Development
- Handshake issue, CORS issue, Incompatible test version
- If you're facing with the issue of version incompatible from test framework, you can try to execure following commands:
    `flutter channel dev`
    `flutter upgrade`

## Technics
- MVC, Singleton, Class/Method Template 
- Async task, Callback,
- API request, JSON serialzer
- Unit Test, Mockito
- Dart
