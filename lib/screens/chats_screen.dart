import 'package:chat_screens/elements/rounded_asset_image.dart';
import 'package:chat_screens/screens/Chat_room_screen.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _currentIndex = 0;
  List<Map> userDetails = [
    {
      'name': 'Julian Disilva',
      'imageUrl': 'https://i.pravatar.cc/150?img=4',
      'message': 'Hi brother! See you after work?',
      'unread': 2,
      'time': '12:00',
    },
    {
      'name': 'Mike Lyne',
      'imageUrl': 'https://i.pravatar.cc/150?img=6',
      'message': 'I must tell you my interview this...',
      'unread': 3,
      'time': '09:36',
    },
    {
      'name': 'Claire Kumas',
      'imageUrl': 'https://i.pravatar.cc/150?img=7',
      'message': 'Yes I can do this to you in the...',
      'unread': 1,
      'time': '06:44',
    },
    {
      'name': 'Blair Dota',
      'imageUrl': 'https://i.pravatar.cc/150?img=8',
      'message': 'By the way, did not you see my...',
      'unread': 0,
      'time': 'Yesterday',
    },
    {
      'name': 'Molly Clark',
      'imageUrl': 'https://i.pravatar.cc/150?img=9',
      'message': 'Yes I am so happy! :)',
      'unread': 0,
      'time': 'Yesterday',
    },
    {
      'name': 'Ashley Williams',
      'imageUrl': 'https://i.pravatar.cc/150?img=10',
      'message': 'I\'ll be there this weekend with my...',
      'unread': 0,
      'time': 'Jan 12',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          color: Color(0xFF5879EE),
          padding: const EdgeInsets.only(top: 20.0),
          child: AppBar(
            actions: [
              IconButton(
                onPressed: () {},
                icon: RoundedNetworkImage(
                    imageUrl: 'https://i.pravatar.cc/150?img=12g',
                    width: 35,
                    height: 35),
              ),
            ],
            backgroundColor: Color(0xFF5879EE),
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Text('MESSAGES',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
            centerTitle: true,
            elevation: 0,
          ),
        ),
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
              padding: EdgeInsets.only(bottom: 36, left: 8.0, right: 8.0),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RoundedAssetImage(
                          imagePath: 'assets/icons/search.png'),
                    ),
                    Row(
                      children: userDetails
                          .map((e) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: RoundedNetworkImage(
                                    imageUrl: e['imageUrl']),
                              ))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ChatContainer(userDetail: userDetails[index]);
                  },
                  separatorBuilder: (context, index) => Divider(),
                  itemCount: userDetails.length),
            )),
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
  ChatContainer({
    Key key,
    this.userDetail,
  }) : super(key: key);
  final Map userDetail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 16.0),
            child: RoundedNetworkImage(
              imageUrl: userDetail['imageUrl'],
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ChatRoomScreen())),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userDetail['name'],
                  style: TextStyle(
                    color: Color(0xFF6180F2),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    userDetail['message'],
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
                userDetail['time'],
                style: TextStyle(
                  color: Color(0xFFA2A2A2),
                  fontSize: 13,
                ),
              ),
              userDetail['unread'] != 0
                  ? Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF6180F2),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Text(
                          userDetail['unread'].toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ],
          )
        ],
      ),
    );
  }
}
