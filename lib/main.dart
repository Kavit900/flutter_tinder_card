import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class UserDetails {
  final String name;
  final String image;
  final int age;
  final String city;

  UserDetails({
    required this.name,
    required this.image,
    required this.age,
    required this.city,
});
}



class _MyHomePageState extends State<MyHomePage> {

  List<String> welcomeImages = [
    "assets/welcome0.png",
    "assets/welcome1.png",
    "assets/welcome2.png",
    "assets/welcome2.png",
    "assets/welcome1.png",
    "assets/welcome1.png"
  ];

  List<UserDetails> userDetails = [
    new UserDetails(
        name: 'Mega Fox',
        age: 35,
        image:
        'https://image.gala.de/21844706/t/rI/v7/w1440/r0/-/meghan-fox-und-soehne.jpg',
        city: 'Tennessee'),
    new UserDetails(
        name: 'Ariana Grande',
        age: 27,
        image:
        'https://image.brigitte.de/11554052/t/K-/v3/w1440/r1.5/-/ariana-grande-teaser.jpg',
        city: 'Florida'),
    new UserDetails(
        name: 'Jennifer Aniston',
        age: 52,
        image:
        'https://image.gala.de/22088424/t/-O/v6/w1440/r1.5/-/jennifer-aniston.jpg',
        city: 'Los Angeles'),
    new UserDetails(
        name: 'Jeff Bezos',
        age: 57,
        image:
        'https://bilder.t-online.de/b/90/10/62/56/id_90106256/610/tid_da/das-gesicht-von-amazon-symbolbild-gruender-jeff-bezos-macht-nun-sein-ruecktrittsdatum-oeffentlich-.jpg',
        city: 'New Mexico'),
  ];

  @override
  Widget build(BuildContext context) {
    CardController controller = new CardController(); //Use this to trigger swap.

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: TinderSwapCard(
            swipeUp: true,
            swipeDown: true,
            orientation: AmassOrientation.LEFT,
            totalNum: userDetails.length,
            stackNum: 3,
            swipeEdge: 4.0,
            maxWidth: MediaQuery.of(context).size.width * 0.9,
            maxHeight: MediaQuery.of(context).size.width * 0.8,
            minWidth: MediaQuery.of(context).size.width * 0.8,
            minHeight: MediaQuery.of(context).size.width * 0.7,
            cardBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                        image: NetworkImage(userDetails[index].image), fit: BoxFit.cover),
                      ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          alignment: Alignment.bottomLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                          '${userDetails[index].name},',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight:  FontWeight.w400,
                          )
                        ),
                        SizedBox(width: 10),
                        Text(
                          userDetails[index].age.toString(),
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                        ),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            userDetails[index].city,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        )
                      ],
                    ),
                    ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: InkWell(
                      onTap: (){
                        controller.triggerLeft();
                      },
                      child: Container(
                        height: 65,
                        width: 75,
                          decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle
                          ),
                        margin: EdgeInsets.only(bottom: 100, left: 40),
                        child: Icon(Icons.clear, color:Colors.white, size: 50),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: (){
                        controller.triggerRight();
                      },
                      child: Container(
                        height: 65,
                        width: 75,
                        decoration: BoxDecoration(
                            color: Colors.green, shape: BoxShape.circle
                        ),
                        margin: EdgeInsets.only(bottom: 100, left: 40),
                        child: Icon(Icons.check, color:Colors.white, size: 50),
                      ),
                    ),
                  ),
                ],
              );
            },
            cardController: controller = CardController(),
            swipeUpdateCallback:
                (DragUpdateDetails details, Alignment align) {
              /// Get swiping card's alignment
              if (align.x < 0) {
                //Card is LEFT swiping
              } else if (align.x > 0) {
                //Card is RIGHT swiping
              }
            },
            swipeCompleteCallback:
                (CardSwipeOrientation orientation, int index) {
              /// Get orientation & index of swiped card!
            },
          ),
        ),
      ),
    );
  }
}
