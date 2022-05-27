class Address {
  int id;
  String city;
  String state;
  String zipCode;
  String streetAddress;
  String streetAddressNumber;
  String complement;

  Address({
    required this.id,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.streetAddress,
    required this.streetAddressNumber,
    required this.complement,
  });

  factory Address.fromMap(Map<String, dynamic> sql) => Address(
        id: sql['id'],
        city: sql["city"],
        state: sql["state"],
        zipCode: sql["zip_code"],
        streetAddress: sql["street_address"],
        streetAddressNumber: sql["stree_adress_number"],
        complement: sql["complement"],
      );
}
