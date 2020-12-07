import 'package:flutter/material.dart';

import '../widgets/locationCard.dart';

class TravelScreen extends StatefulWidget {
  @override
  _TravelScreenState createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen>
    with TickerProviderStateMixin {
  TabController _tabController;
  AnimationController _controller1;
  AnimationController _controller2;
  Animation<Offset> _animation1;
  Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {});
    });
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();
    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      lowerBound: 0.9,
    )..repeat(reverse: true);
    _animation1 = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.easeIn,
      ),
    );
    _animation2 = CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeInBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 2,
              width: 20,
              color: Colors.white,
              margin: EdgeInsets.only(left: 16, top: 15),
            ),
            Container(
              height: 2,
              width: 30,
              color: Colors.white,
              margin: EdgeInsets.only(left: 16, top: 7),
            ),
            Container(
              height: 2,
              width: 15,
              color: Colors.white,
              margin: EdgeInsets.only(left: 16, top: 7),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            child: Container(
              height: 110,
              width: 110,
              margin: EdgeInsets.only(top: 12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://avatars0.githubusercontent.com/u/42974191?s=460&u=f142bc28530d70ec336c5611b1d28c7d006fbb53&v=4"),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.pink[600],
                    Colors.white,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.pink[700],
                    offset: Offset(30, 30),
                    blurRadius: 16,
                  ),
                  BoxShadow(
                    color: Colors.pink[300],
                    offset: Offset(-6, -6),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ),
          SlideTransition(
            position: _animation1,
            child: Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: RichText(
                softWrap: true,
                overflow: TextOverflow.clip,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: "Hi, ",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: "Mano Vikram",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "Curious Fanatic",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Theme(
            data: ThemeData.dark(),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 50.0,
                bottom: 10.0,
              ),
              child: TextField(
                autofocus: false,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(18),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                  hintText: "Search",
                  filled: true,
                  fillColor: Colors.grey[300].withOpacity(0.3),
                  contentPadding: const EdgeInsets.all(8.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.pinkAccent[100],
                      unselectedLabelColor: Colors.blueGrey[200],
                      labelPadding: EdgeInsets.all(16),
                      onTap: (index) {
                        setState(() {});
                      },
                      tabs: [
                        _tabController.index == 0
                            ? ScaleTransition(
                                scale: _animation2,
                                child: Icon(
                                  Icons.map,
                                  size: 30,
                                ),
                              )
                            : Icon(
                                Icons.map,
                                size: 30,
                              ),
                        _tabController.index == 1
                            ? ScaleTransition(
                                scale: _animation2,
                                child: Icon(
                                  Icons.pin_drop,
                                  size: 30,
                                ),
                              )
                            : Icon(
                                Icons.pin_drop,
                                size: 30,
                              ),
                        _tabController.index == 2
                            ? ScaleTransition(
                                scale: _animation2,
                                child: Icon(
                                  Icons.restaurant_menu,
                                  size: 30,
                                ),
                              )
                            : Icon(
                                Icons.restaurant_menu,
                                size: 30,
                              ),
                        _tabController.index == 3
                            ? ScaleTransition(
                                scale: _animation2,
                                child: Icon(
                                  Icons.person,
                                  size: 30,
                                ),
                              )
                            : Icon(
                                Icons.person,
                                size: 30,
                              ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          "1",
                          "2",
                          "3",
                          "4",
                        ]
                            .map(
                              (value) => Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      "Discover Places in London",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  LocationCard(
                                    image:
                                        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Tower_Bridge_from_Shad_Thames.jpg/1200px-Tower_Bridge_from_Shad_Thames.jpg",
                                    location: "Tower Bridge",
                                    spot: "Southwork",
                                    rating: 4,
                                  ),
                                  LocationCard(
                                    image:
                                        "https://assets.londonist.com/uploads/2016/08/i875/westminster.jpg",
                                    location: "Big Ben",
                                    spot: "Westminister",
                                    rating: 4.5,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
