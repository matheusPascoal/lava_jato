import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lava_jato/model/data_model.dart';
import 'package:lava_jato/model/service_model.dart';
import 'package:google_fonts/google_fonts.dart';
import '../repositories/repository.dart';

class CadastroPlaca extends StatefulWidget {
  const CadastroPlaca({Key? key}) : super(key: key);

  @override
  State<CadastroPlaca> createState() => _CadastroPlacaState();
}

class _CadastroPlacaState extends State<CadastroPlaca> {
  final TextEditingController textController = TextEditingController();
  final DataRepository _dataRepository = DataRepository();

  List<ServiceModel> _values = [
    ServiceModel(title: 'SELECIONE SERVIÇO', value: 0),
    ServiceModel(title: 'Por fora  -', value: 15.00),
    ServiceModel(title: 'Por dentro  -', value: 20.00),
    ServiceModel(title: 'Geral  -', value: 30.00),
    ServiceModel(title: 'Geral + cera  -', value: 40.00),
  ];
  double selectedValue = 0;

  getData() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(children: [
        Image.network(
          'https://cdn.discordapp.com/attachments/940386713031819267/966436643563245608/Untitled.png',
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 50, 79, 139),
                border: Border.all(
                  color: Color.fromARGB(255, 8, 2, 66),
                  width: 4,
                ),
              ),
              child: InkWell(
                onTap: () async {
                  var result = await _dataRepository.saveDataList(DataModel(
                    licensePlate: textController.text,
                    valueService: selectedValue,
                  ));
                  if (result == true) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Color.fromARGB(255, 40, 167, 97),
                          content: Text(
                            'DADOS SALVOS !',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.varelaRound(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(milliseconds: 500),
                          elevation: 10),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'ERROR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    'CONFIRMAR',
                    style: GoogleFonts.varelaRound(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    ));
  }
}
