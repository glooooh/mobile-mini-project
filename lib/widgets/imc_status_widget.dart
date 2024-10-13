import 'package:flutter/material.dart';

class ImcStatusWidget extends StatelessWidget {
  final String status;
  final double imc;

  const ImcStatusWidget({
    Key? key,
    required this.status,
    required this.imc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          imc > 0 ? 'Seu IMC: ${imc.toStringAsFixed(2)}' : '',
          style: const TextStyle(fontSize: 24),
        ),
        Text(
          status,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        // Aqui você pode adicionar lógica para exibir uma imagem correspondente
      ],
    );
  }
}
