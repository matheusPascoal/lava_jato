import 'package:flutter/material.dart';
import 'package:lava_jato/model/service_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ServiceModel> _values = [
    ServiceModel(title: 'Selecione', value: 0),
    ServiceModel(title: 'Por fora  -', value: 15.00),
    ServiceModel(title: 'Por dentro  -', value: 20.00),
    ServiceModel(title: 'Geral  -', value: 30.00),
    ServiceModel(title: 'Geral + cera  -', value: 40.00),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
              items: _values
                  .map<DropdownMenuItem>((e) => DropdownMenuItem(
                      value: e.value!, child: Text(e.value.toString())))
                  .toList(),
              onChanged: (dynamic newValue) {
                print(newValue);
              })
        ],
      ),
    );
  }
}
