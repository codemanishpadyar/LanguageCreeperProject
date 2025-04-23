import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> executeCode(String language, String code) async {
    final response = await http.post(
      Uri.parse("http://192.168.0.1:5000/run"), // ✅ Must match backend
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"language": language, "code": code}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return {"error": "Failed to execute code"};
    }
  }
}
