import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                    radius: 40,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bassirou Gueye',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'gueyebassirou@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Modify'),
              subtitle: const Text('Tap to change your data'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Appearance'),
              subtitle: const Text('Make Teachly App yours'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.fingerprint),
              title: const Text('Privacy'),
              subtitle: const Text('Lock Teachly App to improve your privacy'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.brightness_4),
              title: const Text('Dark mode'),
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              subtitle: const Text('Learn more about Teachly App'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text('Send Feedback'),
              subtitle: const Text(
                  'Let us know how we can make Teachly App'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sign Out'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}