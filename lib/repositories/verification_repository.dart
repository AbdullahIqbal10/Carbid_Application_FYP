import 'dart:convert';
import 'package:http/http.dart' as http;

class OtpRepository {
  Future<dynamic> sendOtp(String phoneNumber) async {
    var response = await http.post(
      Uri.parse("http://192.168.0.108:3000/send-otp/"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'phone_number': phoneNumber,
        },
      ),
    );
    return response.body;
  }

  Future<dynamic> verifyOtp(String otp, String phoneNumber) async {
    var response = await http.post(
      Uri.parse("http://192.168.0.108:3000/verify-otp/"),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'Charset': 'utf-8'
      },
      body: jsonEncode(
        <String, String>{
          'otp': otp,
        },
      ),
    );
    return response.body;
  }
}