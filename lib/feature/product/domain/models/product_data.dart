import 'package:flutter/material.dart';

class Product {
  int quantity;
  String name;
  String image;
  double price;
  Product(
      {required this.name,
        required this.price,
        required this.image,
        required this.quantity});
}

String text = "";
List<Product> productlist = [
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Barger",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Pizza",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Barger",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Roll",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Barger",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Pizza",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Barger",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Pizza",
      price: 20.00),
  Product(
      quantity: 1,
      image: "assets/product/FG1.png",
      name: "Barger",
      price: 20.00),

];
