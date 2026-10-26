import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PizzaMenuScreen(),
    );
  }
}

class PizzaMenuScreen extends StatelessWidget {
  const PizzaMenuScreen({super.key});

  static const List<Map<String, String>> pizzas = [
    {
      'name': 'vegetable pizza',
      'price': '\$15.5',
      'image': 'assets/vegetable_pizza.jpg',
    },
    {
      'name': 'cheese pizza',
      'price': '\$3.5',
      'image': 'assets/cheese_pizza.jpg',
    },
    {
      'name': 'fries pizza',
      'price': '\$2.5',
      'image': 'assets/fries_pizza.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(28, 14, 12, 14),
              child: Text(
                'Creating a pizza Menu',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ),

            // Orange menu header
            Container(
              width: double.infinity,
              height: 67,
              margin: const EdgeInsets.symmetric(horizontal: 33),
              alignment: Alignment.center,
              color: const Color(0xFFFF9800),
              child: const Text(
                'pizza place menu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),

            const SizedBox(height: 4),
 
            // Pizza menu items
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 33),
                itemCount: pizzas.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 8,
                    thickness: 1,
                    color: Color(0xFFEEEEEE),
                  );
                },
                itemBuilder: (context, index) {
                  final pizza = pizzas[index];

                  return SizedBox(
                    height: 112,
                    child: Row(
                      children: [
                        // Pizza image
                        Container(
                          width: 98,
                          height: 112,
                          color: const Color(0xFFF5F5F5),
                          padding: const EdgeInsets.all(3),
                          child: ClipOval(
                            child: Image.asset(
                              pizza['image']!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.local_pizza,
                                  size: 65,
                                  color: Colors.deepOrange,
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(width: 9),

                        // Pizza name and price
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                pizza['name']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                pizza['price']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
