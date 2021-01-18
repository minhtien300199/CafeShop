import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart' as http;

class LocalStore {
  static LocalStorage storage = new LocalStorage("store");
  void saveData(dynamic value, String key) async {
    await storage.ready;
    if (storage.getItem(key) == null) {
      storage.setItem(key, value);
    } else {
      var preData = storage.getItem(key);
      if (value != preData) {
        storage.setItem(key, value);
      }
    }
  }
}
