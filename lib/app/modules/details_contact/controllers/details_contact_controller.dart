import 'package:eletronic_schedule/app/domain/entities/address_entity.dart';
import 'package:eletronic_schedule/app/domain/entities/contact_entity.dart';
import 'package:eletronic_schedule/app/domain/services/address_service.dart';
import 'package:get/get.dart';

class DetailsContactController extends GetxController {
  final _addressService = AddressService();
  var address = Address().obs;
  Contact contactArgument = Get.arguments;

  DetailsContactController(){
    getById();
  }

  Future<Address> getById() async {
   return address.value = await _addressService.getById(contactArgument.addressId);
  }
}
