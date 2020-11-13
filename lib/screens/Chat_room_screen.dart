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
      // 'sentByCurrentUser': false,
      'text': 'Hi Ankur! What’s Up?',
      'datetime': 'Yesterday 14:26 PM',
      'isRead': true,
      'type': msgType.text,
      'image': 'assets/icons/profile.png'
    },
    {
      'userId': 2,
      // 'sentByCurrentUser': true,
      'text':
          'Oh, hello! All perfectly fine I\'m just heading out for something',
      'datetime': 'Yesterday 14:38 PM',
      'isRead': true,
      'type': msgType.text,
      'image': 'assets/icons/profile.png'
    },
    {
      'userId': 1,
      // 'sentByCurrentUser': false,
      'text': null,
      'datetime': 'Yesterday 14:44 PM',
      'isRead': true,
      'type': msgType.audio,
      'image': 'assets/icons/profile.png'
    },
    {
      'userId': 2,
      // 'sentByCurrentUser': false,
      'text': 'Yeah sure I\'ll be there this weekend with my brother',
      'datetime': 'Yesterday 14:50 PM',
      'isRead': false,
      'image': 'assets/icons/profile.png'
    },
    {
      'userId': 1,
      // 'sentByCurrentUser': false,
      'text': 'Yes I Am So Happy :)',
      'datetime': 'Yesterday 14:26 PM',
      'isRead': true,
      'image': 'assets/icons/profile.png'
    }
  ];

  int _currentUser = 1;
  bool sentByCurrentUser = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5879EE),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: HeaderContainer(),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                  children: messages
                      .map((e) => MessageWithImage(
                          sentByCurrentUser: _currentUser == e['userId'],
                          message: e))
                      .toList()),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                          Image(
                            image: AssetImage('assets/icons/icon-camera.png'),
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
                    Image(
                      image: AssetImage('assets/icons/icon-send.png'),
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
          padding: EdgeInsets.only(right: 8.0),
          child: Image(
            image: AssetImage(message['image']),
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: sentByCurrentUser ? Color(0xFF5879EE) : Color(0xFFEEF1FF),
            ),
            child: Text(
              message['text'] ?? '',
              style: TextStyle(
                  color: sentByCurrentUser ? Colors.white : Colors.black),
            ),
          ),
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
            child: Image(
              image: AssetImage('assets/icons/profile.png'),
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
          Image(
            image: AssetImage('assets/icons/icon-voice-call.png'),
            width: 42,
            height: 42,
          ),
          Image(
            image: AssetImage('assets/icons/icon-video-call.png'),
            width: 42,
            height: 42,
          ),
        ],
      ),
    );
  }
}
