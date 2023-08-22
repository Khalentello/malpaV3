import 'package:flutter/material.dart';
import 'package:malpav3/src/screens/createReport/create_report_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';
import 'package:malpav3/widgets/text_input_field.dart';
// import 'package:malpav3/widgets/text_input_field.dart';

class CreateReportPage extends StatefulWidget {
  const CreateReportPage({super.key});

  @override
  State<CreateReportPage> createState() => _CreateReportPageState();
}

class _CreateReportPageState extends State<CreateReportPage> {
  final CreateReportController _controller = CreateReportController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 5,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          "Crear reporte",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: Form(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  _googleMaps(),
                  _btnMyPosition(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 40),
                // child: Column(
                //   children: [
                child: _inputPlacaVehiculo(),
                // _listInfracciones(),
                // ],
              ),
            ),
            _btnUpload(),
          ],
        ),
      ),
    );
  }

  Widget _googleMaps() {
    return Container(
      color: secondaryColor,
    );
  }

  Widget _btnMyPosition() {
    return Container(
      alignment: Alignment.bottomLeft,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(6),
            backgroundColor: primaryColor),
        onPressed: () => debugPrint("###Centrar"),
        child: const Icon(
          Icons.my_location_sharp,
          color: Colors.black,
          size: 30,
        ),
      ),
    );
  }

  //Widget Placa Vehiculo
  Widget _inputPlacaVehiculo() {
    return Container(
      color: Colors.red,
    );
    // return TextInputField(
    //   textEditingController: _controller.placaCapture,
    //   hintText: "Ingresa la placa del vehículo",
    //   isPass: false,
    //   icon: 4,
    //   textInputType: TextInputType.emailAddress,
    //   textInputLength: 6,
    // );
  }

  //Widget Lista infracciones

  // Widget _listInfracciones() {
  //   final ValueNotifier<List<String>> listNotifier =
  //       ValueNotifier<List<String>>(
  //           ["C02:Estacionar el vehículo en lugares prohibidos", "2.", "3."]);
  //   String? infraccionSeleccionada;

  //   return ValueListenableBuilder(
  //     valueListenable: listNotifier,
  //     builder: (BuildContext context, List<String> list, Widget? child) {
  //       return Container(
  //         width: double.infinity,
  //         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(50),
  //           ),
  //         ),
  //         child: FormField<String>(
  //           builder: (FormFieldState<String> state) {
  //             return DropdownButtonHideUnderline(
  //               child: DropdownButton<String>(
  //                 underline: Container(),
  //                 hint: const Text(
  //                   "Seleccione la infraccion",
  //                   style: TextStyle(
  //                       color: Colors.black,
  //                       fontSize: 15,
  //                       fontWeight: FontWeight.w400),
  //                 ),
  //                 value: infraccionSeleccionada,
  //                 isExpanded: true,
  //                 onChanged: (newValue) {
  //                   infraccionSeleccionada = newValue;
  //                   // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  //                   listNotifier.notifyListeners();
  //                   debugPrint(newValue);
  //                 },
  //                 items: list.map((String value) {
  //                   return DropdownMenuItem<String>(
  //                     value: value,
  //                     child: Text(value),
  //                   );
  //                 }).toList(),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  //Widget boton subir reporte
  Widget _btnUpload() {
    return SizedBox(
        width: double.infinity,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () => {
              // Navigator.pushNamed(context, 'Reportar'),
              FocusScope.of(context).unfocus(),
            },
            label: const Text(
              'Subir Reporte',
              style: TextStyle(color: Colors.black),
            ),
            icon: const Icon(
              Icons.upload_file_rounded,
              color: Colors.black,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              shadowColor: const Color.fromRGBO(255, 224, 23, 1),
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ));
  }

  void refresh() {
    setState(() {});
  }
}
