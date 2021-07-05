import 'package:flutter/cupertino.dart';

class BaseModel extends ChangeNotifier {
  bool loading = false;
  setLoading(bool value){
    loading = value;
    notifyListeners();
  }
}