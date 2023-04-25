import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 163, 6, 6),
        title: Center(
            child: Text(
          "Airtel FORQUA",
          style: GoogleFonts.montserrat(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.75, vertical: 1.75),
        child: Column(
          children: [
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.999,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 226, 15, 0),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                      "Pour répondre aux questions une souscription de 200f cfa "
                      "vous sera facturé à votre compte airtel money,",
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold)),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        "cliquez ici.",
                        style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline,
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
