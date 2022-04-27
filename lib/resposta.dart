import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function()? funcao;
  const Resposta(this.texto, this.funcao);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: funcao,
        child: Text(texto),
      ),
    );
  }
}
