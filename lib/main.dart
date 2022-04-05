import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pm_satu/number_widget.dart';

void main() => runApp(const MaterialApp(
      home: MainPage(),
    ));

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final double coverHeight = 280;
  final double profileHeight = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            'Ferry Natan Wibisono',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 8),
          Text('Flutter and Dart Enthuaist',
              style: TextStyle(fontSize: 20, color: Colors.black87)),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildSocialIcon(FontAwesomeIcons.facebook),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.youtubeSquare),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.instagramSquare),
              const SizedBox(width: 12),
              buildSocialIcon(FontAwesomeIcons.twitterSquare),
              const SizedBox(width: 12),
            ],
          ),
          const SizedBox(height: 16),
          Divider(),
          NumberWidget(),
          const SizedBox(height: 16),
          Divider(),
          const SizedBox(height: 16),
          buildAbout(),
        ],
      );

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Image.asset(
          "assets/image/bg.jpg",
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage(
          "assets/image/natan.png",
        ),
      );
  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 16),
            Text(
              'Flutter Software Enthuaist and Go-lang Developer Enthuaist',
              style: TextStyle(fontSize: 18, height: 1.4),
            ),
          ],
        ),
      );
  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 25,
        child: Material(
          shape: CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Center(
                child: Icon(
              icon,
              size: 32,
            )),
          ),
        ),
      );
}
