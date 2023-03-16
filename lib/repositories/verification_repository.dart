import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpRepository {
  Future<int> sendOtp(String email) async {
    var response = await http.post(
      Uri.parse("http://192.168.0.108:3000/send-otp/"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'userEmail': email,
        },
      ),
    );
    return response.statusCode;
  }

  Future<int> verifyOtp(String otp, String email) async {
    var response = await http.post(
      Uri.parse("http://192.168.0.108:3000/verify-otp/"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'userEmail': email,
          'otp': otp,
        },
      ),
    );
    return response.statusCode;
  }
}