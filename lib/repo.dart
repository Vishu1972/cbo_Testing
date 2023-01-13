import 'dart:convert';
import 'package:http/http.dart' as http;
Future EmployeeMaster(String token) async {
  final EmployeeMasterdata = await http.post(Uri.parse('https://astroapi.intileo.com/api/astrologer/astro_history'),

    headers: {
      "authorization": token,
      'Content-Type': 'application/json; charset=UTF-8',
    },

  );

  print(token);
  if (EmployeeMasterdata.statusCode == 200) {
    var data = jsonDecode(EmployeeMasterdata.body.toString());
    print(data);
    // return AstrocallHistoryModel.fromJson(jsonDecode(suggestedAdddremedydata.body));
    return data;
  } else {
    throw Exception('Failed to post user.');
  }
}