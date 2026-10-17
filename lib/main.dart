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
    const ExploreScreen(),
    const CreatePostScreen(),
    const InboxScreen(),
    const HubScreen(),
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

// ==================== HOME SCREEN ====================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTopTab = 3;

  final List<String> _tabNames = ['Streams', 'Circle', 'Pulse', 'Flips'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTopTab(0, 'Streams', Icons.live_tv_rounded),
              _buildTopTab(1, 'Circle', Icons.people_alt_rounded),
              _buildTopTab(2, 'Pulse', Icons.person_add_alt_1_rounded),
              _buildTopTab(3, 'Flips', Icons.local_fire_department_rounded),
              IconButton(
                icon: const Icon(Icons.search_rounded, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
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
              _buildAddStoryAvatar(context),
            ],
          ),
        ),
        const Divider(color: Colors.white12, height: 1),
        Expanded(
          child: Center(
            child: Text(
              '${_tabNames[_selectedTopTab]} Feed Ready',
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTopTab(int index, String title, IconData iconData) {
    final isSelected = _selectedTopTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTopTab = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
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
          Container(
            height: 3,
            width: 20,
            decoration: BoxDecoration(
              color: isSelected ? Colors.deepPurpleAccent : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddStoryAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePostScreen()),
        );
      },
      child: Padding(
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
      ),
    );
  }
}

// ==================== EXPLORE SCREEN ====================
class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore & Discover',
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                _CategoryChip(label: 'Trending', isSelected: true),
                _CategoryChip(label: 'Gaming'),
                _CategoryChip(label: 'Music'),
                _CategoryChip(label: 'Tech & AI'),
                _CategoryChip(label: 'Sports'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        index.isEven ? Icons.play_circle_outline_rounded : Icons.live_tv_rounded,
                        size: 48,
                        color: Colors.deepPurpleAccent,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Featured Card #${index + 1}',
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Tap to View',
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _CategoryChip({required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Chip(
        backgroundColor: isSelected ? Colors.deepPurpleAccent : const Color(0xFF1E293B),
        label: Text(label, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}

// ==================== CREATE POST SCREEN ====================
class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.video_call_rounded, size: 80, color: Colors.deepPurpleAccent),
            const SizedBox(height: 16),
            const Text(
              'Create New Content',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Share short Flips, long video Streams, or update your Story.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white60, fontSize: 14),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.photo_library_rounded, color: Colors.white),
              label: const Text('Upload from Gallery', style: TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: () {},
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                side: const BorderSide(color: Colors.white38),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.camera_alt_rounded, color: Colors.white),
              label: const Text('Record Camera Video', style: TextStyle(color: Colors.white, fontSize: 16)),
              onPressed: () {},
            ),
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
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: Colors.deepPurpleAccent,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: 'Notifications'),
              Tab(text: 'Messages'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                ListView(
                  padding: const EdgeInsets.all(8.0),
                  children: const [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        child: Icon(Icons.verified_rounded, color: Colors.white),
                      ),
                      title: Text('Welcome to NetFlip!', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Text('Start sharing your video Flips and Streams today.', style: TextStyle(color: Colors.white60)),
                      trailing: Text('Now', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    'No Messages Yet',
                    style: TextStyle(color: Colors.white54, fontSize: 16),
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

// ==================== SEARCH OVERLAY SCREEN ====================
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        title: const TextField(
          autofocus: true,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Search Flips, Creators, or Tags...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Trending Searches',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: const [
                _SearchTag(label: '#NetFlipFlips'),
                _SearchTag(label: '#LiveStreams'),
                _SearchTag(label: '#Gaming'),
                _SearchTag(label: '#Music'),
                _SearchTag(label: '#Tech'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchTag extends StatelessWidget {
  final String label;
  const _SearchTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: const Color(0xFF1E293B),
      label: Text(label, style: const TextStyle(color: Colors.deepPurpleAccent)),
    );
  }
}

// ==================== WALLET & EARNINGS SCREEN ====================
class EarningsWalletScreen extends StatelessWidget {
  const EarningsWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Balance & Earnings', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: const [
                 Text('Total Earnings', style: TextStyle(color: Colors.white60, fontSize: 14)),

                  SizedBox(height: 8),
                  Text('\$0.00', style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Payout Methods', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ListTile(
              tileColor: const Color(0xFF1E293B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              leading: const Icon(Icons.phone_android_rounded, color: Colors.amber),
              title: const Text('Mobile Money (MTN / Airtel)', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Tap to link phone number', style: TextStyle(color: Colors.white54, fontSize: 12)),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
            const SizedBox(height: 8),
            ListTile(
              tileColor: const Color(0xFF1E293B),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              leading: const Icon(Icons.credit_card_rounded, color: Colors.deepPurpleAccent),
              title: const Text('Credit / Debit Card', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Tap to add card details', style: TextStyle(color: Colors.white54, fontSize: 12)),
              trailing: const Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== HUB SCREEN ====================
class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  void _showNetFlipMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            top: 16.0,
            bottom: MediaQuery.of(context).padding.bottom + 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EarningsWalletScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.star_rounded, color: Colors.amber),
                  title: const Text('NetFlip VIP Status', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(color: Colors.white12),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Text('Personal tools', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                ),
                ListTile(
                  leading: const Icon(Icons.download_rounded, color: Colors.white),
                  title: const Text('Offline Videos', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.qr_code_2_rounded, color: Colors.white),
                  title: const Text('Your QR Code', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Navigator.pop(context),
                ),
                const Divider(color: Colors.white12),
                ListTile(
                  leading: const Icon(Icons.video_settings_rounded, color: Colors.deepPurpleAccent),
                  title: const Text('NetFlip Studio', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.settings_rounded, color: Colors.white),
                  title: const Text('Settings and privacy', style: TextStyle(color: Colors.white)),
                  trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingsScreen()),
                    );
                  },
                ),
              ],
            ),
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
          const CircleAvatar(
            radius: 45,
            backgroundColor: Colors.deepPurpleAccent,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text(
            '@username',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              _StatItem(count: '0', label: 'Following'),
              SizedBox(width: 24),
              _StatItem(count: '0', label: 'Followers'),
              SizedBox(width: 24),
              _StatItem(count: '0', label: 'Likes'),
            ],
          ),
          const SizedBox(height: 24),
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

// ==================== SETTINGS SCREEN ====================
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showInfoDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        content: Text(content, style: const TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK', style: TextStyle(color: Colors.deepPurpleAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Settings and privacy', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Account', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13)),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline_rounded, color: Colors.white),
            title: const Text('Account management', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _showInfoDialog(context, 'Account Management', 'Manage your username, phone, email, and password settings.'),
          ),
          ListTile(
            leading: const Icon(Icons.lock_outline_rounded, color: Colors.white),
            title: const Text('Privacy & Security', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _showInfoDialog(context, 'Privacy & Security', 'Configure who can view your content and send direct messages.'),
          ),
          const Divider(color: Colors.white12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Content & Display', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13)),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_none_rounded, color: Colors.white),
            title: const Text('Notifications', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _showInfoDialog(context, 'Notifications', 'Customize push notification preferences for Likes, Comments, and Streams.'),
          ),
          ListTile(
            leading: const Icon(Icons.dark_mode_outlined, color: Colors.white),
            title: const Text('Dark Mode & Theme', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _showInfoDialog(context, 'Dark Mode & Theme', 'NetFlip is set to Dark Theme by default.'),
          ),
          const Divider(color: Colors.white12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text('Support & About', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13)),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline_rounded, color: Colors.white),
            title: const Text('Help Center', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _showInfoDialog(context, 'Help Center', 'Need help? Contact support or read the NetFlip FAQ.'),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline_rounded, color: Colors.white),
            title: const Text('About NetFlip', style: TextStyle(color: Colors.white)),
            trailing: const Icon(Icons.chevron_right, color: Colors.grey),
            onTap: () => _showInfoDialog(context, 'About NetFlip', 'NetFlip v1.0.0 — The ultimate video sharing platform.'),
          ),
        ],
      ),
    );