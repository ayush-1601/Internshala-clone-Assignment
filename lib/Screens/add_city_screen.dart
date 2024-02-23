import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment_flutter/Controllers/filter_controller.dart';

import '../Utils/custom_colors.dart';
import '../Widgets/button_widgets.dart';

class AddCityScreen extends StatefulWidget {
  const AddCityScreen({super.key});

  @override
  State<AddCityScreen> createState() => _AddCityScreenState();
}

class _AddCityScreenState extends State<AddCityScreen> {
  @override
  void initState() {
    super.initState();
    _filteredItems.value = filterController.listOfCities.value;
    debugPrint('cities list - ${filterController.listOfCities}');
  }

  FilterController filterController = Get.put(FilterController());
  RxList<String> _filteredItems = <String>[].obs;
  TextEditingController textEditingController = TextEditingController();
  RxList<String> tempSelectedCities = <String>[].obs;

  void _filterList(String searchQuery) {
    setState(() {
      _filteredItems.value = filterController.listOfCities.value
          .where(
              (item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
      debugPrint('list of cities ${filterController.listOfCities}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("City"),
        actions: [
          ButtonWidget(
            text: "Clear",
            buttonColor: Colors.white,
            textColor: CustomColor().blue,
            border: false,
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width * 0.25,
            onPress: () {
              debugPrint('selected cities ${filterController.selectedCities}');
              filterController.selectedCities.clear();
              debugPrint('selected cities ${filterController.selectedCities}');
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 15),
            child: ButtonWidget(
              text: "Apply",
              buttonColor: CustomColor().blue,
              textColor: Colors.white,
              border: false,
              height: MediaQuery.of(context).size.height / 20,
              width: MediaQuery.of(context).size.width * 0.25,
              onPress: () {
                for (String city in tempSelectedCities.value) {
                  if (!(filterController.selectedCities.contains(city))) {
                    filterController.selectedCities.add(city);
                    setState(() {});
                  }
                }
                Get.back();
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height / 11,
              child: TextFormField(
                controller: textEditingController,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                    label: Text("Search city"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: _filterList,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Obx(() => ListView.builder(
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    // print(_filteredProfiles.length);
                    return InkWell(
                      onTap: () {
                        if (tempSelectedCities.value
                            .contains(_filteredItems.value[index])) {
                          setState(() {
                            tempSelectedCities.value
                                .remove(_filteredItems.value[index]);
                          });
                        } else {
                          setState(() {
                            tempSelectedCities.value
                                .add(_filteredItems.value[index]);
                          });
                        }
                      },
                      child: ListTile(
                        title: Text(_filteredItems[index].toString()),
                        trailing: SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                              value: (filterController.selectedCities.contains(
                                          _filteredItems.value[index]) ||
                                      tempSelectedCities.contains(
                                          _filteredItems.value[index]))
                                  ? true
                                  : false,
                              onChanged: (value) {
                                if (filterController.selectedCities.value
                                    .contains(_filteredItems.value[index])) {
                                  setState(() {
                                    filterController.selectedCities.value
                                        .remove(_filteredItems.value[index]);
                                  });
                                } else {
                                  setState(() {
                                    filterController.selectedCities.value
                                        .add(_filteredItems.value[index]);
                                  });
                                }

                                if (int.parse(filterController
                                        .selectedCities.length
                                        .toString()) !=
                                    0) {
                                  setState(() {
                                    filterController.isSelectCityActive.value =
                                        true;
                                  });
                                }
                              }),
                        ),
                      ),
                    );
                  })),
            )
          ],
        ),
      ),
    );
  }
}
