import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:ui';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'models/pizza.dart';
import 'details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pizzacı",
      home: PizzaHome(),
      theme: ThemeData(primarySwatch: Colors.blueGrey, fontFamily: "slabo"),

    );
  }
}

class PizzaHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color(0xff000000));
    return Scaffold(
      body: MainApp(),
      bottomNavigationBar: BottomBar(

      ),
    );
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      padding: EdgeInsets.only(left: 50, right: 30),
      child: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                titleBar(),
                tabs(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

    Widget titleBar()
    {
    return Row
      (
    mainAxisAlignment: MainAxisAlignment.spaceBetween,children: <
      Widget>[
        Column
          (
            crossAxisAlignment: CrossAxisAlignment.start,children: <
            Widget>[
              SizedBox
                (
                  height: 70,
                ),
          Text("Pizzacı",
          style: prefix0.TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 50,
          ),
          ),

          Text("Ürünler",
          style: prefix0.TextStyle(
            fontSize: 50,

          ),
          ),
        ],


                ),

                ],

          );
    }

    Widget tabs(){
      return Container(
        height: 580,
        width: double.infinity,
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(20),
                child: Container(
                  color: Colors.transparent,
                  child: SafeArea(
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          isScrollable: true,
                          labelPadding: EdgeInsets.only(top: 15),
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.black,
                          labelStyle: prefix0.TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            fontFamily: "slabo",

                          ),
                          unselectedLabelColor: Colors.black26,
                          unselectedLabelStyle: prefix0.TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w200,
                            fontFamily: "slabo",
                          ),
                          tabs: <Widget>[
                            Container(
                              child: Text("Pizza",
                              style: prefix0.TextStyle(color: Colors.black),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 60),
                              child: Text("Dürüm",
                                style: prefix0.TextStyle(color: Colors.black),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 60),
                              child: Text("Burger",
                                style: prefix0.TextStyle(color: Colors.black),),
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 60),
                              child: Text("Sandiviç",
                                style: prefix0.TextStyle(color: Colors.black),),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                pizzaShowCase(),
                Center(
                  child: Text("Rolls Tab",
                    textAlign: TextAlign.center,
                    style: prefix0.TextStyle(
                      fontSize: 15,

                    ),
                  ),
                ),
                Center(
                  child: Text("Burgers Tab",
                    textAlign: TextAlign.center,
                    style: prefix0.TextStyle(
                      fontSize: 15,

                    ),
                  ),
                ),
                Center(
                  child: Text("Sandwiches Tab",
                    textAlign: TextAlign.center,
                    style: prefix0.TextStyle(
                      fontSize: 15,

                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );
    }

    Widget pizzaShowCase(){

          return Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: pizzaList.pizzas.length,
              itemBuilder: (BuildContext context, int i){

                return ListOfPizzas(
                  name: pizzaList.pizzas[i].name,
                  image: pizzaList.pizzas[i].image ,
                  background: pizzaList.pizzas[i].background,
                  foreground: pizzaList.pizzas[i].foreground,
                  price: pizzaList.pizzas[i].price,
                  pizzaObject: pizzaList.pizzas[i],
                );
              },
            ),
          );
    }



    class ListOfPizzas extends StatelessWidget {


  const ListOfPizzas({

    @required this.foreground,this.background,this.price,this.name,
  this.image,this.pizzaObject
    });
      final Color foreground;
      final Color background;
      final double price;
      final String name;

      final String image;
      final Pizza pizzaObject;
      @override
      Widget build(BuildContext context) {
        return Row(

          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Details(pizzaObject: pizzaObject)
                ));
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 35,horizontal: 20),
                width: 225,
                decoration: BoxDecoration(
                  color: background,
                  borderRadius: BorderRadius.circular(40),

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: prefix0.Image.asset(image),

                    ),

                    SizedBox(
                      height: 30,
                    ),
                    RichText(
                      softWrap: true,
                      text: TextSpan(
                        style: prefix0.TextStyle(
                          color: foreground,
                          fontSize: 25,
                          fontFamily: "slabo",

                        ),
                        children: [
                          TextSpan(
                            text: name,
                          ),
                          TextSpan(
                            text: "\nPizza",
                            style: prefix0.TextStyle(
                              fontWeight: FontWeight.w800,

                            ),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "$price TL",
                            style: prefix0.TextStyle(
                              fontWeight: FontWeight.w700,
                              color: foreground,
                              fontSize: 20,
                              fontFamily: "arial",

                            ),
                          ),
                        ),

                        StatefulFavIcon(
                          foreground : foreground,

                        )
                      ],
                    ),



                  ],
                ),
              ),
            ),

            SizedBox(
              width: 40,
            ),
          ],

        );
      }
    }

    class StatefulFavIcon extends StatefulWidget {
      final Color foreground;
  const StatefulFavIcon({
    @required this.foreground
    });


      @override
      _StatefulFavIconState createState() => _StatefulFavIconState();
    }

    class _StatefulFavIconState extends State<StatefulFavIcon> {

      bool isFav;

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isFav =false;
  }

      @override
      Widget build(BuildContext context) {
        return GestureDetector(

          onTap: (){
            setState(() {
              isFav = !isFav;
            });
          },

          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: widget.foreground,
          ),
        );
      }
    }

    class BottomBar extends StatelessWidget {

  final double _size = 60;
  final double _padding = 17;
      @override
      Widget build(BuildContext context) {
        return BottomAppBar(
          color: Colors.transparent,
          elevation: 0.0,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: _size,
                  width: _size,
                  padding: EdgeInsets.all(_padding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: prefix0.Image.network(
                      "https://scontent.fsaw1-7.fna.fbcdn.net/v/t1.0-9/13428360_109568776138877_5375518975347030550_n.jpg?_nc_cat=107&_nc_oc=AQli_l0mL6vg2XvQmYHM1KgdSK12YpnBIcZRyhGX09BYfR1KZ-wLnjQFU99WNYHL9NI&_nc_ht=scontent.fsaw1-7.fna&oh=e18f33aee79c8c12b079c62ac8ff2c69&oe=5DEB713A",

                      fit: BoxFit.contain,
                    ),
                  ),

                ),

                Container(
                  height: _size,
                  width: _size,
                  padding: EdgeInsets.all(_padding),
                  child: prefix0.Image.asset("assets/home_icon.png",
                    fit: BoxFit.contain,
                  ),

                ),

                Container(
                  height: _size,
                  width: _size,
                  padding: EdgeInsets.all(_padding),
                  child: prefix0.Image.asset("assets/search_icon.png",
                    fit: BoxFit.contain,
                  ),

                ),
                Container(
                  height: _size,
                  width: _size,
                  padding: EdgeInsets.all(_padding),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: prefix0.Image.asset("assets/bag_icon.png",
                    fit: BoxFit.contain,
                  ),

                ),
              ],
            ),
          ),


        );
      }
    }








