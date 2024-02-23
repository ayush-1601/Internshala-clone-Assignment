import 'dart:convert' as convert;

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment_flutter/Controllers/filter_controller.dart';
import 'package:internshala_assignment_flutter/Models/internshala_model.dart';
import 'package:http/http.dart' as http;

FilterController filterController = Get.put(FilterController());

class InternshalaController extends GetxController {
  var isLoading = true.obs;
  RxList<InternshipsMeta> internshipList = <InternshipsMeta>[].obs;
  RxList<String> profileList = <String>[].obs;
  RxList<String> cityList = <String>[].obs;

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    String apiUrl = "https://internshala.com/flutter_hiring/search";

    final response = await http.get(Uri.parse(apiUrl));

    try {
      if (response.statusCode == 200) {
        final jsonData = convert.jsonDecode(response.body);
        jsonData['internships_meta']?.forEach((key, value) {
          var item = InternshipsMeta.fromJson(value);
          internshipList.add(item);

          if (!profileList.contains(item.profileName)) {
            profileList.add(item.profileName.toString());
          }

          for (var city in item.locationNames) {
            if (!cityList.contains(city)) {
              cityList.add(city);
            }
          }
        });
        print(internshipList.length);
        debugPrint(profileList.toString());
        debugPrint(cityList.toString());

        isLoading.value = false;
        update();
      } else {
        Get.snackbar("Error", response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  RxList<String> allFilters = <String>[].obs;
  RxList<InternshipsMeta> filteredList = <InternshipsMeta>[].obs;

  profileFilter() {
    if (filterController.selectedProfiles.isEmpty) {
      return;
    }
    for (InternshipsMeta data in internshipList) {
      if (!filterController.selectedProfiles.contains(data.profileName)) {
        filteredList.remove(data);
      }
    }
  }

  cityFilter() {
    if (filterController.selectedCities.isEmpty) {
      return;
    }
    List<InternshipsMeta> deleteList = [];
    for (InternshipsMeta data in filteredList) {
      int flag = 0;
      for (String city in data.locationNames) {
        if (filterController.selectedCities.contains(city)) {
          flag = 1;
          break;
        }
      }
      if (flag == 0) {
        deleteList.add(data);
      }
    }

    for (InternshipsMeta data in deleteList) {
      filteredList.remove(data);
    }
  }

  filterDuration() {
    if (filterController.selectedDuration.value == duration[Duration.choose]) {
      return;
    }
    List<InternshipsMeta> deleteList = [];
    for (InternshipsMeta model in filteredList) {
      RegExp regex = RegExp(r'\d+');
      debugPrint('current duration ${model.duration}');
      Match? match = regex.firstMatch(model.duration.toString());
      String? numberString = match?.group(0);

      int duration = 0;
      if (numberString != null) {
        duration = int.parse(numberString);
      }
      int selectedDuration = int.parse(filterController.selectedDuration.value);
      debugPrint('converted duration $duration');
      debugPrint('selected duration $selectedDuration');
      if (duration.runtimeType == selectedDuration.runtimeType) {
        debugPrint('same data type');
      }
      // debugPrint('duration found or not ${selectionController.selectedCities.value.contains(city)}');
      if (duration > selectedDuration) {
        deleteList.add(model);
      }
    }
    for (InternshipsMeta model in deleteList) {
      filteredList.remove(model);
    }
  }

  completeFilter() {
    print("before clearing ---------------------$filteredList");
    filteredList.clear();
    update();
    filteredList.addAll(internshalaController.internshipList);
    update();
    print("before $filteredList");
    profileFilter();
    print(filteredList);
    cityFilter();
    print(filteredList);
    update();
    filterDuration();
    update();
    print("after $filteredList");
  }
}
