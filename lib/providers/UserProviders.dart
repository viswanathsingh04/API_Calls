import 'package:api_check/models/userdata.dart';
import 'package:api_check/services/apiservices.dart';
import 'package:flutter/cupertino.dart';

class Userproviders with ChangeNotifier {
  UserData userData = UserData();
  bool loading = false;
  ApiServices _apiServices = new ApiServices();

  getapidata(int page) async {
    loading = true;
    userData = await _apiServices.getuserdata(page);
    loading = false;
    notifyListeners();
  }
}
