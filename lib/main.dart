import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Campus Lost & Found',
  debugShowCheckedModeBanner: false,
  theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
  home: const ItemListScreen(),
));

class Item {
  final String name, location, description, date, contact;
  final bool isLost;
  const Item(this.name, this.location, this.isLost, this.description, this.date, this.contact);
  String get status => isLost ? 'Lost' : 'Found';
}

const items = [
  Item('Black Backpack', 'Library, 2nd Floor', true, 'Black backpack with a blue zip.', '24 Oct 2026', 'Student Affairs Office'),
  Item('Scientific Calculator', 'Block A, Room 12', false, 'Casio fx-991 with a name sticker.', '25 Oct 2026', 'Block A Reception'),
  Item('Student ID Card', 'Cafeteria', false, 'Found on a table near the counter.', '26 Oct 2026', 'Cafeteria Manager'),
  Item('Silver Wrist Watch', 'Sports Ground', true, 'Silver watch with a brown strap.', '22 Oct 2026', 'Sports Office'),
  Item('USB Flash Drive', 'Computer Lab 1', false, '32 GB red USB drive.', '27 Oct 2026', 'Lab Assistant'),
  Item('Blue Umbrella', 'Main Gate', true, 'Large blue umbrella with a wooden handle.', '23 Oct 2026', 'Security Desk'),
  Item('Prescription Glasses', 'Lecture Hall 3', false, 'Black-framed glasses in a grey case.', '28 Oct 2026', 'Admin Office'),
  Item('House Keys', 'Parking Area', true, 'Three keys on a green keychain.', '21 Oct 2026', 'Security Desk'),
  Item('Water Bottle', 'Gym', false, 'Steel silver bottle with a dent.', '28 Oct 2026', 'Gym Reception'),
  Item('Calculus Notebook', 'Block B, Corridor', true, 'Yellow notebook with calculus notes.', '26 Oct 2026', 'Block B Reception'),
];

Widget statusChip(Item item) => Chip(
  label: Text(item.status),
  backgroundColor: item.isLost ? Colors.red.shade100 : Colors.green.shade100,
);

class ItemListScreen extends StatelessWidget {
  const ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Lost & Found'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Expanded(
                      child: Text(item.name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    statusChip(item),
                  ]),
                  Row(children: [
                    const Icon(Icons.location_on, size: 18),
                    const SizedBox(width: 4),
                    Expanded(child: Text(item.location)),
                  ]),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      child: const Text('View Details'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ItemDetailsScreen(item: item)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final Item item;
  const ItemDetailsScreen({super.key, required this.item});

  Widget row(IconData icon, String label, String value) => ListTile(
    leading: Icon(icon),
    title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
    subtitle: Text(value, style: const TextStyle(fontSize: 16, color: Colors.black)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(item.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Align(alignment: Alignment.centerLeft, child: statusChip(item)),
          const Divider(),
          row(Icons.location_on, 'Location', item.location),
          row(Icons.calendar_today, 'Date', item.date),
          row(Icons.description, 'Description', item.description),
          row(Icons.contact_phone, 'Contact', item.contact),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Back to List'),
          ),
        ],
      ),
    );
  }
}