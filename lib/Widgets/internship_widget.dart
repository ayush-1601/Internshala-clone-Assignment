import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshala_assignment_flutter/Screens/home_Page.dart';

import '../Utils/custom_colors.dart';

class InternshipWidget extends StatelessWidget {
  final String title, companyName, location, startDate, duration, salary;
  const InternshipWidget(
      {super.key,
      required this.companyName,
      required this.title,
      required this.duration,
      required this.location,
      required this.salary,
      required this.startDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                companyName,
                // style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          iconText(CupertinoIcons.placemark, location),
          // ? iconText(CupertinoIcons.placemark,
          //     )
          // : iconText(CupertinoIcons.home, ),
          Row(
            children: [
              iconText(CupertinoIcons.play_circle, startDate),
              SizedBox(
                width: 20,
              ),
              iconText(CupertinoIcons.calendar, duration)
            ],
          ),
          iconText(CupertinoIcons.squares_below_rectangle, salary),
          Column(
            children: [
              Divider(
                thickness: 2,
                color: CustomColor().grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "View details",
                        style: TextStyle(
                            color: CustomColor().blue,
                            fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: CustomColor().blue,
                          borderRadius: BorderRadius.circular(5)),
                      height: 40,
                      width: 150,
                      child: Center(
                          child: Text(
                        "Apply now",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
