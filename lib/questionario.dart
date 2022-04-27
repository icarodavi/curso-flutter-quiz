import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>>? perguntas;
  final int? perguntaSelecionada;
  final void Function(int) responder;

  final required = Required();

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.responder,
  });

  bool temPerguntaSelecionada() {
    return perguntaSelecionada! < perguntas!.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> respostas = temPerguntaSelecionada()
        ? perguntas![perguntaSelecionada!]['respostas']
            as List<Map<String, Object>>
        : [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Questao(perguntas![perguntaSelecionada!]['texto'].toString()),
        ...respostas.map(
          (e) => Resposta(
            e['texto'].toString(),
            () => responder(int.parse(e['pontuacao'].toString())),
          ),
        ),
      ],
    );
  }
}
