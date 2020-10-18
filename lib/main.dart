import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_provider_lesson_one/core/models/user.dart';
import 'package:flutter_provider_lesson_one/core/services/authentication_service.dart';

//
import 'package:flutter_provider_lesson_one/locator.dart';
import 'package:flutter_provider_lesson_one/ui/router.dart';
import 'package:flutter_provider_lesson_one/ui/views/login_view.dart';
import 'package:provider/provider.dart';

/// https://www.filledstacks.com/post/flutter-architecture-my-provider-implementation-guide/
/// As mentioned we will not be providing a bunch of models and services at the beginning of our app at global context scale

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Stream<String> _stream = NumberClass().stream.map((count) => count.toString());

    return StreamProvider<User>(
      initialData: User.initial(),
      create: (_) => locator<AuthenticationService>().userController.stream,
      // create: (_) => _stream,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        initialRoute: '/login',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

// class NumberClass {
//   NumberClass() {
//     Future.delayed(Duration(milliseconds: 500), () {
//       _controller.sink.add(_count);
//     });
//   }
//
//   int _count = 1;
//
//   // ignore: close_sinks
//   final StreamController _controller = StreamController<int>();
//
//   Stream<int> get stream => _controller.stream;
// }
