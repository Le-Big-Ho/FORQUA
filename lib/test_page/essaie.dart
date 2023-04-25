import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestOne extends StatefulWidget {
  const TestOne({super.key});

  @override
  State<TestOne> createState() => _TestOneState();
}

class _TestOneState extends State<TestOne> {
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
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Column(
                children: [Container(child: Text(""),)],
              ),
            )
          ],
        ),
      ),
    );
  }
}
