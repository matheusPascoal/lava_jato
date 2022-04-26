import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lava_jato/feedBack/snackBar.dart';
import 'package:lava_jato/model/data_model.dart';
import 'package:lava_jato/model/service_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lava_jato/pages/veiculos.dart';
import 'package:lava_jato/shared/functions/functions_shared.dart';
import 'package:lava_jato/widgets/cards_services.dart';
import 'package:lava_jato/widgets/text_field_identifier.dart';
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
    ServiceModel(title: 'Por fora  ', value: 15.00),
    ServiceModel(title: 'Por dentro  ', value: 20.00),
    ServiceModel(title: 'Geral  ', value: 30.00),
    ServiceModel(title: 'Geral + cera  ', value: 40.00),
  ];
  double selectedValue = 0;

  _onTapButton() async {
    var result = await _dataRepository.saveDataList(DataModel(
      licensePlate: textController.text.toUpperCase(),
      valueService: selectedValue,
    ));
    if (result == true) {
      FunctionShared.showSnackBar(context, "DADOS SALVOS !", Colors.green);
      Navigator.pop(
          context,
          MaterialPageRoute(
            builder: (context) => Veiculos(),
          ));
    } else {
      FunctionShared.showSnackBar(
          context, 'ERRO AO SALVAR!', Color.fromARGB(255, 231, 7, 7));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          TextFieldIdentifier(
            controller: textController,
            label: "Placa",
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardsServices(),
              CardsServices(),
              CardsServices(),
              CardsServices(),
              CardsServices(),
            ],
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
                        Center(
                            child: Text(
                          e.title!.toUpperCase(),
                          textAlign: TextAlign.start,
                        )),
                        SizedBox(
                          width: 20,
                        ),
                        Text(e.value!.toString()),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          SizedBox(
            height: 60,
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
              onTap: _onTapButton,
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
    ));
  }
}
