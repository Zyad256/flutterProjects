import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Profile',
            style: TextStyle(
              fontFamily: 'Edu',
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.purple[900],
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/profilePic.jpg'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Ziad El-tokhy',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Edu',
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  fontFamily: 'Edu',
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Interactive Icons Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  contactIcon(
                    Icons.email,
                    Colors.purple[900]!,
                    () => _launchUrl("mailto:ziadghost550@gmail.com"),
                  ),
                  const SizedBox(width: 28),
                  contactIcon(
                    Icons.phone,
                    Colors.purple[900]!,
                    () => _launchUrl("tel:+201001234567"),
                  ),
                  const SizedBox(width: 28),
                  contactIcon(
                    Icons.location_on,
                    Colors.purple[900]!,
                    () => _launchUrl("https://maps.google.com/?q=Cairo,Egypt"),
                  ),
                  const SizedBox(width: 30),
                  contactIcon(
                    Icons.home,
                    Colors.purple[900]!,
                    () => _launchUrl(
                      "https://www.google.com/maps/place/123+Main+St,+Cairo,+Egypt",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email', style: TextStyle(fontFamily: 'Edu')),
                  SizedBox(width: 20),
                  Text('Phone', style: TextStyle(fontFamily: 'Edu')),
                  SizedBox(width: 20),
                  Text('Location', style: TextStyle(fontFamily: 'Edu')),
                  SizedBox(width: 20),
                  Text('Address', style: TextStyle(fontFamily: 'Edu')),
                ],
              ),
            ],
          ),
        ),

        bottomNavigationBar: BottomAppBar(
          color: Colors.purple[900],
          height: 60,
          child: const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              '© 2025 Ziad Eltokhy',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Reusable function for interactive icons
Widget contactIcon(IconData icon, Color color, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Icon(icon, color: color, size: 40),
  );
}

/// 🔹 Function to launch URLs safely
Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}



