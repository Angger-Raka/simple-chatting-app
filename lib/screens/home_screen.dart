import 'package:test_chatting/pages/calls_page.dart';
import 'package:test_chatting/pages/contacts_page.dart';
import 'package:test_chatting/pages/message_page.dart';
import 'package:test_chatting/pages/notifications_page.dart';
import 'package:test_chatting/pages/profile_pages.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
    ProfilePage()
  ];
  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[index],
        bottomNavigationBar: SafeArea(
          child: _BottomNavigationBar(
            onItemsSelected: (i) {
              setState(() {
                index = i;
              });
            },
          ),
        ));
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemsSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemsSelected;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavigatiionBarItem(
              index: 0,
              label: "Home",
              icon: Icons.home,
              onTap: onItemsSelected,
            ),
            _NavigatiionBarItem(
              index: 1,
              label: "Messaging",
              icon: Icons.message,
              onTap: onItemsSelected,
            ),
            _NavigatiionBarItem(
              index: 2,
              label: "Order",
              icon: Icons.shop,
              onTap: onItemsSelected,
            ),
            _NavigatiionBarItem(
              index: 3,
              label: "Delivery",
              icon: Icons.delivery_dining,
              onTap: onItemsSelected,
            ),
            _NavigatiionBarItem(
              index: 4,
              label: "Profile",
              icon: Icons.person,
              onTap: onItemsSelected,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigatiionBarItem extends StatelessWidget {
  const _NavigatiionBarItem({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final ValueChanged<int> onTap;
  final int index;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 25,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
