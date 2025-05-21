import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:mvp_ff/inserisci_email.dart';
import 'package:mvp_ff/piatto_column.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'env.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBar = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 150 && !_showAppBar) {
        setState(() {
          _showAppBar = true;
        });
      } else if (_scrollController.offset <= 150 && _showAppBar) {
        setState(() {
          _showAppBar = false;
        });
      }
    });
  }
  void _launchInstagram() async {
    final Uri url = Uri.parse('https://www.instagram.com/fitanfast?igsh=MnNia2w3cG15ZWNz&utm_source=qr');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch \$url');
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = Env.title;
    final subtitle = Env.subtitle;
    final textColor = Env.textColor;
    final primaryColor = Env.primaryColor;
    final secondaryColor = Env.secondaryColor;
    final font = GoogleFonts.robotoSlab();

    final piatti = [
      PiattoColumn(
        dishName: 'Fit Chicken Bowl',
        imagepath: 'assets/primo.png',
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
        dishName: 'Vegan Power Bowl',
        imagepath: 'assets/veg.png',
        dimagrimentoData: DishData(
          ingredients: [
            {'name': 'Tofu alla griglia', 'grams': '120g'},
            {'name': 'Hummus', 'grams': '50g'},
            {'name': 'Verdure grigliate', 'grams': '200g'},
            {'name': 'Olio EVO', 'grams': '5g'},
            {'name': 'Semi di lino e girasole', 'grams': '5g'},
          ],
          macros: ['18g carb', '25g prot.', '28g grassi'],
          calories: '450 kcal',
          price: '9.99',
        ),
        mantenimentoData: DishData(
          ingredients: [
            {'name': 'Tofu alla griglia', 'grams': '150g'},
            {'name': 'Hummus', 'grams': '70g'},
            {'name': 'Verdure grigliate', 'grams': '250g'},
            {'name': 'Olio EVO', 'grams': '10g'},
            {'name': 'Semi di lino e girasole', 'grams': '10g'},
          ],
          macros: ['22g carb', '30g prot.', '40g grassi'],
          calories: '630 kcal',
          price: '12.99',
        ),
        massaData: DishData(
          ingredients: [
            {'name': 'Tofu alla griglia', 'grams': '180g'},
            {'name': 'Hummus', 'grams': '100g'},
            {'name': 'Verdure grigliate', 'grams': '300g'},
            {'name': 'Olio EVO', 'grams': '10g'},
            {'name': 'Semi di lino e girasole', 'grams': '15g'},
            {'name': 'Ceci', 'grams': '80g'},
          ],
          macros: ['32g carb', '38g prot.', '47g grassi'],
          calories: '800 kcal',
          price: '15.99',
        ),
      ),
      PiattoColumn(
          dishName: 'Muscle Gain Bowl',
          imagepath: 'assets/terzo.png',
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
    ];

    return Scaffold(
      appBar: _showAppBar
          ? AppBar(
        title: Text('Bello uaglione, bravo.'),
        centerTitle: true,
        titleTextStyle: TextStyle(color: textColor, fontSize: 20),
        leading: Image.asset('assets/logo.png'),
        backgroundColor: secondaryColor,
      )
          : null,
      body: Stack(
        children: [
          Container(
          color: primaryColor,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: font.copyWith(
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
                  ElevatedButton(
                    onPressed: () {showEmailCapDialog(context);},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: const Text("Personalizza il tuo pasto al grammo!"),
                  ),
                  const SizedBox(height: 32),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double maxWidth = constraints.maxWidth;
                      double itemWidth = 350;
                      int itemsPerRow = (maxWidth / itemWidth).floor();
                      itemsPerRow = itemsPerRow < 1 ? 1 : itemsPerRow;

                      return Center(
                        child: Wrap(
                          spacing: 24,
                          runSpacing: 24,
                          alignment: WrapAlignment.center,
                          children: piatti.map((p) {
                            return SizedBox(
                              width: maxWidth < 400 ? maxWidth * 0.9 : itemWidth,
                              child: p,
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ]
          ),
        ),
          Positioned(
            bottom: 24,
            right: 24,
            child: FlutterSocialButton(
              onTap: _launchInstagram,
              buttonType: ButtonType.instagram,
              mini: true,
            ),
          )
      ]),
    );
  }
}


