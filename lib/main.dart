import 'package:api_check/providers/UserProviders.dart';
import 'package:api_check/screens/general_call.dart';
import 'package:api_check/screens/provider_call.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Userproviders>(
            create: (_) => Userproviders(), child: Provider_Call()),
      ],
      child: MaterialApp(
        title: 'API Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Title(
              color: Colors.blue,
              child: Text(
                "API Call",
                style: TextStyle(fontSize: 18.0),
              )),
        ),
        body: Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => general_call()),
                        );
                      },
                      color: Colors.green,
                      child: Text(
                        'General API Call',
                        style: TextStyle(fontSize: 18.0),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Provider_Call()),
                        );
                      },
                      color: Colors.green,
                      child: Text(
                        'Provider API Call',
                        style: TextStyle(fontSize: 18.0),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
