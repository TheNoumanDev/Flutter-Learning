import 'package:firebase_analytics/firebase_analytics.dart';

class analyticsServices {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  Future<void> setCurrentScreen(String screenName) async {
    await _analytics.setCurrentScreen(screenName: screenName);
  }

  Future<void> setUserId(String id) async {
    await _analytics.setUserId(id: id);
  }

  Future<void> logButtonClickedEvent(
      String Event_Name, String Button_Name, String screen_name) async {
    await _analytics.logEvent(
      name: Event_Name,
      parameters: <String, dynamic>{
        'screen': screen_name,
        'button_id': Button_Name,
      },
    );
  }
}
