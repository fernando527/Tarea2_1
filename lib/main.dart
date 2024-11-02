import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool pushNotificationsEnabled = true;
  bool faceIdEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 60),
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/imagen1.jpeg'),
          ),
          const SizedBox(height: 10),
          const Text(
            'theunshackled',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            'fj.murillo@icloud.com',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Edit profile',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sección de "Inventories"
                const Text(
                  'Inventories',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    children: [
                      SectionItem(
                        icon: Icons.store,
                        titleWidget: Row(
                          children: [
                            Text(
                              'My stores',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 6),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.green,
                              child: Text(
                                '2',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.arrow_forward_rounded,
                            color: Colors.black, size: 16),
                      ),
                      Divider(),
                      SectionItem(
                        icon: Icons.support_agent,
                        titleWidget: Text(
                          'Support',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(Icons.arrow_forward_rounded,
                            color: Colors.black, size: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                const Text(
                  'Preferences',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        child: SectionItem(
                          icon: Icons.notifications,
                          titleWidget: const Text(
                            'Push notifications',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Switch(
                            value: pushNotificationsEnabled,
                            onChanged: (value) {
                              setState(() {
                                pushNotificationsEnabled = value;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 30,
                        child: SectionItem(
                          icon: Icons.face,
                          titleWidget: const Text(
                            'Face ID',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Switch(
                            value: faceIdEnabled,
                            onChanged: (value) {
                              setState(() {
                                faceIdEnabled = value;
                              });
                            },
                            activeColor: Colors.green,
                          ),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 30,
                        child: SectionItem(
                          icon: Icons.lock,
                          titleWidget: Text(
                            'PIN Code',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          trailing: Icon(Icons.arrow_forward_rounded,
                              color: Colors.black, size: 16),
                        ),
                      ),
                      const Divider(),
                      SizedBox(
                        height: 30,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Row(
                            children: [
                              Icon(Icons.logout, color: Colors.red),
                              SizedBox(width: 20),
                              Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionItem extends StatelessWidget {
  final IconData icon;
  final Widget titleWidget;
  final Widget? trailing;

  const SectionItem(
      {required this.icon, required this.titleWidget, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.black),
        SizedBox(width: 20),
        Expanded(child: titleWidget),
        if (trailing != null) trailing!,
      ],
    );
  }
}
