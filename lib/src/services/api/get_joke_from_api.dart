import 'dart:convert';

import '../../constants/object_constants.dart';
import '../../constants/string_constants.dart';
import '../models/response_model_single.dart';
import 'package:http/http.dart' as http;

import '../models/response_model_twopart.dart';

class GetJokeFromApi {
  var client = http.Client();
  late ResponseModel responseModel;
  late ResponseModel2 responseModel2;
  getResponse(String urlString, String mode) async {
    // Setting Joke Type Mode
    modeAllTime = mode;

    Uri url = Uri.parse(urlString);
    try {
      var response = await client.get(url);
      if (response.statusCode == 200) {
        if (mode == "single") {
          responseModel = ResponseModel.fromJson(json.decode(response.body));
          joke = responseModel.joke;
        } else {
          responseModel2 = ResponseModel2.fromJson(jsonDecode(response.body));
          twopart = "${responseModel2.setup}\n\n${responseModel2.delivery}";
        }
        customDialog.loadingDialog("joke");
      }
    } on Exception {
      customDialog.loadingDialog("error");
    }
  }
}
