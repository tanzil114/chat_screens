import 'package:chat_screens/elements/rounded_asset_image.dart';
import 'package:flutter/material.dart';

enum msgType { text, image, audio, video }

class ChatRoomScreen extends StatefulWidget {
  @override
  _ChatRoomScreenState createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  List<Map> messages = [
    {
      'userId': 1,
      'text': 'Hi Ankur! What’s Up?',
      'datetime': 'Yesterday 14:26 PM',
      'isRead': true,
      'type': msgType.text,
      'image': 'https://i.pravatar.cc/150?img=4'
    },
    {
      'userId': 2,
      'text':
          'Oh, hello! All perfectly fine I\'m just heading out for something',
      'datetime': 'Yesterday 14:38 PM',
      'isRead': true,
      'type': msgType.text,
      'image': 'https://i.pravatar.cc/150?img=12'
    },
    {
      'userId': 1,
      'text': null,
      'datetime': 'Yesterday 14:44 PM',
      'isRead': true,
      'type': msgType.audio,
      'image': 'https://i.pravatar.cc/150?img=4'
    },
    {
      'userId': 2,
      'text': 'Yeah sure I\'ll be there this weekend with my brother',
      'datetime': 'Yesterday 14:50 PM',
      'isRead': false,
      'type': msgType.text,
      'image': 'https://i.pravatar.cc/150?img=12'
    },
    {
      'userId': 1,
      'text': 'Yes I Am So Happy :)',
      'datetime': 'Yesterday 14:26 PM',
      'isRead': true,
      'type': msgType.text,
      'image': 'https://i.pravatar.cc/150?img=4'
    }
  ];

  int _currentUser = 2;
  bool sentByCurrentUser = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
            color: Color(0xFF5879EE),
          ),
          padding: const EdgeInsets.only(top: 20.0, bottom: 30),
          child: AppBar(
            backgroundColor: Color(0xFF5879EE),
            title: HeaderContainer(),
            elevation: 0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ListView(
                    children: messages
                        .map((e) => MessageWithImage(
                            sentByCurrentUser: _currentUser == e['userId'],
                            message: e))
                        .toList()),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(0xFFEEF1FF),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/icons/icon-camera.png',
                            width: 25,
                            height: 25,
                          ),
                          Flexible(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Type Your Message',
                                  hintStyle: TextStyle(
                                      fontSize: 14, color: Color(0xFF7D7D7D)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RoundedAssetImage(
                      imagePath: 'assets/icons/icon-send.png',
                      width: 52,
                      height: 52,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class MessageWithImage extends StatelessWidget {
  const MessageWithImage({
    Key key,
    @required this.sentByCurrentUser,
    @required this.message,
  }) : super(key: key);

  final bool sentByCurrentUser;
  final Map message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          sentByCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        sentByCurrentUser
            ? MessageContainer(
                sentByCurrentUser: sentByCurrentUser, message: message)
            : Container(),
        Container(
          padding: EdgeInsets.only(top: 8.0),
          child: RoundedNetworkImage(
            imageUrl: message['image'],
            width: 35,
            height: 35,
          ),
        ),
        !sentByCurrentUser
            ? MessageContainer(
                sentByCurrentUser: sentByCurrentUser, message: message)
            : Container(),
      ],
    );
  }
}

class MessageContainer extends StatelessWidget {
  const MessageContainer({
    Key key,
    @required this.sentByCurrentUser,
    @required this.message,
  }) : super(key: key);

  final bool sentByCurrentUser;
  final Map message;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: sentByCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          message['type'] == msgType.text
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: sentByCurrentUser
                        ? Color(0xFF5879EE)
                        : Color(0xFFEEF1FF),
                  ),
                  child: Text(
                    message['text'] ?? '',
                    style: TextStyle(
                        color: sentByCurrentUser ? Colors.white : Colors.black),
                  ),
                )
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: sentByCurrentUser
                        ? Color(0xFF5879EE)
                        : Color(0xFFEEF1FF),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: RoundedAssetImage(
                            imagePath: 'assets/icons/icon-play.png',
                            height: 28,
                            width: 28,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                      ),
                      Flexible(
                        child: Image(
                          image: AssetImage('assets/icons/audio-track.png'),
                          height: 45,
                        ),
                      ),
                    ],
                  )),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              message['datetime'] ?? '',
              style: TextStyle(
                color: Color(0xFF989898),
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 8.0),
            child: RoundedNetworkImage(
              imageUrl: 'https://i.pravatar.cc/150?img=4',
              width: 42,
              height: 42,
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
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    'Online',
                    style: TextStyle(
                      color: Color(0xFFD6D6D6),
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Image(
              image: AssetImage('assets/icons/icon-voice-call.png'),
              width: 42,
              height: 42,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Image(
              image: AssetImage('assets/icons/icon-video-call.png'),
              width: 42,
              height: 42,
            ),
          ),
        ],
      ),
    );
  }
}
