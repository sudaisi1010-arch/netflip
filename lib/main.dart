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
    const Center(child: Text('Hub & NetFlip VIP Profile', style: TextStyle(color: Colors.white, fontSize: 16))),
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
        // 1. TOP TAB NAVIGATION BAR
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

        // 2. HORIZONTAL STORY & LIVE AVATARS TRAY
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

        // 3. MAIN VIDEO FEED AREA PLACEHOLDER
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
            Icon(
              iconData,
              size: 16,
              color: isSelected ? Colors.white : Colors.white60,
            ),
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
              const CircleAvatar(
                radius: 26,
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.pinkAccent, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                decoration: BoxDecoration(
                  color: Colors.pink,
                  borderRadius: BorderRadius.circular(6),
                ),
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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.cyan, width: 2),
            ),
            child: const CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
          const SizedBox(height: 4),
          Text(username, style: const TextStyle(color: Colors.white, fontSize: 11)),
        ],
      ),
    );
  }
}
