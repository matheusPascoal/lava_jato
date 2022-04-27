import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lava_jato/feedBack/snackBar.dart';
import 'package:lava_jato/model/data_model.dart';
import 'package:lava_jato/model/service_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lava_jato/pages/veiculos.dart';
import 'package:lava_jato/shared/functions/functions_shared.dart';
import 'package:lava_jato/shared/services/services.dart';
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

  ServiceModel? selectedValue;

  List<ServiceModel> serviceValues = [];

  int selectedServices = 0;
  _listService() {
    switch (selectedServices) {
      case 0:
        serviceValues = ServiceValues.carroValues;
        break;
      case 1:
        serviceValues = ServiceValues.motoValues;
        break;
      case 2:
        serviceValues = ServiceValues.onibusValues;
        break;
      case 3:
        serviceValues = ServiceValues.caminhaoValues;
        break;
      case 4:
        serviceValues = ServiceValues.outrosValues;
        break;
      default:
    }
    setState(() {});
  }

  _onTapButton() async {
    var result = await _dataRepository.saveDataList(DataModel(
      licensePlate: textController.text.toUpperCase(),
      //valueService: selectedValue,
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
  void initState() {
    serviceValues = ServiceValues.carroValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 80,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                5,
                (index) => CardsServices(
                  onTap: () {
                    setState(() {
                      selectedServices = index;
                      selectedValue = null;
                    });

                    _listService();
                    print(index);
                  },
                  icon: Icons.local_car_wash_outlined,
                  selectedButton: selectedServices == index,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 40,
        ),
        DropdownButton(
          autofocus: true,
          elevation: 16,
          style: TextStyle(color: Color.fromARGB(255, 2, 2, 2)),
          underline: Container(
            height: 2,
            color: Color.fromARGB(255, 2, 2, 2),
          ),
          onChanged: (dynamic newValue) {
            setState(() {
              selectedValue = newValue!;
            });
          },
          value: selectedValue,
          items: serviceValues
              .map<DropdownMenuItem>(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Center(
                    child: Text(
                      e.title!.toUpperCase(),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          width: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
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
        ),
      ],
    ));
  }
}
