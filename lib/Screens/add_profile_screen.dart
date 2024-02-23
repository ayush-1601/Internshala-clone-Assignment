import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshala_assignment_flutter/Controllers/filter_controller.dart';
import 'package:internshala_assignment_flutter/Utils/custom_colors.dart';
import 'package:internshala_assignment_flutter/Widgets/button_widgets.dart';

class AddProfileScreen extends StatefulWidget {
  const AddProfileScreen({super.key});

  @override
  State<AddProfileScreen> createState() => _AddProfileScreenState();
}

class _AddProfileScreenState extends State<AddProfileScreen> {
  @override
  void initState() {
    super.initState();
    _filteredProfiles.value = profileSelectionController.listOfProfiles.value;
  }

  FilterController profileSelectionController = Get.put(FilterController());
  RxList<String> _filteredProfiles = <String>[].obs;
  TextEditingController textEditingController = TextEditingController();
  RxList<String> tempProfiles = <String>[].obs;

  void _filterList(String searchQuery) {
    setState(() {
      _filteredProfiles.value = profileSelectionController.listOfProfiles.value
          .where(
              (item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Profile"),
        actions: [
          ButtonWidget(
            text: "Clear",
            buttonColor: Colors.white,
            textColor: CustomColor().blue,
            border: false,
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.width * 0.25,
            onPress: () {
              profileSelectionController.selectedProfiles.clear();
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
                for (String profile in tempProfiles) {
                  if (!(profileSelectionController.selectedProfiles
                      .contains(profile))) {
                    profileSelectionController.selectedProfiles.add(profile);
                    setState(() {});
                  }
                }
                Navigator.pop(context);
                // Get.back();
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
                    label: Text("Search profile"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
                onChanged: _filterList,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Obx(() => ListView.builder(
                  itemCount: _filteredProfiles.length,
                  itemBuilder: (context, index) {
                    // print(_filteredProfiles.length);
                    return InkWell(
                      onTap: () {
                        if (tempProfiles.contains(_filteredProfiles[index])) {
                          setState(() {
                            tempProfiles.value.remove(_filteredProfiles[index]);
                          });
                        } else {
                          setState(() {
                            tempProfiles.add(_filteredProfiles[index]);
                          });
                        }
                      },
                      child: ListTile(
                        title: Text(_filteredProfiles[index].toString()),
                        trailing: SizedBox(
                          height: 18,
                          width: 18,
                          child: Checkbox(
                              value: (profileSelectionController
                                          .selectedProfiles
                                          .contains(_filteredProfiles[index]) ||
                                      tempProfiles
                                          .contains(_filteredProfiles[index]))
                                  ? true
                                  : false,
                              onChanged: (value) {
                                if (profileSelectionController.selectedProfiles
                                    .contains(_filteredProfiles[index])) {
                                  setState(() {
                                    profileSelectionController.selectedProfiles
                                        .remove(_filteredProfiles[index]);
                                  });
                                } else {
                                  setState(() {
                                    profileSelectionController.selectedProfiles
                                        .add(_filteredProfiles[index]);
                                  });
                                }

                                if (int.parse(profileSelectionController
                                        .selectedProfiles.length
                                        .toString()) !=
                                    0) {
                                  setState(() {
                                    profileSelectionController
                                        .isSelectProfileActive.value = true;
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
