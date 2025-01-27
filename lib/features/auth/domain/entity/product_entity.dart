import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:fruits_hub/features/auth/domain/entity/review_entity.dart';

class ProductEntity extends Equatable {
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

  ProductEntity({
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

  @override
  List<Object?> get props => [name, code];
}

// class ProductEntity {
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
//   final int unitAmount ;
//   // final List<ReviewEntity> reviews;
//   String? url;

//   ProductEntity({
//     required this.name,
//     required this.description,
//     required this.price,
//     required this.code,
//     required this.image,
//     required this.isFeatured,
//     required this.expirationDate,
//     required this.isOrganic,
//     required this.numberOfCalories,
//     required this.unitAmount,
//     // required this.reviews,
//     this.url,
//   });
// }
