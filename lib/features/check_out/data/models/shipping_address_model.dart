import '../../domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? address2;
  String? phoneNumber;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.address2,
    this.phoneNumber,
  });

  factory ShippingAddressModel.fromShippingAddressEntity(
      ShippingAddressEntity shippingAddressEntity) {
    return ShippingAddressModel(
        address2: shippingAddressEntity.address2,
        address: shippingAddressEntity.address,
        city: shippingAddressEntity.city,
        email: shippingAddressEntity.email,
        name: shippingAddressEntity.name,
        phoneNumber: shippingAddressEntity.phoneNumber);
  }

  toJson() {
    return {
      'address2': address2,
      'address': address,
      'city': city,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
    };
  }
}
