import 'package:flutter/material.dart';
import '../main.dart';

class FriendsListScreen extends StatefulWidget {
  const FriendsListScreen({super.key});

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  final _friendsStream =
      supabase.from('friends').stream(primaryKey: ['id']).order('id');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  // New controller for search
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _showAddFriendDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF0D0D0D),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text(
          "Add Friend",
          style: TextStyle(
            color: Color(0xFFFF4D4D),
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _field(_nameController, "Full Name"),
            _field(_courseController, "Course"),
            _field(_yearController, "Year Level"),
            _field(_sexController, "Sex"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                const Text("Cancel", style: TextStyle(color: Colors.white54)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF4D4D),
              foregroundColor: Colors.white,
            ),
            onPressed: _addFriend,
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  Widget _field(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white54),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFF4D4D)),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Future<void> _addFriend() async {
    await supabase.from('friends').insert({
      'name': _nameController.text,
      'course': _courseController.text,
      'sex': _sexController.text,
      'year_level': _yearController.text,
    });

    _nameController.clear();
    _courseController.clear();
    _sexController.clear();
    _yearController.clear();

    Navigator.pop(context);
  }

  Widget _friendRow(Map friend) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Color(0xFFFF4D4D),
            child: Icon(Icons.person, color: Colors.white),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  friend['name'] ?? '',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  "${friend['course']} • ${friend['year_level']} • ${friend['sex']}",
                  style:
                      const TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white38),
            onPressed: () =>
                supabase.from('friends').delete().eq('id', friend['id']),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "My Friends",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4D4D),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.person_add,
                    color: Color(0xFFFF4D4D), size: 32),
                onPressed: _showAddFriendDialog,
              )
            ],
          ),
          const SizedBox(height: 20),

          // ✅ Search Field
          TextField(
            controller: _searchController,
            onChanged: (value) => setState(() {
              _searchQuery = value.toLowerCase();
            }),
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search by name...",
              hintStyle: const TextStyle(color: Colors.white54),
              prefixIcon: const Icon(Icons.search, color: Colors.white54),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xFFFF4D4D)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _friendsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                // Filter by search query
                final friends = snapshot.data!.where((friend) {
                  final name = (friend['name'] ?? '').toString().toLowerCase();
                  return name.contains(_searchQuery);
                }).toList();

                if (friends.isEmpty) {
                  return const Center(
                    child: Text(
                      "No friends found",
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    return _friendRow(friends[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
