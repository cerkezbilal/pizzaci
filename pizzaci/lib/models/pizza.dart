import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PizzaList pizzaList = PizzaList(pizzas: [
  Pizza(image: "assets/pizza.png", background: Color(0xfff2ca80),
      foreground:Colors.black, price:13.00, name: "Buffalo Blue Cheese "
          "Chicken", starRating: 4.5, desc:"Mozzarella Cheeze, Bufalo blue "
          "sauce"),


  Pizza(image: "assets/sweet_and_tangy.png", background: Color(0xff5d2512),
      foreground:Colors.white, price:12.99, name: "Aussie Barbeque Veg ",
      starRating: 4.5, desc:"Mozzarella Cheeze, Bufalo blue "
          "sauce"),

  Pizza(image: "assets/jamaican_jerk_veg.png", background: Color(0xff4fc420),
      foreground:Colors.black, price:12.99, name: "Jamaican \nJerk Veg ",
      starRating: 4.5, desc:"Mozzarella Cheeze, Bufalo blue "
          "sauce"),



  Pizza(image: "assets/aussie_barbeque_veg.png", background: Color(0xffd82a12),
      foreground:Colors.white, price:12.99, name: "Sweet & Tangy Chicken ", starRating: 4.5, desc:"Mozzarella Cheeze, Bufalo blue "
          "sauce"),



  Pizza(image: "assets/indi_tandoori_paneer.png", background: Color(0xffdddbd8),
      foreground:Colors.black, price:12.99, name: "İndi Tandoori Paneer ",
      starRating: 4.5, desc:"Mozzarella Cheeze, Bufalo blue "
          "sauce"),

  Pizza(image: "assets/african_peri_peri.png", background: Color
    (0xffd541c),
      foreground:Colors.black, price:12.99, name: "African Saucy\nPeri Peri ",
      starRating: 4.5, desc:"Mozzarella Cheeze, Bufalo blue "
          "sauce"),


]);





class PizzaList {
  List<Pizza> pizzas;

  PizzaList({@required this.pizzas});
}


class Pizza{
  String image;
  Color background;
  Color foreground;
  String name;
  double starRating;
  String desc;
  double price;


  Pizza(
  {
    @required this.image,
    @required this.background,
    @required this.foreground,
    @required this.price,
    @required this.name,
    @required this.starRating,
    @required this.desc,
}

      );
}