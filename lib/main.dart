import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() => runApp(const PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _perguntas = [
    {
      'texto': 'Qual é a sua cor favorita!?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 7},
        {'texto': 'Amarelo', 'pontuacao': 8},
        {'texto': 'Vermelho', 'pontuacao': 9},
        {'texto': 'Branco', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Cachorro', 'pontuacao': 10},
        {'texto': 'Gato', 'pontuacao': 9},
        {'texto': 'Elefante', 'pontuacao': 8},
        {'texto': 'Boi', 'pontuacao': 7},
      ],
    },
    {
      'texto': 'Qual seu dia preferido da semana?',
      'respostas': [
        {'texto': 'Seguda', 'pontuacao': 4},
        {'texto': 'Terça', 'pontuacao': 5},
        {'texto': 'Quarta', 'pontuacao': 6},
        {'texto': 'Quinta', 'pontuacao': 7},
        {'texto': 'Sexta', 'pontuacao': 8},
        {'texto': 'Sábado', 'pontuacao': 9},
        {'texto': 'Domingo', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual sua comida preferida?',
      'respostas': [
        {'texto': 'Doce', 'pontuacao': 10},
        {'texto': 'Salgado', 'pontuacao': 9},
        {'texto': 'Amargo', 'pontuacao': 8},
      ],
    }
  ];

  void _responder(int ponto) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += ponto;
      // if (_perguntaSelecionada >= 4) {
      //   _perguntaSelecionada = 0;
      // }
    });
  }

  void _voltar() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
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
            : Resultado('Fim', _voltar, _pontuacaoTotal),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp();

  @override
  _PerguntaAppState createState() => _PerguntaAppState();
}
