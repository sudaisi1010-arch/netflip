import 'package:flutter/material.dart';

void main() {
  runApp(const NetFlipApp());
}

class NetFlipApp extends StatelessWidget {
  const NetFlipApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetFlip VIP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF141414),
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
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const CreateScreen(),
    const InboxScreen(),
    const HubScreen(),
  ];

  void _openAssetsAndSettingsDrawer(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E1E1E),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.75,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Assets & Settings',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Wallet & VIP Banner
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Available Balance',
                                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                                  SizedBox(height: 4),
                                  Text('\$0.00',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.amber.withOpacity(0.2),
                                  border: Border.all(color: Colors.amber),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text('VIP Active',
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              )
                            ],
                          ),
                          const Divider(color: Colors.white12, height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _drawerStatItem('Followers', '0'),
                              _drawerStatItem('Following', '0'),
                              _drawerStatItem('Total Likes', '0'),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Creator Tools',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ListTile(
                      leading: const Icon(Icons.analytics_outlined, color: Colors.redAccent),
                      title: const Text('Analytics Dashboard', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Track reach, views, and engagement', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        _showDetailDialog(context, 'Analytics', 'Views: 0\nReach: 0\nEngagement Rate: 0%');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.monetization_on_outlined, color: Colors.green),
                      title: const Text('Monetization & Payouts', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Manage payouts and earnings', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        _showDetailDialog(context, 'Monetization', 'Payout Threshold: \$50.00\nCurrent Status: Verified VIP Creator');
                      },
                    ),
                    const Divider(color: Colors.white12),
                    const Text('Preferences & Account',
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    ListTile(
                      leading: const Icon(Icons.person_outline, color: Colors.blueAccent),
                      title: const Text('Profile Settings', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('Update bio, avatar, and handle', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        _showDetailDialog(context, 'Profile Settings', 'Username: @netflip_vip\nStatus: Online\nBio: NetFlip VIP Content Creator');
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.security_outlined, color: Colors.orangeAccent),
                      title: const Text('Privacy & Security', style: TextStyle(color: Colors.white)),
                      subtitle: const Text('2FA, blocked users, login activity', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                      onTap: () {
                        _showDetailDialog(context, 'Security', '2FA Status: Enabled\nActive Sessions: 1 Device');
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _drawerStatItem(String label, String count) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ],
    );
  }

  void _showDetailDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: Text(content, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close', style: TextStyle(color: Colors.redAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF141414),
        selectedItemColor: Colors.redAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 4) {
            _openAssetsAndSettingsDrawer(context);
          } else {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline, size: 30),
            activeIcon: Icon(Icons.add_circle, size: 30),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            activeIcon: Icon(Icons.mail),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            activeIcon: Icon(Icons.grid_view),
            label: 'Hub',
          ),
        ],
      ),
    );
  }
}

// ==================== HOME SCREEN ====================
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onStoryTap(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening $title live story...'),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF141414),
          elevation: 0,
          title: const Text(
            'NETFLIP',
            style: TextStyle(
              color: Colors.redAccent,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white),
              onPressed: () {},
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.redAccent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Streams'),
              Tab(text: 'Circle'),
              Tab(text: 'Pulse'),
              Tab(text: 'Flips'),
            ],
          ),
        ),
        body: Column(
          children: [
            // Avatar Tray (Live / Story circles)
            SizedBox(
              height: 95,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                itemCount: 8,
                itemBuilder: (context, index) {
                  final label = index == 0 ? 'Your Live' : 'Creator $index';
                  return GestureDetector(
                    onTap: () => _onStoryTap(context, label),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: Column(
                        children: [
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: index == 0
                                    ? [Colors.red, Colors.deepOrange]
                                    : [Colors.purpleAccent, Colors.redAccent],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.5),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey[900],
                                child: Icon(
                                  index == 0 ? Icons.add_a_photo : Icons.person,
                                  color: Colors.white70,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            label,
                            style: const TextStyle(color: Colors.white70, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(color: Colors.white12, height: 1),
            // Feed Content Tabs View
            Expanded(
              child: TabBarView(
                children: [
                  _buildFeedView('Live Streams Feed'),
                  _buildFeedView('Circle Community Posts'),
                  _buildFeedView('Pulse Activity Feed'),
                  _buildFeedView('Flips Short Videos'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedView(String title) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF2A2A2A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black26,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.play_circle_fill,
                      color: Colors.redAccent.withOpacity(0.9),
                      size: 56,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  '$title #${index + 1}',
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Interactive stream channel content running inside NetFlip VIP platform.',
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==================== EXPLORE SCREEN ====================
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        title: const Text('Explore', style: TextStyle(color: Colors.white)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.85,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.explore_outlined, color: Colors.redAccent, size: 38),
                const SizedBox(height: 8),
                Text('Channel $index',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// ==================== CREATE SCREEN ====================
class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        title: const Text('Create Content', style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.video_call, size: 70, color: Colors.redAccent),
            SizedBox(height: 16),
            Text('Record or Upload Streams & Flips',
                style: TextStyle(color: Colors.white, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// ==================== INBOX SCREEN ====================
class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        title: const Text('Inbox', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.notifications, color: Colors.white, size: 20)),
            title: Text('Activity Alert #${index + 1}',
                style: const TextStyle(color: Colors.white)),
            subtitle: const Text('You received an update on your live channel.',
                style: TextStyle(color: Colors.grey, fontSize: 12)),
            trailing: const Text('Just now',
                style: TextStyle(color: Colors.grey, fontSize: 11)),
          );
        },
      ),
    );
  }
}

// ==================== HUB SCREEN ====================
class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF141414),
        title: const Text('Hub', style: TextStyle(color: Colors.white)),
      ),
      body: const Center(
        child: Text('Creator Community Hub',
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
