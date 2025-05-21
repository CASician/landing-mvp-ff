import 'package:flutter/material.dart';
import 'package:mvp_ff/inserisci_email.dart';

import 'env.dart';

enum DietType { dimagrimento, mantenimento, massa }

class PiattoColumn extends StatefulWidget {
  final String dishName;
  final String imagepath;
  final DishData dimagrimentoData;
  final DishData mantenimentoData;
  final DishData massaData;

  const PiattoColumn({
    super.key,
    required this.dishName,
    required this.imagepath,
    required this.dimagrimentoData,
    required this.mantenimentoData,
    required this.massaData
  });

  @override
  State<PiattoColumn> createState() => _PiattoColumnState();
}
class _PiattoColumnState extends State<PiattoColumn> {
  late DishData currentData;
  DietType selected = DietType.mantenimento;


  @override
  void initState() {
    super.initState();
    currentData = widget.massaData;
  }

  void selectDiet(DietType type) {
    setState(() {
      selected = type;
      switch (type) {
        case DietType.massa:
          currentData = widget.massaData;
          break;
        case DietType.mantenimento:
          currentData = widget.mantenimentoData;
          break;
        case DietType.dimagrimento:
          currentData = widget.dimagrimentoData;
          break;
      }
    });
  }


  Widget buildDietButton(String label, DietType type) {
    final isSelected = selected == type;
    return Expanded(
      child: GestureDetector(
        onTap: () => selectDiet(type),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.black : Colors.grey[800],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            showEmailCapDialog(context);
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Env.secondaryColor,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(8, 8),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    buildDietButton("DIMAGRIMENTO", DietType.dimagrimento),
                    buildDietButton("MANTENIMENTO", DietType.mantenimento),
                    buildDietButton("MASSA", DietType.massa),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  widget.dishName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Image.asset(widget.imagepath),
                const SizedBox(height: 12),
                ...currentData.ingredients.map(
                  (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item['name']!, style: const TextStyle(fontSize: 14)),
                        Text(
                          item['grams']!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        '${currentData.calories}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                      currentData.macros
                          .map(
                            (m) => Expanded(
                              child: Center(
                                child: Text(
                                  m,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
                const SizedBox(height: 8),
                Text(
                  '€ ${currentData.price}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class DishData {
  final List<Map<String, String>> ingredients;
  final String price;
  final String calories;
  final List<String> macros;

  DishData({
    required this.ingredients,
    required this.price,
    required this.calories,
    required this.macros,
  });
}



