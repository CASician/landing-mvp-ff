import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'env.dart';

void showEmailCapDialog(BuildContext context) {
  final primaryColor = Env.primaryColor;
  final secondaryColor = Env.secondaryColor;

  final emailController = TextEditingController();
  // final capController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: secondaryColor,
        contentPadding: const EdgeInsets.all(24),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Fit & Fast è quasi pronto!',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Inserisci la tua email per saperne di più!',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            // TextField(
            //   controller: capController,
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white,
            //     hintText: 'CAP',
            //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            //   ),
            //   keyboardType: TextInputType.number,
            // ),
            // const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () async {
                  final email = emailController.text.trim();
                  // final cap = capController.text.trim();

                  final emailValid = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(email);
                  // final capValid = RegExp(r"^\d{5}$").hasMatch(cap);

                  // if (emailValid && capValid) {
                  if (emailValid) {
                    // Mostra il dialog con la rotellina
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return const Center(child: CircularProgressIndicator());
                      },
                    );

                    // Invio dati
                    // await sendDataToGoogleSheets(email, cap, context);
                    await sendDataToGoogleSheets(email, context);

                    // Chiude la rotellina
                    Navigator.of(context, rootNavigator: true).pop();
                    // Chiude il dialog iniziale
                    Navigator.of(context).pop();

                    // Mostra dialog di conferma
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: secondaryColor,
                          contentPadding: const EdgeInsets.all(24),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Grazie!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                'Ti ricontatteremo appena possibile.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Chiudi', style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    // Dati non validi
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          backgroundColor: secondaryColor,
                          contentPadding: const EdgeInsets.all(24),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Dati non validi!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                // 'Inserisci email e CAP validi per continuare.',
                                'Inserisci email valida per continuare.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Chiudi', style: TextStyle(color: Colors.white)),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Text('Invia', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      );
    },
  );
}
// Future<void> sendDataToGoogleSheets(String email, String cap, context) async {
Future<void> sendDataToGoogleSheets(String email, context) async {
  final Uri url = Uri.parse(Env.sheetsApi);
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    // body: 'email=${Uri.encodeComponent(email)}&cap=${Uri.encodeComponent(cap)}',
    body: 'email=${Uri.encodeComponent(email)}',

  );

  if (response.statusCode != 200) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.red,
          contentPadding: const EdgeInsets.all(24),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Invio fallito! Riprova',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Chiudi', style: TextStyle(color: Colors.black)),
                ),
              )
            ],
          ),
        );
      },
    );
  } else {
    // log("Dati mandati! email:" + email + ", cap:" + cap);
    log("Dati mandati! email:" + email);
    await http.post(
      Uri.parse('https://ntfy.sh/fitandfast'),
      headers: {'Content-Type': 'text/plain'},
      // body: 'New entry: $email, $cap',
        body: 'New entry: $email',
    );
  }
}