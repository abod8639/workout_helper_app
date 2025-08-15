
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;


String esp32IP = "192.168.1.4" ;



// if (currentLine.endsWith("GET /H")) {
void sendTEST(String state) {
  var url = Uri.parse('http://$esp32IP/$state');
http.get(url).then((response) {
    if (response.statusCode == 200) {
      debugPrint('Request sent successfully: $state');
    } else {
      debugPrint('Failed to send request: ${response.statusCode}');
    }
  }).catchError((error) {
    debugPrint('Error sending request: $error');
  });
}