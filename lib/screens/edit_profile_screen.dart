import 'package:flutter/material.dart';
import '../widgets.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentBio;
  final String currentEmail;
  final Function(String, String, String) onSave;

  const EditProfileScreen({
    super.key,
    required this.currentName,
    required this.currentBio,
    required this.currentEmail,
    required this.onSave,
  });

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _bioController = TextEditingController(text: widget.currentBio);
    _emailController = TextEditingController(text: widget.currentEmail);
  }

  void _showSaveDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Save Changes?"),
          content: const Text("Do you want to update your profile information?"),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
            ElevatedButton(
              onPressed: () {
                widget.onSave(_nameController.text, _bioController.text, _emailController.text);
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Requirement: Navigator.pop to return
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Profile Updated!")));
              },
              child: const Text("Confirm"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile"), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SectionHeader(title: "Edit Details"),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Full Name", border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? "Name cannot be empty" : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                validator: (val) => !val!.contains("@") ? "Enter a valid email" : null,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: "Bio", border: OutlineInputBorder()),
                validator: (val) => val!.isEmpty ? "Bio cannot be empty" : null,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D4D), 
                  padding: const EdgeInsets.all(15),
                  foregroundColor: Colors.white,
                ),
                onPressed: _showSaveDialog,
                child: const Text("Update Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}