# login_app

A sample Flutter project.

## Getting Started

This project is a sample to introduce a simple login flow
User will provide username and password and be directed to login result page by hitting `Login` button
Login Result Page will display user data which is returned from Server.

In order to have a full flow of demo, please check out server code (.NET API) and run from your local:
https://github.com/shinboiz/net-api-login-server

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Scenario of Failed Login
- When user put "failure" in `user name` field, regardless non-null password
- Or either username or password is blank

## Issues Encountered:
- Handshake issue, CORS issue, Incompatible test version
- If you're facing with the issue of version incompatible from test framework, you can try to execure following commands:
    `flutter channel dev`
    `flutter upgrade`

## Technics
- MVC, Singleton, Template Class/Method
- Async task, Callback,
- API request, JSON serialzer
- Unit Test, Mockito