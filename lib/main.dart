import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Lost and Found',
    home: LostFoundPage(),
));
}

class LostFoundPage extends StatelessWidget {
  final List<Map<String, String>> items = [
    {'name': 'Student ID Card', 'location': 'Library', 'status': 'Lost'},
    {'name': 'Black Wallet', 'location': 'Cafeteria', 'status': 'Found'},
    {'name': 'Mobile Phone', 'location': 'Lab 2', 'status': 'Lost'},
    {'name': 'Blue Water Bottle', 'location': 'Classroom 5', 'status': 'Found'},
    {'name': 'Laptop Bag', 'location': 'Auditorium', 'status': 'Lost'},
    {'name': 'Keys', 'location': 'Parking Area', 'status': 'Found'},
    {'name': 'Notebook', 'location': 'Library', 'status': 'Lost'},
    {'name': 'Headphones', 'location': 'Computer Lab', 'status': 'Found'},
  ];

  LostFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Campus Lost & Found'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.search, color: Colors.blue),
              title: Text(item['name']!),
              subtitle: Text(
                'Location: ${item['location']}\n'
                    'Status: ${item['status']}',
              ),
              isThreeLine: true,
              trailing: ElevatedButton(
                child: Text('Details'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ItemDetails(item: item),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final Map<String, String> item;

  const ItemDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.inventory_2, size: 60, color: Colors.blue),
                SizedBox(height: 20),
                Text(
                  item['name']!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12),
                Text('Location: ${item['location']}'),
                SizedBox(height: 8),
                Text('Status: ${item['status']}'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Go Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
}
}
