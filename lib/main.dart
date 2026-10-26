import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pizza Menu',
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFFFBF8F8),
      ),
      home: const PizzaMenuScreen(),
    );
  }
}

class PizzaMenuScreen extends StatelessWidget {
  const PizzaMenuScreen({super.key});

  // Pizza menu data list
  final List<Map<String, String>> pizzas = const [
    {
      "name": "Cheese Pizza",
      "price": "\$5.00",
      "image": "assets/cheese_pizza.jpg",
    },
    {
      "name": "Veggie Pizza",
      "price": "\$6.00",
      "image": "assets/vegetable_pizza.jpg",
    },
    {"name": "Pepperoni", "price": "\$8.00", "image": "assets/fries_pizza.jpg"},
    {
      "name": "Chicken Pizza",
      "price": "\$7.00",
      "image": "assets/cheese_pizza.jpg",
    },
    {"name": "BBQ Pizza", "price": "\$9.00", "image": "assets/fries_pizza.jpg"},
    {
      "name": "Mushroom",
      "price": "\$6.00",
      "image": "assets/vegetable_pizza.jpg",
    },
    {
      "name": "Seafood Pizza",
      "price": "\$10.00",
      "image": "assets/cheese_pizza.jpg",
    },
    {
      "name": "Hawaiian Pizza",
      "price": "\$8.00",
      "image": "assets/vegetable_pizza.jpg",
    },
    {
      "name": "Margherita",
      "price": "\$7.00",
      "image": "assets/fries_pizza.jpg",
    },
    {
      "name": "Meat Pizza",
      "price": "\$9.00",
      "image": "assets/cheese_pizza.jpg",
    },
    {
      "name": "Olive Pizza",
      "price": "\$6.50",
      "image": "assets/vegetable_pizza.jpg",
    },
    {
      "name": "Spicy Pizza",
      "price": "\$7.50",
      "image": "assets/fries_pizza.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEF5350),
        elevation: 0,
        centerTitle: true,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.local_pizza, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Pizza Menu',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Header
              const Text(
                'Choose Your Favorite Pizza!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE57373),
                ),
              ),
              const SizedBox(height: 16),
              // Grid View for Pizzas
              Expanded(
                child: GridView.builder(
                  itemCount: pizzas.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 columns as shown in screenshot
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.68,
                  ),
                  itemBuilder: (context, index) {
                    final pizza = pizzas[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Pizza Image / Icon
                          Expanded(
                            child: Image.asset(
                              pizza['image']!,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.local_pizza,
                                  size: 40,
                                  color: Colors.orangeAccent,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Pizza Name
                          Text(
                            pizza['name']!,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Pizza Price
                          Text(
                            pizza['price']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xFFEF5350),
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
      ),
    );
  }
}
