import 'package:clife/app/app_helper.dart';
import 'package:flutter/cupertino.dart';

class PostViewModel extends ChangeNotifier with AppHelper {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final hospitalNameController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final pincodeController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();
  final contactPersonController = TextEditingController();
  final contactPersonMobileController = TextEditingController();
  final messageController = TextEditingController();
}
