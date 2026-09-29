import 'package:flutter/material.dart';

import '../models/animal_model.dart';

class DetailPage extends StatelessWidget {
  final Animal animal;

  const DetailPage({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              animal.image,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 250,
                child: Center(child: Icon(Icons.broken_image, size: 50)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    animal.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Type: ${animal.type}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Animal Details:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Height: ${animal.height} cm',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Weight: ${animal.weight} kg',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text('Habitat: ', style: TextStyle(fontSize: 16)),
                      Text(
                        animal.habitat.join(', '),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Animal Activities:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: animal.activities
                        .map(
                          (act) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outline,
                                  size: 18,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 8),
                                Text(act, style: const TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
