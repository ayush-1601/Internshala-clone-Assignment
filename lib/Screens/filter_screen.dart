import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment_flutter/Controllers/filter_controller.dart';
import 'package:internshala_assignment_flutter/Screens/add_city_screen.dart';
import 'package:internshala_assignment_flutter/Screens/add_profile_screen.dart';
import 'package:internshala_assignment_flutter/Utils/custom_colors.dart';
import 'package:internshala_assignment_flutter/Widgets/button_widgets.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  FilterController filterController = Get.put(FilterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        height: MediaQuery.of(context).size.height / 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonWidget(
              text: "Clear all",
              buttonColor: Colors.white,
              textColor: CustomColor().blue,
              height: MediaQuery.of(context).size.height / 20,
              border: true,
              width: MediaQuery.of(context).size.width * 0.4,
              onPress: () {
                filterController.selectedCities.clear();
                filterController.selectedProfiles.clear();
                filterController.selectedDuration.value =
                    duration[Duration.choose]!;
                internshalaController.allFilters.clear();
                internshalaController.completeFilter();
                Get.back();
              },
            ),
            ButtonWidget(
              text: "Apply",
              buttonColor: CustomColor().blue,
              textColor: Colors.white,
              height: MediaQuery.of(context).size.height / 20,
              border: true,
              width: MediaQuery.of(context).size.width * 0.4,
              onPress: () {
                internshalaController.allFilters.clear();
                internshalaController.allFilters
                    .addAll(filterController.selectedProfiles);
                internshalaController.allFilters
                    .addAll(filterController.selectedCities);

                if (filterController.selectedDuration.value !=
                    duration[Duration.choose]) {
                  internshalaController.allFilters
                      .add('${filterController.selectedDuration.value} Months');
                }
                internshalaController.completeFilter();
                Get.back();
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            // AddFiltersWidget(
            //   filterName: "PROFILE",
            //   onPress: () {
            //     Get.to(() => AddProfileScreen());
            //     setState(() {});
            //   }, itemListlength: filterController.selectedProfiles.length, listFilters: filterController.selectedProfiles,
            // ),

            //----------------------------------------------------------------------------------------------------------------------------------

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("PROFILE"),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddProfileScreen());
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.add,
                          size: 15,
                          color: CustomColor().blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Add profile",
                          style: TextStyle(
                            color: CustomColor().blue,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() => Visibility(
                    visible: filterController.selectedProfiles.length != 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.separated(
                        itemCount: filterController.selectedProfiles.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          RxList<String> listProfile =
                              filterController.selectedProfiles;
                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: CustomColor().blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  listProfile.value[index],
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: const Icon(
                                    CupertinoIcons.xmark,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    listProfile.remove(listProfile[index]);
                                    // filterController.selectedProfiles.remove(
                                    //     filterController
                                    //         .selectedProfiles[index]);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5,
                          );
                        },
                      ),
                    )))
              ],
            ),

            //---------------------------------------------------------------------------------------------------------------------------------
            const SizedBox(
              height: 20,
            ),
            // AddFiltersWidget(
            //   filterName: "CITY",
            //   onPress: () {
            //     Get.to(AddCityScreen());
            //     setState(() {});
            //   },
            //   itemListlength: filterController.selectedCities.length,
            //   listFilters: filterController.selectedCities,
            // )

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("CITY"),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddCityScreen());
                      setState(() {});
                    },
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.add,
                          size: 15,
                          color: CustomColor().blue,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Add city",
                          style: TextStyle(
                            color: CustomColor().blue,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Obx(() => Visibility(
                    visible: filterController.selectedCities.length != 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ListView.separated(
                        itemCount: filterController.selectedCities.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          // RxList<String> listProfile =
                          //     widget.listFilters;
                          RxList<String> listCity =
                              filterController.selectedCities;
                          return Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: CustomColor().blue,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  filterController.selectedCities.value[index],
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.white),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                InkWell(
                                  child: const Icon(
                                    CupertinoIcons.xmark,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    listCity.remove(listCity[index]);
                                    // filterController.selectedCities.remove(
                                    //     filterController.selectedCities[index]);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 5,
                          );
                        },
                      ),
                    )))
              ],
            ),

            SizedBox(
              height: 20,
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("MAXIMUM DURATION (IN MONTHS)"),
                SizedBox(
                  height: 8,
                ),
                Obx(() => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        labelText: "Choose duration".tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2))),
                    items: duration.values
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList(),
                    validator: (value) {},
                    value: filterController.selectedDuration.value,
                    onChanged: (String? newValue) {
                      //filterController.selectedDuration.value = newValue!;
                      setState(() {
                        filterController.selectedDuration.value = newValue!;
                      });
                    }))
              ],
            )
          ],
        ),
      ),
    );
  }
}
