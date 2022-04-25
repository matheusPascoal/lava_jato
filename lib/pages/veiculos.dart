import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'LISTA DE CLIENTES',
                style: GoogleFonts.oswald(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 500,
              width: 300,
              child: ListView(
                children: services
                    .map(
                      (e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                trailing: Icon(
                                  Icons.local_car_wash,
                                  size: 50,
                                ),
                                dense: true,
                                title: Text(
                                  'PLACA - ${e.licensePlate.toString()}',
                                  style: GoogleFonts.varelaRound(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    'VALOR - ${e.valueService.toString()}',
                                    style: GoogleFonts.varelaRound(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
