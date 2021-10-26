import 'package:flutter/material.dart';

import 'loginresult.dart';
// ignore: library_prefixes
import '../utils/constants.dart' as Constants;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _loginError = "";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onFocusChange() {
    // This call to handle text field focus changed event
    _setErrorMessage("");
  }

  void _setErrorMessage(String errorMessage) {
    setState(() {
      _loginError = errorMessage;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  bool _isInputValid() {
    // This call to validate the input
    // If the input is qualified a True will be returned, or False otherwise
    return _usernameController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }

  void _doLogin(BuildContext context) {
    // This call to send request login to BE if the input is good

    _setErrorMessage("");

    if (_isInputValid()) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const LoginResult()));
    } else {
      _setErrorMessage(Constants.LOGIN_ERROR_EMPTY);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    TextStyle style = const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final usernameField = TextFormField(
      controller: _usernameController,
      obscureText: false,
      style: style,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          hintText: Constants.USERNAME_HINT),
      onTap: _onFocusChange,
    );

    final passwordField = TextFormField(
      controller: _passwordController,
      obscureText: true,
      style: style,
      decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          hintText: Constants.PASSWORD_HINT),
      onTap: _onFocusChange,
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      color: Colors.green,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
        onPressed: () => _doLogin(context),
        child: Text(Constants.LOGIN,
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: _loginError.isNotEmpty,
                child: Text(
                  _loginError,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.red,
                  ),
                ),
              ),
              usernameField,
              const SizedBox(height: 10.0),
              passwordField,
              const SizedBox(height: 20.0),
              loginButton,
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
