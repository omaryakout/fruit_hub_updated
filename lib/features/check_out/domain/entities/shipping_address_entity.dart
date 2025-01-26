class ShippingAddressEntity {
  String? name;
  String? email;
  String? address;
  String? city;
  String? address2;
  String? phoneNumber;

  ShippingAddressEntity({
    this.name,
    this.email,
    this.address,
    this.city,
    this.address2,
    this.phoneNumber,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$address $address2 $city';
  }
}
