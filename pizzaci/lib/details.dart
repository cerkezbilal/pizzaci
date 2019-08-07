import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'dart:ui';
import 'models/pizza.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class Details extends StatelessWidget {

  Details({
    this.pizzaObject

});

  final Pizza pizzaObject;
  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setStatusBarColor(pizzaObject.background);

    return Scaffold(

      body: Center(
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                BackgroundArc(pizzaObject.background),
                ForegroundContent(pizzaObject:pizzaObject),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class ForegroundContent extends StatelessWidget {

  final Pizza pizzaObject;
  const ForegroundContent({@required this.pizzaObject});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 70,left: 50),
            child: Container(
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 30,),
              ),
            ),
          ),
        ),
        PizzaImage(pizzaObject.image),
        SizedBox(height: 30),
        Padding(
          padding: EdgeInsets.only(left: 105,right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleText(pizzaObject.name),

              SizedBox(height: 20,),

              StarRating(pizzaObject.starRating),

              SizedBox(height: 20,),

              Description(pizzaObject.desc),

              SizedBox(height: 20,),

              Price(pizzaObject.price),

              SizedBox(height: 20,),

              BottomButton(),

              SizedBox(height: 35,),
            ],
          ),
        ),
      ],
    );
  }
}


class BottomButton extends StatefulWidget {






  @override
  _BottomButtonState createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {

  bool isFav = false;
  bool isCart= false;

  @override
  void initState() {

    super.initState();

    isFav = false;
    isCart = false;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 5,

              ),
            ),
          ),
          child: FlatButton(
            onPressed: (){
              setState(() {
                isCart = !isCart;
              });
            },
            child: Text(
              isCart ? "Sepetten Kaldır" :  "Sepete Ekle",
              style: prefix0.TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 18,

              ),
            ),
          ),
        ),
        FloatingActionButton(
          onPressed: (){
            setState(() {
              isFav = !isFav;
            });
          },
          child: Icon(
            isFav ? Icons.favorite : Icons.favorite_border,
            color: isFav ? Colors.red : Colors.black,
          ),
          backgroundColor: Colors.white,
          elevation: 3,
        ),
      ],
    );
  }
}



class Price extends StatelessWidget {

  final double price;
  const Price(this.price);
  @override
  Widget build(BuildContext context) {
    return Text(
      "$price TL",
      style: prefix0.TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w700,

      ),

    );
  }
}



class Description extends StatelessWidget {


  final String desc;
  const Description(this.desc);
  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      softWrap: true,
      style: prefix0.TextStyle(
        color: Colors.black87,
        letterSpacing: 1.3,
        fontSize: 17,
        textBaseline: TextBaseline.alphabetic,
      ),
    );
  }
}


class StarRating extends StatelessWidget {
  final double rating;
  const StarRating(this.rating);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(rating.toString(),
        style: prefix0.TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
          ),
        SizedBox(height: 5,),
        Icon(Icons.star,
        color: Colors.yellow[600],
          size: 25,
        ),
        SizedBox(height: 20,),
      ],
    );
  }
}


class TitleText extends StatelessWidget {

  const TitleText(this.pizzaName);
  final String pizzaName;
  final double _fontSize = 40;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children:[
          TextSpan(
            text: pizzaName,
            style: prefix0.TextStyle(
              color: Colors.black,
              fontSize: _fontSize,
              fontFamily: "slabo",
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: " Pizza",
            style: prefix0.TextStyle(
              color: Colors.black,
              fontSize: _fontSize,
              fontFamily: "slabo",
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),

    );
  }
}



class PizzaImage extends StatelessWidget {
  
  final String imageURI;
  const PizzaImage(this.imageURI);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      child: prefix0.Image.asset(imageURI),
    );
  }
}



class BackgroundArc extends StatelessWidget {

  final Color background;

 const BackgroundArc(
    this.background
);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: BackgroundPainter(
          background,
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter{


  BackgroundPainter(this.color);

  final Color color;

  Path path = Path();

  @override
  void paint(Canvas canvas, Size size) {
    Paint painter = Paint()..color = color;
    path.moveTo(250, 0);
    path.quadraticBezierTo(150, 125, 240, 270);
    path.quadraticBezierTo(300, 345, 450, 350);

    path.lineTo(500, 0);

    canvas.drawPath(path, painter);


  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }

}





