import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:malpav3/src/screens/report_event/report_event_controller.dart';
import 'package:malpav3/src/utils/colors_generic.dart';
import 'package:malpav3/widgets/text_input_field.dart';

class ReportEventPage extends StatefulWidget {
  const ReportEventPage({super.key});

  @override
  State<ReportEventPage> createState() => _ReportEventPageState();
}

class _ReportEventPageState extends State<ReportEventPage> {
  final ReportEventController _controller = ReportEventController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: secondaryColor,
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
      body: Form(
        child: Container(
          decoration: BoxDecoration(color: secondaryColor),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: _googleMaps(),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _informacionInfracciones(),
                      _inputPlacaVehiculo(),
                      // _listInfracciones(),
                      _btnTomarFoto(),
                      _btnUpload(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _googleMaps() {
    return GoogleMap(
      initialCameraPosition: _controller.initialPosition,
      onMapCreated: _controller.onMapCreate,
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
    );
  }

  Widget _informacionInfracciones() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: staticFieldColor,
      ),
      child: SelectionContainer.disabled(
        child: Column(
          children: [
            Text(
              "Las infracciones que se pueden reportar son las siguientes: ",
              style: TextStyle(
                fontSize: 16,
                color: whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.left,
                "  1.Infraccion1",
                style: TextStyle(
                  fontSize: 16,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                "  2.Infraccion2",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                textAlign: TextAlign.left,
                "  3.Infraccion3",
                style: TextStyle(
                  fontSize: 16,
                  color: whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputPlacaVehiculo() {
    return TextInputField(
      textEditingController: _controller.placaCapture,
      hintText: "Ingresa la placa del vehículo",
      isPass: false,
      icon: 4,
      textInputType: TextInputType.emailAddress,
      textInputLength: 6,
      marginBottom: 10,
      marginTop: 12,
    );
  }

  // //Widget Lista infracciones

  // Widget _listInfracciones() {
  //   final ValueNotifier<List<String>> listNotifier =
  //       ValueNotifier<List<String>>(
  //           ["Infraccion 1.", "Infraccion 2.", "Infraccion 3."]);
  //   String? infraccionSeleccionada;

  //   return ValueListenableBuilder(
  //     valueListenable: listNotifier,
  //     builder: (BuildContext context, List<String> list, Widget? child) {
  //       return Container(
  //         width: double.infinity,
  //         margin: const EdgeInsets.only(bottom: 12),
  //         padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
  //         decoration: const BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.all(
  //             Radius.circular(5),
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

  Widget _btnUpload() {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () => {
              _controller.uploadReport(),
              FocusScope.of(context).unfocus(),
            },
            label: const Text(
              'Subir Reporte',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.upload_file_rounded,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ));
  }

  Widget _btnTomarFoto() {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        width: double.infinity,
        height: 50,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              _controller.uploadPicture();
            },
            label: const Text(
              'Tomar Foto',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: buttonColor,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ));
  }

  void refresh() {
    setState(() {});
  }
}
