import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mvp_ff/choose_menu.dart';
import 'package:mvp_ff/piatto_column.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = dotenv.env['TITLE'] ?? 'Titolo di default';
    final subtitle = dotenv.env['SUBTITLE'] ?? 'Sottotitolo di default';
    final ctaText = dotenv.env['CTA_TEXT'] ?? 'Avvia';
    final text_color = Color(int.parse(dotenv.env['TEXT_COLOR'] ?? '0xFF0b2b26'));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fit&Fast'),
        backgroundColor: Color(int.parse(dotenv.env['SECONDARY_COLOR'] ?? '0xFF4CAF50')),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        decoration: BoxDecoration(
          color: Color(int.parse(dotenv.env['PRIMARY_COLOR'] ?? '0xFF4CAF50'))
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 58,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.white70,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Row(
                  children: [
                    PiattoColumn(
                      dishName: 'Fit Chicken Bowl',
                      imagepath: '../assets/primo.png',
                      dimagrimentoData: DishData(
                        ingredients: [
                          {'name': 'Petto di pollo grigliato', 'grams': '140g'},
                          {'name': 'Zucchine grigliate', 'grams': '150g'},
                          {'name': 'Hummus Light ', 'grams': '20g'},
                          {'name': 'Olio Evo', 'grams': '5g'},
                          {'name': 'Paprika', 'grams': '0g'},
                          {'name': 'Lime', 'grams': '0g'},
                        ],
                        macros: ['20g carb', '414 prot', '22g grassi'],
                        calories: '500 kcal',
                        price: '9.99'
                      ),
                      mantenimentoData: DishData(
                        ingredients: [
                          {'name': 'Petto di pollo grigliato', 'grams': '170g'},
                          {'name': 'Zucchine grigliate', 'grams': '170g'},
                          {'name': 'Hummus Light ', 'grams': '25g'},
                          {'name': 'Olio Evo', 'grams': '7g'},
                          {'name': 'Paprika', 'grams': '0g'},
                          {'name': 'Lime', 'grams': '0g'},
                        ],
                        macros: ['25g carb', '47g prot', '25g grassi'],
                        calories: '600 kcal',
                        price: '10.99'
                      ),
                      massaData: DishData(
                        ingredients: [
                          {'name': 'Petto di pollo grigliato', 'grams': '190g'},
                          {'name': 'Zucchine grigliate', 'grams': '190g'},
                          {'name': 'Hummus Light ', 'grams': '30g'},
                          {'name': 'Olio Evo', 'grams': '9g'},
                          {'name': 'Paprika', 'grams': '0g'},
                          {'name': 'Lime', 'grams': '0g'},
                        ],
                        macros: ['30g carb', '55g prot', '28g grassi'],
                        calories: '700 kcal',
                        price: '11.99'
                      ),
                    ),
                    PiattoColumn(
                      dishName: 'Power Grain Bowl',
                      imagepath: '../assets/secondo.png',
                      dimagrimentoData: DishData(
                        ingredients: [
                          {'name': 'Cous cous', 'grams': '85g'},
                          {'name': 'Salmone al forno', 'grams': '100g'},
                          {'name': 'Mix verdure vapore', 'grams': '85g'},
                          {'name': 'Salsa Yogurt', 'grams': '8g'},
                          {'name': 'Mandorle', 'grams': '8g'},
                        ],
                        macros: ['70g carb', '30g prot.', '20g grassi'],
                        calories: '600 kcal',
                        price: '11.99',
                      ),
                      mantenimentoData: DishData(
                        ingredients: [
                          {'name': 'Cous cous', 'grams': '100g'},
                          {'name': 'Salmone al forno', 'grams': '120g'},
                          {'name': 'Mix verdure vapore', 'grams': '100g'},
                          {'name': 'Salsa Yogurt', 'grams': '10g'},
                          {'name': 'Mandorle', 'grams': '10g'},
                        ],
                        macros: ['90g carb', '35g prot.', '25g grassi'],
                        calories: '720 kcal',
                        price: '12.99',
                      ),
                      massaData: DishData(
                        ingredients: [
                          {'name': 'Cous cous', 'grams': '115g'},
                          {'name': 'Salmone al forno', 'grams': '138g'},
                          {'name': 'Mix verdure vapore', 'grams': '115g'},
                          {'name': 'Salsa Yogurt', 'grams': '12g'},
                          {'name': 'Mandorle', 'grams': '12g'},
                        ],
                        macros: ['100g carb', '41g prot.', '29g grassi'],
                        calories: '830 kcal',
                        price: '13.99',
                      ),
                    ),
                    PiattoColumn(
                      dishName: 'Muscle Gain Bowl',
                      imagepath: '../assets/terzo.png',
                      dimagrimentoData: DishData(
                        ingredients: [
                          {'name': 'Riso', 'grams': '110g'},
                          {'name': 'Pollo', 'grams': '110g'},
                          {'name': 'Verdure Grigliate', 'grams': '58g'},
                          {'name': 'Scaglie di Parmigiano', 'grams': '10g'},
                          {'name': 'Olio EVO', 'grams': '10g'},
                        ],
                        macros: ['100g carb', '35g prot.', '35g grassi'],
                        calories: '700 kcal',
                        price: '13.99',
                      ),
                      mantenimentoData: DishData(
                        ingredients: [
                          {'name': 'Riso', 'grams': '130g'},
                          {'name': 'Pollo', 'grams': '130g'},
                          {'name': 'Verdure Grigliate', 'grams': '68g'},
                          {'name': 'Scaglie di Parmigiano', 'grams': '13g'},
                          {'name': 'Olio EVO', 'grams': '13g'},
                        ],
                        macros: ['120g carb', '39g prot.', '39g grassi'],
                        calories: '810 kcal',
                        price: '14.99',
                      ),
                      massaData: DishData(
                        ingredients: [
                          {'name': 'Riso', 'grams': '150g'},
                          {'name': 'Pollo', 'grams': '150g'},
                          {'name': 'Verdure Grigliate', 'grams': '80g'},
                          {'name': 'Scaglie di Parmigiano', 'grams': '15g'},
                          {'name': 'Olio EVO', 'grams': '15g'},
                        ],
                        macros: ['140g carb', '45g prot.', '45g grassi'],
                        calories: '950 kcal',
                        price: '15.99',
                      )
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
