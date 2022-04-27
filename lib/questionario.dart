import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>>? perguntas;
  final int? perguntaSelecionada;
  final void Function()? responder;

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
    List<String> respostas = temPerguntaSelecionada()
        ? perguntas![perguntaSelecionada!]['respostas'] as List<String>
        : [];
    return Column(
      children: [
        Questao(perguntas![perguntaSelecionada!]['texto'].toString()),
        ...respostas.map((e) => Resposta(e, responder)),
      ],
    );
  }
}
