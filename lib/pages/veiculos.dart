import 'package:flutter/material.dart';
import 'package:lava_jato/model/data_model.dart';
import 'package:lava_jato/model/service_model.dart';
import 'package:lava_jato/pages/cadastro_placa.dart';
import 'package:lava_jato/repositories/repository.dart';

class Veiculos extends StatefulWidget {
  const Veiculos({Key? key}) : super(key: key);

  @override
  State<Veiculos> createState() => _VeiculosState();
}

class _VeiculosState extends State<Veiculos> {
  DataRepository dataRepository = DataRepository();
  List<DataModel> services = [];

  receberDadosServico() async {
    var result = await dataRepository.getService();
    services = result;
    setState(() {});
  }

  @override
  initState() {
    super.initState();
    receberDadosServico();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CadastroPlaca();
              },
            ),
          );
          receberDadosServico();
        },
        child: Icon(Icons.add),
        //Chamar info caso tenho algo salvo
      ),
      body: Center(
        child: Container(
          color: Color.fromARGB(255, 199, 219, 235),
          height: 500,
          width: 330,
          child: ListView(
            children: services
                .map((e) => Column(
                      children: [
                        Text(e.valueService.toString()),
                        Text(e.licensePlate.toString()),
                      ],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
