import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final List<MenuWidgetData> menuRow = [
    MenuWidgetData('Favorites', Icons.favorite_outline),
    MenuWidgetData('Recent calls', Icons.call),
    MenuWidgetData('Devices', Icons.computer),
    MenuWidgetData('Folder with chats', Icons.folder),
  ];

  final List<MenuWidgetData> secondMenuRow = [
    MenuWidgetData('Notifications and sounds', Icons.notifications_active_outlined),
    MenuWidgetData('Data and memory', Icons.memory),
    MenuWidgetData('Privacy', Icons.privacy_tip_outlined),
    MenuWidgetData('Decor', Icons.brush),
    MenuWidgetData('Language', Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffefeef1),
      appBar: AppBar(
        title: Center(
          child: Text(
            'Settings',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                _UserInfoWidget(),
              ],
            ),
            SizedBox(height: 20),
            _MenuWidget(menuRow: menuRow),
            SizedBox(height: 20),
            _MenuWidget(menuRow: secondMenuRow),
          ],
        ),
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final List<MenuWidgetData> menuRow;

  const _MenuWidget({
    super.key, required this.menuRow
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: menuRow.map((row) => _MenuWidgetRow(data: row)).toList(),
      ),
    );
  }
}

class MenuWidgetData {
  final String title;
  final IconData icon;

  const MenuWidgetData(this.title, this.icon);
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuWidgetData data;

  const _MenuWidgetRow({
    super.key, required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffefeef1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(width: 10),
          Expanded(child: Text(data.title)),
          Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 30),
          _AvatarWidget(),
          SizedBox(height: 10),
          _UserNameWidget(),
          SizedBox(height: 10),
          _UserPhoneWidget(),
          SizedBox(height: 10),
          UserNicknameWidget(),
        ],
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.asset('images/gojo.png'),
      ),
    );
  }
}

class UserNicknameWidget extends StatelessWidget {
  const UserNicknameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '@SixEyes',
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '+1(234)456-789-98',
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Gojo <SixEyes> Satoru',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    );
  }
}
