import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tec/models/data_models.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/my_Component.dart';
import 'package:tec/my_colors.dart';
import 'package:tec/my_strings.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin,top: 32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  SvgPicture.asset("assets/images/techbot.svg", height: 100),
                  SizedBox(height: 32),
                  Text(
                    MyStrings.successfulRegistration,
                    style: TextStyle(
                      fontFamily: 'vanil',
            fontSize: 15,
            color: SolidColors.primeryColor,
            fontWeight: FontWeight.w700,
                    ),
                    
                  ),
                  SizedBox(height: 32),
                  TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(

                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: textTheme.bodyMedium,
                    ),
                  ),
                  SizedBox(height: 32),
                  Text(MyStrings.chooseCat, style: TextStyle(
                      fontFamily: 'vanil',
            fontSize: 15,
            color: SolidColors.primeryColor,
            fontWeight: FontWeight.w700,
                    ),),
                  // tagList
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.3,
                            ),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: (() {
                              setState(() {
                                selectedTags.add(tagList[index]);
                              });
                            }),
                            child: MainTags(textTheme: textTheme, index: index),
                          );
                        }),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Image.asset("assets/images/arrow.png", scale: 3),

                  // selected Tags
                  Padding(
                    padding: const EdgeInsets.only(top: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: GridView.builder(
                        physics: const ClampingScrollPhysics(),
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              crossAxisCount: 2,
                              childAspectRatio: 0.2,
                            ),
                        itemBuilder: ((context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // tag list
                                  SizedBox(width: 8),
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.bodySmall,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        selectedTags.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      CupertinoIcons.delete,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
