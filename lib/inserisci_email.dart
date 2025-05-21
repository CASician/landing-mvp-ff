import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void showEmailCapDialog(BuildContext context) {
  final primaryColor = Color(int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF2196F3'));
  final secondaryColor = Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFF4CAF50'));

  final emailController = TextEditingController();
  final capController = TextEditingController();

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
              'Inserisci la tua email e il CAP per scoprire la data!',
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
            TextField(
              controller: capController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'CAP',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  final email = emailController.text.trim();
                  final cap = capController.text.trim();

                  Navigator.of(context).pop(); // Chiude il primo dialog

                  // Mostra il secondo dialog di conferma
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
                                  Navigator.of(context).pop(); // Chiude il secondo dialog
                                },
                                child: const Text('Chiudi', style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
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
