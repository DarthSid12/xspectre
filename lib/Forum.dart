// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
//
// import 'Xspectre Project/lib/AddVideos.dart';
// import 'Home.dart';
// import 'Styles.dart';
// import 'Videos.dart';
// import 'Xspectre Project/lib/Community.dart';
// import 'JoinUs.dart';
// import 'Squad.dart';
// import 'Xspectre Project/lib/T&C.dart';
// import 'Xspectre Project/lib/help/IsPhone.dart';
//
// class Forums extends StatefulWidget {
//   @override
//   _ForumsState createState() => _ForumsState();
// }
//
// class _ForumsState extends State<Forums> {
//   String searchKey = '';
//   List<Widget> forumsWidgetList = [
//     SizedBox(height:200),
//     CircularProgressIndicator()
//   ];
//   @override
//   void initState(){
//     super.initState();
//     makeForumsWidgetList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         constraints: BoxConstraints.expand(),
//         decoration: BoxDecoration(
//           image:DecorationImage(
//             fit: BoxFit.cover,
//             image: NetworkImage("https://cdn-products.eneba.com/resized-products/xujg45yp778glsip0kvm_350x200_2x-0.jpg"),
//           )
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AppBar(
//                 backgroundColor:Color.fromRGBO(255,255,255,0.2),
//                 title: Image.asset("images/XspectreLogo.png"),
//                 elevation: 0,
//                 leading:isLaptop(context)?Container():Builder(
//                   builder:(context) => IconButton(
//                       icon: Icon(Icons.menu),
//                       onPressed: (){
//                         Scaffold.of(context).openDrawer();
//                       }
//                   ),
//                 ),
//                 actions: !isLaptop(context)?<Widget>[
//                   // signContainer(),
//                   SizedBox(width:20)
//                 ]:<Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       FlatButton(
//                         onPressed:(){
//                           Navigator.pushReplacement(context, MaterialPageRoute(
//                               builder: (context) => Home()),
//                           );
//                         },
//                         child:Text("Home", style:TextStyle(
//                             letterSpacing:3,
//                             fontSize:12,
//                             color:Colors.white
//                         )),
//                       ),
//                       FlatButton(
//                           child:Text("Videos", style:TextStyle(
//                               letterSpacing:3,
//                               fontSize:12,
//                               color:Colors.white
//                           )),
//                           onPressed: () {
//                             Navigator.pushReplacement(context, MaterialPageRoute(
//                                 builder: (context) => VideoPage()),
//                             );
//                           }
//                       ),FlatButton(
//                           child:Text("Community", style:TextStyle(
//                               letterSpacing:3,
//                               fontSize:12,
//                               color:Colors.white
//                           )),
//                           onPressed: () {
//                             Navigator.pushReplacement(context, MaterialPageRoute(
//                                 builder: (context) => Community()),
//                             );
//                           }
//                       ),FlatButton(
//                           child:Text("About Us", style:TextStyle(
//                               letterSpacing:3,
//                               fontSize:12,
//                               color:Colors.white
//                           )),
//                           onPressed: () {
//                             Navigator.pushReplacement(context, MaterialPageRoute(
//                                 builder: (context) => Squad()),
//                             );
//                           }
//                       ),FlatButton(
//                           child:Text("Join Us", style:TextStyle(
//                               letterSpacing:3,
//                               fontSize:12,
//                               color:Colors.white
//                           )),
//                           onPressed: () {
//                             Navigator.pushReplacement(context, MaterialPageRoute(
//                                 builder: (context) => JoinUs()),
//                             );
//                           }
//                       ),FlatButton(
//                           child:Text("Add Videos", style:TextStyle(
//                               letterSpacing:3,
//                               fontSize:12,
//                               color:Colors.white
//                           )),
//                           onPressed: () {
//                             Navigator.pushReplacement(context, MaterialPageRoute(
//                                 builder: (context) => AddVideos()),
//                             );
//                           }
//                       ),FlatButton(
//                           child:Text("T&C", style:TextStyle(
//                               letterSpacing:3,
//                               fontSize:12,
//                               color:Colors.white
//                           )),
//                           onPressed: () {
//                             Navigator.pushReplacement(context, MaterialPageRoute(
//                                 builder: (context) => Terms()),
//                             );
//                           }
//                       ),
//                       FlatButton(
//                         onPressed:(){
//                           print(MediaQuery.of(context).size.width.toString());
//                           print(MediaQuery.of(context).size.height.toString());
//                         },
//                         child:Text("Profile", style:TextStyle(
//                             letterSpacing:3,
//                             fontSize:12,
//                             color:Colors.lightBlue
//                         )),
//                       ),
//                       SizedBox(width:20)
//                     ],
//                   ),
//                   // signContainer(),
//                   SizedBox(width:40)
//
//                 ],
//               ),
//               SizedBox(height:30),
//               Center(
//                 child:Text("Hot forums of the day",style: TextStyle(
//                     letterSpacing: 4,
//                     fontFamily : "Heading3",
//                     color: Colors.amber,
//                     fontSize: 60
//                 ),),
//               ),
//               SizedBox(height:30),
//               Container(
//                 decoration: BoxDecoration(
//                     border:Border.all(color:Colors.white,width:1.0)
//                 ),
//                 width: MediaQuery.of(context).size.width *0.6 ,
//                 height:66,
//                 child: Padding(
//                   padding: const EdgeInsets.fromLTRB(48.0,8.0,8.0,8.0),
//                   child: Form(
//                     child: TextFormField(
//                       style: TextStyle(
//                           color:Colors.white,
//                           fontSize: 16,
//                           fontFamily:"PoppinsThin"
//                       ),
//                       keyboardType: TextInputType.text,
//                       onFieldSubmitted: (text) {
//                         searchKey = text;
//                         setState(() {
//                           makeForumsWidgetList();
//                         });
//                       },
//                       decoration: const InputDecoration(
//                           hintText: '',
//                           enabledBorder:  UnderlineInputBorder(borderSide:BorderSide(
//                               color: Color.fromRGBO(0,0,0,0)
//                           )),
//                           focusedBorder:  UnderlineInputBorder(borderSide:BorderSide(
//                               color: Color.fromRGBO(0,0,0,0)
//                           )),
//                           hintStyle: TextStyle(
//                               color:Colors.white,
//                               fontSize: 16,
//                               fontFamily:"PoppinsThin"
//                           )
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ] + forumsWidgetList,
//           ),
//         ),
//       ),
//     );
//   }
//   void makeForumsWidgetList() async{
//     forumsWidgetList= [];
//     QuerySnapshot querySnapshot = await Firestore.instance.collection("Forums").where("title",isGreaterThanOrEqualTo: searchKey).getDocuments();
//     for (DocumentSnapshot documentSnapshot in querySnapshot.documents){
//       setState(() {
//         Widget forum = Padding(
//           padding: EdgeInsets.fromLTRB(15,0,0,0),
//           child:Container(
//             decoration: BoxDecoration(
//               color: Colors.amber,
//               borderRadius: BorderRadius.all(Radius.circular(15)),
//               border: Border.all(color: Colors.black,width: 2),
//             ),
//             width: uniWidth(context)*0.9,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ListTile(
//                 tileColor: Colors.amber,
//                 title: Text(documentSnapshot['title'],style:TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize:30,
//                     fontFamily:"Heading3"
//               )),
//                 subtitle: Text(documentSnapshot['explanation'],style:TextStyle(
//                   color:Colors.grey[800],
//                   fontSize: 15,
//                   fontFamily:"Poppins"
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,),
//             ),
//           ),
//         )
//         );
//         forumsWidgetList.add(SizedBox(height:30));
//         forumsWidgetList.add(forum);
//         forumsWidgetList.add(SizedBox(height:30));
//       });
//     }
//   }
// }
