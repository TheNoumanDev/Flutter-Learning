import 'package:flutter/material.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      navigatorObservers: [observer],
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatelessWidget {
  void button2(String name, String color) {
    var params = <String, dynamic>{
      'button_name': name,
      'button_color': color,
    };
    MyApp.analytics.logEvent(
      name: 'button_pressed1',
      parameters: params,
    );
  }

  @override
  Widget build(BuildContext context) {
    MyApp.analytics
        .logEvent(name: 'screen_view', parameters: {'screen_name': 'MyScreen'});
    return Scaffold(
      appBar: AppBar(
        title: Text('My Screen'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsetsDirectional.only(top: 350),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  var params = <String, dynamic>{
                    'open_time': DateTime.now().toIso8601String(),
                  };
                  MyApp.analytics
                      .logEvent(name: 'app_open_time', parameters: params);
                },
                child: Text('Button 1'),
              ),
              ElevatedButton(
                onPressed: () {
                  button2('button2', 'blue');
                },
                child: Text('Button 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
