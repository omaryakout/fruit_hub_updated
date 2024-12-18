import '../../../../auth/domain/entity/product_entity.dart';

class GetDummyProducts {
  ProductEntity getProductEntity() {
    return ProductEntity(
        name: 'applw',
        description: 'wow',
        price: 56,
        code: '56',
        imageUrl: 'imageUrl',
        isFeatured: true,
        expirationDate: 56,
        isOrganic: false,
        numberOfCalories: 5,
        ratingCount: 6,
        unitAmount: 6);
  }

  getDummyList() {
    return [
      getProductEntity(),
      getProductEntity(),
      getProductEntity(),
      getProductEntity(),
      getProductEntity(),
      getProductEntity(),
    ];
  }
}
