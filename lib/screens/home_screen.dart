import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  double _imc = 0.0;
  String _status = '';
  Color _backgroundColor = Colors.white;

  void _calcularIMC() {
    double peso = double.tryParse(_pesoController.text) ?? 0.0;
    double altura = double.tryParse(_alturaController.text) ?? 0.0;

    if (peso > 0 && altura > 0) {
      setState(() {
        _imc = peso / (altura * altura);
        _definirStatusIMC();
      });
    }
  }

  void _definirStatusIMC() {
    if (_imc < 18.5) {
      _status = "Abaixo do Peso";
      _backgroundColor = Colors.blue;
    } else if (_imc < 25) {
      _status = "Peso Normal";
      _backgroundColor = Colors.green;
    } else if (_imc < 30) {
      _status = "Sobrepeso";
      _backgroundColor = Colors.yellow[300]!;
    } else if (_imc < 35) {
      _status = "Obesidade Grau I";
      _backgroundColor = Colors.yellow[700]!;
    } else if (_imc < 40) {
      _status = "Obesidade Grau II";
      _backgroundColor = Colors.orange;
    } else {
      _status = "Obesidade Mórbida";
      _backgroundColor = Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Container(
        color: _backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Insira seus dados para calcular o IMC:',
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (kg)',
              ),
            ),
            TextField(
              controller: _alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (m)',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(height: 20),
            Text(
              _imc > 0 ? 'Seu IMC: ${_imc.toStringAsFixed(2)}' : '',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              _status,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Você pode adicionar um widget para exibir a imagem correspondente aqui
          ],
        ),
      ),
    );
  }
}
