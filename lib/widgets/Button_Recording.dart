import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lava_jato/model/data_model.dart';
import 'package:lava_jato/model/service_model.dart';
import 'package:lava_jato/pages/veiculos.dart';
import 'package:lava_jato/repositories/repository.dart';

class RecordingButton extends StatefulWidget {
  final Widget? child;

  const RecordingButton({Key? key, this.child}) : super(key: key);

  @override
  State<RecordingButton> createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton> {
  final TextEditingController textController = TextEditingController();
  final DataRepository _dataRepository = DataRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 50, 79, 139),
        border: Border.all(
          color: Color.fromARGB(255, 8, 2, 66),
          width: 4,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          'CONFIRMAR',
          style: GoogleFonts.varelaRound(
              color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
