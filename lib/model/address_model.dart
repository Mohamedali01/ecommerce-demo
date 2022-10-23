import 'package:ecomerce_demo/constants.dart';

class AddressModel {
   AddressType addressType;
   String? addressDetails;
   String? floorNumber;
   String? officeNumber;
   String? blockName;

   AddressModel(
      {required this.addressType,
      this.addressDetails,
      this.floorNumber,
      this.officeNumber,
      this.blockName});
}
