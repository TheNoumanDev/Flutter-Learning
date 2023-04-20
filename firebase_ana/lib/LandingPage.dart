import 'package:flutter/material.dart';

import 'FirebaseAnalytics_services.dart';

class SemanticsPage extends StatefulWidget {
  @override
  State<SemanticsPage> createState() => _SemanticsPageState();
}

class _SemanticsPageState extends State<SemanticsPage> {
  analyticsServices _ana = analyticsServices();

  @override
  void initState() {
    _ana.setCurrentScreen('Landing Page');
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semantics Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {},
              child: Text('Click me!'),
            ),
            SizedBox(height: 20.0),
            Semantics(
              label: 'This is a custom button',
              hint: 'Double-tap to activate',
              child: TextButton(
                onPressed: () {},
                child: Text('Custom button'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
