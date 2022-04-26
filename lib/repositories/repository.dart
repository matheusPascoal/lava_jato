import 'dart:convert';
import 'package:lava_jato/model/data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const dataListKey = 'data_list';

class DataRepository {
  DataRepository() {}

  Future<bool> saveDataList(DataModel data) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var result = sharedPreferences.getStringList(dataListKey);
    if (result == null) {
      result = <String>[];
      DataModel? deletedTodo;
    }
    result.add(data.toString());
    return await sharedPreferences
        .setStringList(dataListKey, result)
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<List<DataModel>> getService() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final List<String>? list_String =
        sharedPreferences.getStringList(dataListKey);
    if (list_String != null) {
      return list_String.map<DataModel>((e) {
        print(e);
        var decode = json.decode(e);
        print(decode);
        return DataModel.fromJson(json.decode(e));
      }).toList();
    }
    return <DataModel>[];
  }

  void removeService(DataModel dataModel) {}
}

removeService(DataModel dataModel) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  List<String>? list_String = [];
  list_String = sharedPreferences.getStringList(dataListKey);
  list_String!.remove(json.encode(dataModel.toJson()));
  sharedPreferences.setStringList(dataListKey, list_String);
}
