import 'package:flutter/material.dart';
import 'package:forqua/transaction/transaction.dart';
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
                child: Center(child: Text("Le jeu Forqua est conçu pour tester vos connaissances en informatique à travers une série de questions à choix multiple. Pour jouer, il vous suffit de répondre correctement à un certain nombre de questions dans un temps imparti. Si vous réussissez à répondre correctement à toutes les questions, vous aurez la chance de gagner une formation gratuite en informatique.La formation gratuite offerte par Forqua est conçue pour vous aider à améliorer vos compétences en informatique, que vous soyez débutant ou que vous ayez déjà une certaine expérience. Elle est dispensée par des experts en informatique qui sont passionnés par leur domaine et qui ont une expérience pratique dans le domaine.Pour participer au jeu Forqua, vous devrez vous inscrire en ligne sur notre site web. Une fois inscrit, vous aurez accès à la plateforme de jeu où vous pourrez commencer à répondre aux questions. Vous pouvez jouer autant de fois que vous le souhaitez pour améliorer vos résultats et augmenter vos chances de gagner la formation gratuite.Nous sommes convaincus que le jeu de quizz Forqua vous offrira une expérience amusante et éducative tout en vous aidant à améliorer vos compétences en informatique. Inscrivez-vous dès maintenant et commencez à jouer pour avoir la chance de gagner une formation gratuite en informatique",style: TextStyle(fontSize: 20,color: Colors.white),)),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                        "Pour répondre aux questions une souscription de 200f cfa "
                        "vous sera facturé à votre compte airtel money,",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold)),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => transaction()),
                        );
                      },
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
