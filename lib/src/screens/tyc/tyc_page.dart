import 'package:flutter/material.dart';
import 'package:malpav3/src/utils/colors_generic.dart';

class TyCPage extends StatefulWidget {
  const TyCPage({super.key});

  @override
  State<TyCPage> createState() => _TyCState();
}

class _TyCState extends State<TyCPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: const IconThemeData(color: blackColor),
        title: const Text(
          'Términos y condiciones',
          style: TextStyle(color: blackColor),
        ),
        backgroundColor: primaryColor,
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Text(
            'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Omnis voluptatem tenetur perferendis magni voluptatibus iste, ratione repellendus necessitatibus voluptates recusandae nihil, atque repudiandae quas perspiciatis beatae maxime. Accusantium, vitae delectusQuo earum nesciunt molestias hic aspernatur vel, at aliquid iste repellendus facilis consequuntur totam dignissimos aliquam officiis, explicabo beatae! Aliquam illum tenetur voluptatum dolorem natus, molestias ipsum laudantium in cum?Porro suscipit iure vitae corrupti odit sint excepturi voluptatum consequuntur nobis. Explicabo, praesentium architecto necessitatibus, laborum doloribus dolores non corrupti dicta ullam officiis asperiores dignissimos incidunt. Maxime neque quod accusantium.Repellendus praesentium harum voluptatem tempora quia! Illum ratione ad inventore quo atque expedita labore rerum deleniti, asperiores dolorum odio, harum velit, doloremque quas qui quam minima sunt hic accusantium ut.Placeat explicabo consectetur non deleniti vel. Suscipit quo sint natus asperiores eaque. Consequuntur dolore ullam enim incidunt aliquam, eaque quasi dolores eum beatae labore accusantium doloribus laudantium, iusto recusandae rerum?',
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
