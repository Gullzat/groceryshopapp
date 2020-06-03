//import 'package:flutter/material.dart';

class Store {
  String itemName;
  double itemPrice;
  String itemImage;
  String itemWeight;

  Store.items ({
    this.itemName,
    this.itemPrice,
    this.itemImage,
    this.itemWeight
});
}

List <Store> storeItems = [
  Store.items(
    itemName: "Огурцы",
    itemPrice:50.0,
      itemImage: "https://hosstools.com/wp-content/uploads/marketmore-cucumber-768x516.jpg",
    itemWeight: "1 кг"
  ),
  Store.items(
      itemName: "Картофель",
      itemPrice: 20.0,
      itemImage: "https://static7.depositphotos.com/1002351/792/i/450/depositphotos_7926477-stock-photo-new-potato.jpg",
      itemWeight: "1 кг"
  ),
  Store.items(
      itemName: "Укроп",
      itemPrice: 10.0,
      itemImage: "https://www.gastronom.ru/binfiles/images/20160530/b58603b9.jpg",
      itemWeight: "1 шт"
  ),
  Store.items(
      itemName: "Банан",
      itemPrice: 80.0,
      itemImage: "https://edaplus.info/food_pictures/banana.jpg",
      itemWeight: "1 кг"
  ),
  Store.items(
      itemName: "Клубника",
      itemPrice: 70.0,
      itemImage: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDEwbSgx3ooFEbVqWKmMrTgNC5T_6iHqnF9ImcbuJ7-gLZwoDx",
      itemWeight: "1 кг"
  ),

];