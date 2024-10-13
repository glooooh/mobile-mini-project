class ImcCalculator {
  static double calcular(double peso, double altura) {
    return peso / (altura * altura);
  }

  static String getStatus(double imc) {
    if (imc < 18.5) {
      return "Abaixo do Peso";
    } else if (imc < 25) {
      return "Peso Normal";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau I";
    } else if (imc < 40) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Mórbida";
    }
  }
}
