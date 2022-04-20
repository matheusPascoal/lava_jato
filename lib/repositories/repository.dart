import 'dart:convert';
import 'package:lava_jato/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const dataListKey = 'data_list';

class DataRepository {
  DataRepository() {
    //LATE - ignora o null-Safety
  }

  Future<bool> saveDataList(DataModel data) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var result = sharedPreferences.getStringList(dataListKey);
    if (result == null) {
      result = <String>[];
    }
    result.add(data.toString());
    return await sharedPreferences
        .setStringList(dataListKey, result)
        .then((value) => true)
        .catchError((error) => false);
  }
}

// Future<List<DataModel>> getDataList() async {
//   final sharedPreferences = await SharedPreference.instance;
//   final List<String>? list_String =
//       sharedPreferences.getStringList(dataListKey);
//   if (list_String != null) {
//     return list_String
//         .map<DataModel>((e) => DataModel.fromJson(json.decode(e)))
//         .toList();
//   }
//   return <DataModel>[];
// }
