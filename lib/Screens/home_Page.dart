import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment_flutter/Controllers/filter_controller.dart';
import 'package:internshala_assignment_flutter/Controllers/internshala_controller.dart';
import 'package:internshala_assignment_flutter/Screens/filter_screen.dart';
import 'package:internshala_assignment_flutter/Utils/custom_colors.dart';
import 'package:internshala_assignment_flutter/Widgets/internship_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  InternshalaController internshalaController =
      Get.put(InternshalaController());

  FilterController filterController = Get.put(FilterController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.white,
        title: Text("Internships"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bookmark),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.bubble_left),
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 10,
                child: internshalaController.allFilters.length == 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              Get.to(() => FilterScreen());
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: CustomColor().blue, width: 2),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.filter_alt_outlined,
                                    size: 20,
                                    color: CustomColor().blue,
                                  ),
                                  Text(
                                    "Filters",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: CustomColor().blue),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => FilterScreen());
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        top: 2.0,
                                        bottom: 2.0),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: CustomColor().blue),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Center(
                                      child: Row(
                                        children: [
                                          Text(
                                            "Filters",
                                            style: TextStyle(
                                                color: CustomColor().blue,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.05,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: CustomColor().blue),
                                            child: Center(
                                              child: Text(
                                                internshalaController
                                                    .allFilters.length
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 10,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    child: ListView.builder(
                                      itemCount: internshalaController
                                          .allFilters.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        RxList<String> filterList =
                                            internshalaController.allFilters;
                                        return Container(
                                          margin: EdgeInsets.all(2),
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                filterList.value[index],
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              InkWell(
                                                child: const Icon(
                                                  CupertinoIcons.xmark,
                                                  size: 15,
                                                  color: Colors.grey,
                                                ),
                                                onTap: () {
                                                  if (filterController
                                                      .selectedCities
                                                      .contains(
                                                          filterList[index])) {
                                                    filterController
                                                        .selectedCities.value
                                                        .remove(
                                                            filterList[index]);
                                                  } else if (filterController
                                                      .selectedProfiles
                                                      .contains(
                                                          filterList[index])) {
                                                    filterController
                                                        .selectedProfiles.value
                                                        .remove(
                                                            filterList[index]);
                                                  } else {
                                                    filterController
                                                            .selectedDuration
                                                            .value =
                                                        duration[
                                                            Duration.choose]!;
                                                  }
                                                  filterList.remove(
                                                      filterList[index]);
                                                  internshalaController
                                                      .completeFilter();
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            internshalaController.filteredList.value.length > 0
                                ? "${internshalaController.filteredList.length} internshps matching filters"
                                : "No internship found",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
              ),
              Divider(
                thickness: 3,
                color: CustomColor().grey,
              ),
              Expanded(
                // height: MediaQuery.of(context).size.height * 0.7,
                child: internshalaController.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : ListView.separated(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: internshalaController.allFilters.length == 0
                            ? internshalaController.internshipList.length
                            : internshalaController.filteredList.length,
                        // itemCount: filterController.filteredList.length,
                        itemBuilder: (BuildContext context, int index) {
                          // var internships =
                          //     internshalaController.internshipList;
                          var internships =
                              internshalaController.allFilters.length == 0
                                  ? internshalaController.internshipList
                                  : internshalaController.filteredList.value;
                          return InternshipWidget(
                            companyName:
                                internships[index].companyName.toString(),
                            title: internships[index].title.toString(),
                            duration: internships[index].duration.toString(),
                            salary:
                                internships[index].stipend!.salary.toString(),
                            location: internships[index]
                                    .locationNames
                                    .isNotEmpty
                                ? internships[index].locationNames[0].toString()
                                : "Work from Home",
                            startDate: internships[index].startDate.toString(),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            color: CustomColor().grey,
                            thickness: 10,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget iconText(IconData? dataIcon, String data) {
  return Row(
    children: [
      Icon(
        dataIcon,
        size: 16,
      ),
      SizedBox(
        width: 3,
      ),
      Text(
        data,
        style: TextStyle(fontSize: 15),
      )
    ],
  );
}
