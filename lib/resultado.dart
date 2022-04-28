import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final Function() _funcao;
  final String _texto;
  var _pontuacao;

  Resultado(this._texto, this._funcao, this._pontuacao);

  String get fraseResultado {
    if (_pontuacao < 27) {
      return 'Parabéns!';
    } else if (_pontuacao < 29) {
      return 'Você é bom!';
    } else if (_pontuacao < 32) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            _texto,
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 35,
            ),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: _funcao,
            child: const Text('Voltar'),
          ),
        ),
        Center(
          child: Text(
            'Sua pontuação é: ${_pontuacao} / ${fraseResultado}',
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 30,
            ),
          ),
        )
      ],
    );
  }
}
