import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xspectre/Tournament.dart';
import 'package:xspectre/help/IsPhone.dart';

Widget gridNews(BuildContext context) {
  return Container(
    child: Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RisingContainer(
                (uniWidth(context) * 0.4) + 20,
                "images/SocialMediaBG.webp",
                "Tournaments",
                "Take a look at Xspectre tournaments, one of the best out there",
                () {
              Navigator.pushNamed(context, Tournaments.route);
            }),
            SizedBox(
              width: 20,
            ),
            RisingContainer(
                uniWidth(context) * 0.2,
                "images/SocialMediaBG.webp",
                "Discord",
                "Join our discord for the meeting new gamer and getting updates on tournaments",
                () {
              launch("https://discord.gg/XDwNFdugPp");
            }),
            SizedBox(
              width: 20,
            ),
            RisingContainer(
                uniWidth(context) * 0.2,
                "images/SocialMediaBG.webp",
                "Instagram",
                "Follow us to get notified of the latest developments in Xspectre",
                () {
              launch("https://www.instagram.com/xspectre.g/");
            }),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RisingContainer(uniWidth(context) * 0.2,
                "images/SocialMediaBG.webp", "Filler", "Filler", () {}),
            SizedBox(
              width: 20,
            ),
            RisingContainer(uniWidth(context) * 0.2,
                "images/SocialMediaBG.webp", "Filler", "Filler", () {}),
            SizedBox(
              width: 20,
            ),
            RisingContainer((uniWidth(context) * 0.4) + 20,
                "images/SocialMediaBG.webp", "Filler", "Filler", () {}),
          ],
        ),
      ],
    ),
  );
}

class RisingContainer extends StatefulWidget {
  double width;
  String imageURL;
  String heading;
  String paragraph;
  Function onTap;
  RisingContainer(
      this.width, this.imageURL, this.heading, this.paragraph, this.onTap);
  @override
  _RisingContainerState createState() =>
      _RisingContainerState(width, imageURL, heading, paragraph, onTap);
}

class _RisingContainerState extends State<RisingContainer>
    with TickerProviderStateMixin {
  bool clicked = false;
  double width;
  String imageURL;
  String heading;
  String para;
  Function onTap;
  _RisingContainerState(
      this.width, this.imageURL, this.heading, this.para, this.onTap);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 340,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) {
            setState(() {
              clicked = true;
            });
          },
          onExit: (_) {
            setState(() {
              clicked = false;
            });
          },
          child: Column(
            children: [
              AnimatedContainer(
                  height: clicked ? 19 : 25,
                  duration: Duration(milliseconds: 200)),
              AnimatedContainer(
                height: 310,
                width: width,
                duration: Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: [
                    clicked
                        ? BoxShadow(
                            color: Colors.grey[800].withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          )
                        : BoxShadow(),
                  ],
                  // image: DecorationImage(
                  //   image: AssetImage(imageURL),
                  //   fit: BoxFit.cover
                  // )
                  // borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Stack(
                  children: [
                    Container(
                      color: Colors.black.withOpacity(0.3),
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            heading,
                            style: TextStyle(
                                fontFamily: "Longless",
                                color: Colors.red[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 26),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: width > uniWidth(context) * 0.3
                                ? width * 0.5
                                : width * 0.9,
                            child: Text(para,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "Jura",
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: null),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
