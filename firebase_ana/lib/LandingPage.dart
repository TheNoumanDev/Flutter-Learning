import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

import 'FirebaseAnalytics_services.dart';

class SemanticsPage extends StatefulWidget {
  @override
  State<SemanticsPage> createState() => _SemanticsPageState();
}

class _SemanticsPageState extends State<SemanticsPage> {
  late FirebaseAnalytics analytics;
  late FirebaseAnalyticsObserver observer;

  void button_event(String name, String color) {
    var params = <String, dynamic>{
      'button_name': name,
      'button_color': color,
    };
    analytics.logEvent(
      name: 'button_pressed1',
      parameters: params,
    );
  }

  @override
  void initState() {
    analytics = FirebaseAnalytics.instance;
    observer = FirebaseAnalyticsObserver(analytics: analytics);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    analytics
        .logEvent(name: 'screen_view', parameters: {'screen_name': 'MyScreen'});
    return Scaffold(
      appBar: AppBar(
        title: const Text('Semantics & Firebase Analytics Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                print("hi");
                button_event('Simple Button', 'blue');
              },
              child: const Text('Simple Button'),
            ),
            const SizedBox(height: 20.0),
            Semantics(
              label: 'This is a Semantic button',
              hint: 'Double-tap to activate',
              child: TextButton(
                onPressed: () {
                  button_event('Semantic Button', 'blue');
                },
                child: const Text('Semantic button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
