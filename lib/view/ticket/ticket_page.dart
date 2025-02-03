import 'package:flutter/material.dart';

import 'package:movie_app/gen/fonts.gen.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.8,
        title: const Text(
          'Tickets',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.merriweather,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor:Colors.white,
      body: const Center(
        child: Text('Tickets Page', style: TextStyle(fontSize: 20)),
      )
    );
  }
}