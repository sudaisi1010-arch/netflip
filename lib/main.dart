import 'package:flutter/material.dart';

void main() {
  runApp(const NetFlipApp());
}

class NetFlipApp extends StatelessWidget {
  const NetFlipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFlip',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text('Explore (Pulse & Gallery)', style: TextStyle(color: Colors.white, fontSize: 16))),
    const Center(child: Text('Create Post / Upload Video', style: TextStyle(color: Colors.white, fontSize: 16))),
    const Center(child: Text('Inbox & Notifications', style: TextStyle(color: Colors.white, fontSize: 16))),
    const HubScreen(), // Updated Hub Profile Screen with Settings & Assets Menu
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_circle_fill_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_rounded),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_rounded, size: 30),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Hub',
          ),
        ],
      ),
    );
  }
}

// HOME SCREEN WITH TOP NAVIGATION & STORY TRAY
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTopTab('Streams', Icons.live_tv_rounded, false),
              _buildTopTab('Circle', Icons.people_alt_rounded, false),
              _buildTopTab('Pulse', Icons.person_add_alt_1_rounded, false),
              _buildTopTab('Flips', Icons.local_fire_department_rounded, true),
              IconButton(
                icon: const Icon(Icons.search_rounded, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 95,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildAddStoryAvatar(),
              _buildLiveAvatar('baristatimo'),
              _buildStoryAvatar('KASANA'),
              _buildStoryAvatar('Dr Hilary'),
            ],
          ),
        ),
        const Divider(color: Colors.white12, height: 1),
        const Expanded(
          child: Center(
            child: Text(
              'Vertical Short Video Feed Ready',
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildTopTab(String title, IconData iconData, bool isSelected) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(iconData, size: 16, color: isSelected ? Colors.white : Colors.white60),
            const SizedBox(width: 3),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        if (isSelected)
          Container(
            height: 3,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
      ],
    );
  }

  static Widget _buildAddStoryAvatar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(radius: 26, backgroundColor: Colors.blueGrey, child: Icon(Icons.person, color: Colors.white, size: 28)),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(color: Colors.cyan, shape: BoxShape.circle),
                  child: const Icon(Icons.add, size: 14, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          const Text('Create', style: TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }

  static Widget _buildLiveAvatar(String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.pinkAccent, width: 2)),
                child: const CircleAvatar(radius: 24, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(color: Colors.pink, borderRadius: BorderRadius.circular(6)),
                child: const Text('LIVE', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(username, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }

  static Widget _buildStoryAvatar(String username) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.cyan, width: 2)),
            child: const CircleAvatar(radius: 24, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
          ),
          const SizedBox(height: 4),
          Text(username, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }
}

// HUB / PROFILE SCREEN WITH ASSETS & SETTINGS MENU
class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  void _showNetFlipMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAlignment.start,
            children: [
              // Assets Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Assets', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: const Icon(Icons.account_balance_wallet_rounded, color: Colors.white),
                title: const Text('Balance & Earnings', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.star_rounded, color: Colors.amber),
                title: const Text('NetFlip VIP Status', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(color: Colors.white12),

              // Personal Tools Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text('Personal tools', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ),
              ListTile(
                leading: const Icon(Icons.download_rounded, color: Colors.white),
                title: const Text('Offline Videos', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.qr_code_2_rounded, color: Colors.white),
                title: const Text('Your QR Code', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const Divider(color: Colors.white12),

              // Creation & Settings
              ListTile(
                leading: const Icon(Icons.video_settings_rounded, color: Colors.deepPurpleAccent),
                title: const Text('NetFlip Studio', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings_rounded, color: Colors.white),
                title: const Text('Settings and privacy', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('NetFlip Hub', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu_rounded, size: 28),
            onPressed: () => _showNetFlipMenu(context),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          // Profile Avatar & Handle
          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            '@netflip_creator',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _StatItem(count: '14', label: 'Following'),
              SizedBox(width: 24),
              _StatItem(count: '128', label: 'Followers'),
              SizedBox(width: 24),
              _StatItem(count: '340', label: 'Likes'),
            ],
          ),
          const SizedBox(height: 24),
          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E293B),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () {},
                child: const Text('Edit Profile'),
              ),
              const SizedBox(width: 12),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white38),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                onPressed: () => _showNetFlipMenu(context),
                child: const Text('Assets & Tools'),
              ),
            ],
          ),
          const Divider(height: 40, color: Colors.white12),
          // Videos Grid Placeholder
          const Expanded(
            child: Center(
              child: Text(
                'Your Uploaded Videos & Flips',
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
      ],
    );
  }
}
