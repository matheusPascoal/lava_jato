import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lava_jato/model/service_model.dart';

class CadastroPlaca extends StatefulWidget {
  const CadastroPlaca({Key? key}) : super(key: key);

  @override
  State<CadastroPlaca> createState() => _CadastroPlacaState();
}

class _CadastroPlacaState extends State<CadastroPlaca> {
  TextEditingController textController = TextEditingController();
  List<ServiceModel> _values = [
    ServiceModel(title: 'SELECIONE SERVIÇO', value: 0),
    ServiceModel(title: 'Por fora  -', value: 15.00),
    ServiceModel(title: 'Por dentro  -', value: 20.00),
    ServiceModel(title: 'Geral  -', value: 30.00),
    ServiceModel(title: 'Geral + cera  -', value: 40.00),
  ];
  double selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 90,
          ),
          TextFormField(
            controller: textController,
          ),
          SizedBox(
            height: 65,
          ),
          DropdownButton(
            autofocus: true,
            elevation: 16,
            style: const TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
            underline: Container(
              height: 2,
              color: Color.fromARGB(255, 2, 2, 2),
            ),
            onChanged: (dynamic newValue) {
              setState(() {
                selectedValue = newValue!;
              });
              print(selectedValue);
            },
            value: selectedValue,
            items: _values
                .map<DropdownMenuItem>(
                  (e) => DropdownMenuItem(
                    value: e.value,
                    child: Row(
                      children: [
                        Text(e.title!),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          e.value!.toString(),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            child: TextButton.icon(
                onPressed: () {
                  setState(() {
                    selectedValue.toString();
                    textController.text;
                  });
                },
                icon: Icon(
                  Icons.save,
                  size: 40,
                  color: Colors.black,
                ),
                label: Text(
                  'GRAVAR',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black),
                )),
          )
        ],
      ),
    ));
  }
}
