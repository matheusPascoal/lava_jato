class ServiceModel {
  String? title;
  double? value;

  ServiceModel({this.title, this.value});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
    };
  }
}
