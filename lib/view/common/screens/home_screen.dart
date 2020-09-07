import 'package:flutter/material.dart';

// utils
import 'package:workplace_clone/utils/styles.dart';

// pages
import 'package:workplace_clone/view/feed/pages/feed_page.dart';
import 'package:workplace_clone/view/group/pages/group_page.dart';
import 'package:workplace_clone/view/menu/pages/menu_page.dart';
import 'package:workplace_clone/view/notification/pages/notification_page.dart';

// screens
import 'package:workplace_clone/view/chat/screens/chat_screen.dart';
import 'package:workplace_clone/view/search/screens/search_screen.dart';
import 'package:workplace_clone/view/welcome/screens/create_groups_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<Icon> _tabIcons = [
    Icon(Icons.featured_play_list),
    Icon(Icons.people),
    Icon(Icons.notifications_none),
    Icon(Icons.menu),
  ];

  TabController _tabController;
  int _currentTabIndex;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: _tabIcons.length);
    _tabController.addListener(
      () => setState(() => _currentTabIndex = _tabController.index),
    );
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 110.0),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabIcons.map((tabIcon) => Tab(icon: tabIcon)).toList(),
          labelColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Color(kWorkplaceMainColor),
            onPressed: () => _openSearchScreen(context),
          ),
          IconButton(
            icon: Icon(Icons.message),
            color: Color(kWorkplaceMainColor),
            onPressed: () => _openChatScreen(context),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          FeedPage(),
          GroupPage(),
          NotificationPage(),
          MenuPage(),
        ],
      ),
      floatingActionButton: _currentTabIndex == 1
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _openNewGroupScreen(context),
            )
          : null,
    );
  }

  _openSearchScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => SearchScreen()),
    );
  }

  _openChatScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ChatScreen()),
    );
  }

  _openNewGroupScreen(BuildContext context) {
    Navigator.push(
      context,
      // TODO: MaterialPageRoute(builder: (_) => NewGroupScreen()),
      MaterialPageRoute(builder: (_) => CreateGroupsScreen()),
    );
  }
}
