import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final funcao;
  const Resposta(this.texto, this.funcao, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // width: double.infinity - 50%,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed: funcao,
          child: Text(texto),
        ));
  }
}
