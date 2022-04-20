class ServiceModel {
  String? title;
  double? value;

  ServiceModel({required this.title, required this.value});

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
