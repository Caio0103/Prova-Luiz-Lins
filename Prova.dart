import 'package:flutter/material.dart';

class Livro {
  final String titulo;
  final String autor;
  final int anoPublicacao;
  final String genero;
  final double avaliacao;

  Livro({
    required this.titulo,
    required this.autor,
    required this.anoPublicacao,
    required this.genero,
    required this.avaliacao,
  });

  static Livro getExample() {
    return Livro(
      titulo: 'Meu pequeno grímorio',
      autor: 'George Orwell',
      anoPublicacao: 1949,
      genero: 'Distopia',
      avaliacao: 4.8,
    );
  }
}

class LivroWidget extends StatefulWidget {
  const LivroWidget({Key? key}) : super(key: key);

  @override
  State<LivroWidget> createState() => _LivroWidgetState();
}

class _LivroWidgetState extends State<LivroWidget> {
  Livro? _livro;

  void _mostrarLivro() {
    setState(() {
      _livro = Livro.getExample();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(fontSize: 16),
            ),
            onPressed: _mostrarLivro,
            child: const Text('Mostrar Livro'),
          ),
          const SizedBox(height: 20),
          if (_livro != null)
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _livro!.titulo,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text('Autor: ${_livro!.autor}'),
                    Text('Ano de Publicação: ${_livro!.anoPublicacao}'),
                    Text('Gênero: ${_livro!.genero}'),
                    Text('Avaliação: ${_livro!.avaliacao}'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }