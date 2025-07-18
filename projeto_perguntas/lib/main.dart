import 'package:flutter/material.dart'; 
import './resultado.dart';
import './questionario.dart';

main() =>  runApp(PerguntaApp());

// Classe para gerenciar o estado
class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = [
  {
    'texto': 'Qual a sua cor favorita?',
    'respostas': [
      {'texto': 'Verde', 'pontuacao': 1}, 
      {'texto': 'Amarelo', 'pontuacao': 2}, 
      {'texto': 'Azul', 'pontuacao': 3}, 
      {'texto': 'Branco', 'pontuacao': 4}
    ]
  },
  {
    'texto': 'Qual o seu animal favorito?',
    'respostas': [
      {'texto': 'Macaco', 'pontuacao': 5},
      {'texto': 'Gazela', 'pontuacao': 6},
      {'texto': 'Girafa', 'pontuacao': 7},
      {'texto': 'Pinguim', 'pontuacao': 8}
    ]
  },
  {
    'texto': 'Qual o seu instrutor favorito?',
    'respostas': [
      {'texto': 'Jackson Pires', 'pontuacao': 9},
      {'texto': 'Leonardo', 'pontuacao': 10},
      {'texto': 'Maike', 'pontuacao': 11},
      {'texto': 'Jonas', 'pontuacao': 12}
    ]
  }
];

  void _responder(int pontuacao) {
    if(temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
          backgroundColor: Colors.blueGrey,
        ),
        body: temPerguntaSelecionada ? Questionario(
          perguntas: _perguntas, 
          perguntaSelecionada: _perguntaSelecionada, 
          quandoResponder: _responder,
        ) : Resultado(_pontuacaoTotal, _reiniciarQuestionario)
      ),
    );
  }
}

// Classe do componente stateful
class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}