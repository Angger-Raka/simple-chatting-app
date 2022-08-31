import 'package:test_chatting/helper.dart';
import 'package:test_chatting/pages/calls_page.dart';
import 'package:test_chatting/pages/contacts_page.dart';
import 'package:test_chatting/pages/message_page.dart';
import 'package:test_chatting/pages/notifications_page.dart';
import 'package:test_chatting/pages/profile_pages.dart';
import 'package:flutter/material.dart';
import 'package:test_chatting/theme.dart';
import 'package:test_chatting/widgets/avatar.dart';
import 'package:test_chatting/widgets/icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> title = ValueNotifier("Messages");

  final pages = const [
    MessagePage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
    ProfilePage()
  ];

  final pageTitles = const [
    'Message',
    'Notification',
    'Call',
    'Contacts',
    'Profile'
  ];

  void _onNavigationItemSelected(index) {
    title.value = pageTitles[index];
    pageIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).iconTheme,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: ValueListenableBuilder(
            valueListenable: title,
            builder: (BuildContext context, String value, _) {
              return Center(
                child: Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              );
            },
          ),
          leadingWidth: 50,
          leading: Align(
            alignment: Alignment.centerRight,
            child: IconBackground(
              icon: Icons.search,
              onTap: () {
                print('TODO SEARCHING');
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Avatar.small(imageUrl: Helpers.randomPictureUrl()),
            )
          ],
        ),
        body: ValueListenableBuilder(
          valueListenable: pageIndex,
          builder: (BuildContext context, int value, _) {
            return pages[value];
          },
        ),
        bottomNavigationBar: SafeArea(
          child: _BottomNavigationBar(
            onItemsSelected: _onNavigationItemSelected,
          ),
        ));
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({
    Key? key,
    required this.onItemsSelected,
  }) : super(key: key);

  final ValueChanged<int> onItemsSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemsSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Card(
      color: (brightness == Brightness.light) ? Colors.transparent : null,
      elevation: 0,
      margin: const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavigatiionBarItem(
                  index: 0,
                  label: "Home",
                  icon: Icons.home,
                  isSelected: (selectedIndex == 0),
                  onTap: handleItemSelected,
                ),
                _NavigatiionBarItem(
                  index: 1,
                  label: "Messaging",
                  icon: Icons.message,
                  isSelected: (selectedIndex == 1),
                  onTap: handleItemSelected,
                ),
                _NavigatiionBarItem(
                  index: 2,
                  label: "Order",
                  icon: Icons.shop,
                  isSelected: (selectedIndex == 2),
                  onTap: handleItemSelected,
                ),
                _NavigatiionBarItem(
                  index: 3,
                  label: "Delivery",
                  icon: Icons.delivery_dining,
                  isSelected: (selectedIndex == 3),
                  onTap: handleItemSelected,
                ),
                _NavigatiionBarItem(
                  index: 4,
                  label: "Profile",
                  icon: Icons.person,
                  isSelected: (selectedIndex == 4),
                  onTap: handleItemSelected,
                ),
              ],
            ),
          ),
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
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final ValueChanged<int> onTap;
  final bool isSelected;
  final int index;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
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
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary)
                  : const TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
