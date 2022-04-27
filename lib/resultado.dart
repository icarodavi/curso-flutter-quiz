import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final Function() _funcao;
  final String _texto;

  Resultado(this._texto, this._funcao);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            _texto,
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 40,
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: _funcao,
            child: const Text('Voltar'),
          ),
        ),
      ],
    );
  }
}
