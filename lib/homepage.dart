import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<Map<String, String>> contacts = [];

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirmation"),
        content: Text("Are you sure you want to delete this contact?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), // Cancel
            child: Icon(Icons.close),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                contacts.removeAt(index);
              });
              Navigator.pop(context); // Close dialog
            },
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Name"),
                prefixIcon: Icon(Icons.person),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => nameController.clear(),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Number"),
                prefixIcon: Icon(Icons.phone),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () => numberController.clear(),
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final name = nameController.text.trim();
                final number = numberController.text.trim();

                if (name.isNotEmpty && number.isNotEmpty) {
                  setState(() {
                    contacts.add({"name": name, "number": number});
                  });
                  nameController.clear();
                  numberController.clear();
                }
              },
              child: Text("Add"),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.group),
                    title: Text(contacts[index]['name']!),
                    subtitle: Text(contacts[index]['number']!),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _showDeleteDialog(index),
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
