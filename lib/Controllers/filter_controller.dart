import 'package:get/get.dart';
import 'package:internshala_assignment_flutter/Controllers/internshala_controller.dart';

InternshalaController internshalaController = Get.put(InternshalaController());

enum Duration{
  choose,one,two,three,four,six,twelve,twentyfour,thirtysix
}
Map<Duration, String> duration={
  Duration.choose:'Choose Duration',
  Duration.one:'1',
  Duration.two:'2',
  Duration.three:'3',
  Duration.four:'4',
  Duration.six:'6',
  Duration.twelve:'12',
  Duration.twentyfour:'24',
  Duration.thirtysix:'36',
};

class FilterController extends GetxController {
  RxBool isSelectProfileActive = false.obs;
  RxBool isSelectCityActive = false.obs;
  RxList<String> listOfProfiles = internshalaController.profileList;
  RxList<String> listOfCities = internshalaController.cityList;
  RxList<String> selectedProfiles = <String>[].obs;
  RxList<String> selectedCities = <String>[].obs;
  RxString selectedDuration= duration[Duration.choose]!.obs;

}
