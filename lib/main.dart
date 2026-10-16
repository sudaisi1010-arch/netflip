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
        primaryColor: const Color(0xFF6366F1),
      ),
      home: const MainTabScreen(),
    );
  }
}

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const VideoFeedTab(),
    const PulseFeedTab(),
    const GalleryTab(),
    const HubTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: const Color(0xFF6366F1),
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.play_arrow_rounded), label: 'Flips'),
          BottomNavigationBarItem(icon: Icon(Icons.tag_rounded), label: 'Pulse'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view_rounded), label: 'Gallery'),
          BottomNavigationBarItem(icon: Icon(Icons.forum_rounded), label: 'Hub'),
        ],
      ),
    );
  }
}

class VideoFeedTab extends StatelessWidget {
  const VideoFeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NetFlip Feed'), backgroundColor: Colors.transparent),
      body: const Center(child: Text('Vertical Short Video Feed Ready', style: TextStyle(color: Colors.white70))),
    );
  }
}

class PulseFeedTab extends StatelessWidget {
  const PulseFeedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pulse Threads (X Engine)'), backgroundColor: Colors.transparent),
      body: const Center(child: Text('Real-Time Microblogging Feed Ready', style: TextStyle(color: Colors.white70))),
    );
  }
}

class GalleryTab extends StatelessWidget {
  const GalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gallery (Instagram Engine)'), backgroundColor: Colors.transparent),
      body: const Center(child: Text('Photo & Story Grid Ready', style: TextStyle(color: Colors.white70))),
    );
  }
}

class HubTab extends StatelessWidget {
  const HubTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Community Hub & NetFlip VIP'), backgroundColor: Colors.transparent),
      body: const Center(child: Text('Mobile Money & Credit Card Gateways Ready', style: TextStyle(color: Colors.white70))),
    );
  }
}
