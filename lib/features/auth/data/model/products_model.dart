import 'dart:io';

import 'package:fruits_hub/features/auth/data/model/review_model.dart';

import '../../domain/entity/product_entity.dart';

class ProductsModel {
  final String name;
  final String description;
  final num price;
  final String code;
  final String imageUrl; // Image stored as URL from Firebase
  final bool isFeatured;
  final int expirationDate;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;

  final String? url;

  ProductsModel({
    required this.name,
    required this.description,
    required this.price,
    required this.code,
    required this.imageUrl,
    required this.isFeatured,
    required this.expirationDate,
    required this.isOrganic,
    required this.numberOfCalories,
    this.avgRating = 0,
    required this.ratingCount,
    required this.unitAmount,
    this.url,
  });

  factory ProductsModel.fromFirebase(Map<String, dynamic> data) {
    return ProductsModel(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: data['price'] ?? 0,
      code: data['code'] ?? '',
      imageUrl: data['image'] ?? '', // Assumes 'image' is a URL string
      isFeatured: data['isFeatured'] ?? false,
      expirationDate: data['expirationDate'] ?? 0,
      isOrganic: data['isOrganic'] ?? false,
      numberOfCalories: data['numberOfCalories'] ?? 0,
      avgRating: data['avgRating'] ?? 0,
      ratingCount: data['ratingCount'] ?? 0,
      unitAmount: data['unitAmount'] ?? 0,
      url: data['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'code': code,
      'image': imageUrl,
      'isFeatured': isFeatured,
      'expirationDate': expirationDate,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'url': url,
    };
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      description: description,
      price: price,
      code: code,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      expirationDate: expirationDate,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      ratingCount: 0,
    );
  }
}

// class ProductsModel {
//   final String name;
//   final String description;
//   final num price;
//   final String code;
//   final String image;
//   final bool isFeatured;
//   final int expirationDate;
//   final bool isOrganic;
//   final int numberOfCalories;
//   final num avgRating = 0;
//   final num ratingCount = 0;
//   final int unitAmount;
//   // final List<ReviewModel> reviews;
//   final String? url;
//   ProductsModel(
//       {required this.name,
//       required this.description,
//       required this.price,
//       required this.code,
//       required this.image,
//       required this.isFeatured,
//       required this.expirationDate,
//       required this.isOrganic,
//       required this.numberOfCalories,
//       required this.unitAmount,
//       // required this.reviews,
//       required this.url});

//   factory ProductsModel.fromJson(Map<String,dynamic>json) {
//     return ProductsModel(
//         name:json['name'],
//         description: json['description'],
//         price: json['price'],
//         code: json['code'],
//         image: json['image'],
//         isFeatured:json['isFeatured'],
//         expirationDate: json['expirationDate'],
//         isOrganic:json['isOrganic'],
//         numberOfCalories: json['numberOfCalories'],

//         unitAmount: json['unitAmount'],
//         // reviews:  json['reviews']
//         //     .map((e) => ReviewModel.fromJson(e))
//         //     .toList(),
//         url:json['url'] );
//   }
//  ProductEntity toEntity() {
//     return ProductEntity(
//         name: name,
//         description: description,
//         price: price,
//         code: code,
//         image: image,
//         isFeatured: isFeatured,
//         expirationDate: expirationDate,
//         isOrganic: isOrganic,
//         numberOfCalories: numberOfCalories,
//         unitAmount: unitAmount,
//         // reviews: reviews.map((e) => e.toEntity(),).toList()
//         );
//   }

//   toJson() {
//     return {
//       'name': name,
//       'description': description,
//       'price': price,
//       'code': code,
//       'image': url,
//       'isFeatured': isFeatured,
//       'isOrganic': isOrganic,
//       'numberOfCalories': numberOfCalories,
//       'ratingCount': ratingCount,
//       ' unitAmount': unitAmount,
//       // 'reviews': reviews
//       //     .map(
//       //       (e) => e.toJson(),
//       //     )
//       //     .toList()
//     };
//   }
// }
