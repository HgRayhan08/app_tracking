import 'package:app_tracking/presentasion/providers/user_data/user_data_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(userDataProvider.notifier).logout();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        children: [
          const CircleAvatar(
            radius: 70,
          ),
          SizedBox(height: height * 0.01),
          const Center(
            child: Text("Bagus Maulana"),
          ),
          SizedBox(height: height * 0.02),
          const MenuProfile(
            icon: Icon(Icons.edit),
            title: "Edit Profile",
          ),
          const MenuProfile(
            icon: Icon(Icons.settings),
            title: "Setting",
          ),
          const MenuProfile(
            icon: Icon(Icons.language),
            title: "Bahasa",
          ),
          const MenuProfile(
            icon: Icon(Icons.policy),
            title: "Kebijakan Aplikasi",
          ),
          const MenuProfile(
            icon: Icon(Icons.help),
            title: "Bantuan",
          ),
        ],
      ),
    );
  }
}

class MenuProfile extends StatelessWidget {
  final String title;
  final Icon icon;
  const MenuProfile({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      trailing: Icon(
        Icons.arrow_right,
        size: 50,
      ),
    );
  }
}
