class Address {
  int? id;
  String? city;
  String? state;
  String? zipCode;
  String? streetAddress;
  String? streetAddressNumber;
  String? complement;

  Address({
    this.id,
     this.city,
     this.state,
     this.zipCode,
     this.streetAddress,
     this.streetAddressNumber,
     this.complement,
  });

  factory Address.fromMap(Map<String, dynamic> sql) => Address(
        id: sql['id'],
        city: sql["city"],
        state: sql["state"],
        zipCode: sql["zip_code"],
        streetAddress: sql["street_address"],
        streetAddressNumber: sql["street_address_number"],
        complement: sql["complement"],
      );
}
