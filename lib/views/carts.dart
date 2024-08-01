import 'package:flutter/material.dart';
import 'package:movies_api/consts/styles.dart';

class Cart extends StatefulWidget {
  final String nome;
  final String views;
  final String poster;
  final String data;
  final double pontos;
  const Cart(
      {super.key,
      required this.nome,
      required this.poster,
      required this.views,
      required this.data,
      required this.pontos});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(widget.nome),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.8,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.blueGrey),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/original/${widget.poster}",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.3),
                    child: Text(
                      widget.nome,
                      style: style(),
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.4,
                  ),
                  child: Text(
                    widget.views,
                    style: style(),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.4,
                    ),
                    child: Text(
                      "Data de lancamento ${data(widget.data)}", style: style(),)),
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.4,
                    ),
                    child: Text(
                      "Media de pontos: ${widget.pontos.toStringAsFixed(2)}", style: style(),)
                )
              ],
            )),
      ),
    );
  }
}
