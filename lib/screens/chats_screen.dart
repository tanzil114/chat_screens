import 'package:chat_screens/screens/Chat_room_screen.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image(
              image: AssetImage('assets/icons/profile.png'),
            ),
          ),
        ],
        backgroundColor: Color(0xFF5879EE),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child:
              Text('MESSAGES', style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onTap,
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                      'assets/icons/Icon-material-chat_bubble_outline.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/Icon-feather-phone-call.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/Icon-feather-plus.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/Icon-feather-users.png'),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/icons/Icon-feather-settings.png'),
                ),
                label: ''),
          ],
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 24, bottom: 24),
              decoration: BoxDecoration(
                  color: Color(0xFF5879EE),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36))),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/icons/search.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                    Image(
                      image: AssetImage('assets/icons/profile.png'),
                      width: 55,
                      height: 55,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ChatContainer();
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 20)),
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() => _currentIndex = index);
  }
}

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 8.0),
            child: Image(
              image: AssetImage('assets/icons/profile.png'),
              width: 55,
              height: 55,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatRoomScreen())),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Julian Dasilva',
                  style: TextStyle(
                    color: Color(0xFF6180F2),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Hi Julian! See you after work?',
                    style: TextStyle(
                      color: Color(0xFF828181),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '12:00',
                style: TextStyle(
                  color: Color(0xFFA2A2A2),
                  fontSize: 13,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF6180F2),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    '2',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
