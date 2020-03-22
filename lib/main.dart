import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( // Explicitly stating that the stream is of User objects
      value: AuthService().user, // This is the stream that we are listening to
      child: MaterialApp( // All widgets nested can now access the data provided by the stream
        home: Wrapper(),
      ),
    );
  }
}
