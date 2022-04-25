import 'dart:convert';

class DataModel {
  String? licensePlate;
  double? valueService;

  DataModel({this.licensePlate, this.valueService});

  DataModel.fromJson(Map<String, dynamic> json) {
    licensePlate = json['licensePlate'];
    valueService = json['valueService'];
  }
  Map<String, dynamic> toJson() {
    return {
      'licensePlate': licensePlate,
      'valueService': valueService,
    };
  }

  String toString() {
    return json.encode(DataModel(
        licensePlate: this.licensePlate, valueService: this.valueService));
  }
}
