import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita!?',
      'respostas': ['Preto', 'Amarelo', 'Vermelho', 'Branco'],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': ['Cachorro', 'Gato', 'Elefante', 'Boi'],
    },
    {
      'texto': 'Qual seu dia preferido da semana?',
      'respostas': [
        'Seguda',
        'Terça',
        'Quarta',
        'Quinta',
        'Sexta',
        'Sábado',
        'Domingo'
      ],
    },
    {
      'texto': 'Qual sua comida preferida?',
      'respostas': ['Doce', 'Salgado', 'Amargo'],
    }
  ];

  void _responder() {
    setState(() {
      _perguntaSelecionada++;
      // if (_perguntaSelecionada >= 4) {
      //   _perguntaSelecionada = 0;
      // }
    });
  }

  void _voltar() {
    setState(() {
      _perguntaSelecionada = 0;
    });
  }

  bool temPerguntaSelecionada() {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perguntas')),
        body: temPerguntaSelecionada()
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado('Fim', _voltar),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp();

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
