import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:json_to_agha/src/utils/widgets/my_container.dart';
import 'package:json_to_agha/src/utils/widgets/my_text.dart';
import 'package:json_to_agha/src/utils/widgets/text_feild.dart';
import 'package:json_to_dart/model_generator.dart';
import '../utils/config/my_sizes.dart';
import 'package:clipboard/clipboard.dart';
import '../utils/config/my_decoration.dart';
import '../utils/widgets/my_button.dart';
import '../utils/widgets/my_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameC = TextEditingController();
  TextEditingController jsonC = TextEditingController();
  TextEditingController dartC = TextEditingController();
  bool isGenerated = false;
  bool isFrivate = false;
  bool isCopyed = false;

  late ModelGenerator classGenerator;
  DartCode? dartCode;
  String text = '';
  @override
  Widget build(BuildContext context) {
    var widthp = MediaQuery.of(context).size.width * 1 / 100;
    var heightP = MediaQuery.of(context).size.height * 1 / 100;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: MySizes.appBarSize(context),
        child: MyAppBar(
          screenName: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    child: MyContainer(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 170, 215, 250),
                          const Color.fromARGB(255, 216, 215, 215),
                        ],
                      ),
                      widthP: 80,
                      heightP: 60,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MyText('I  Created This Windows App'),
                          MyText('Just For those Where Internet '),
                          MyText('Is Very Weak Like Mine '),
                          MyText('I Am  Najeeb Agha'),
                          MyText('From Pakistan Quetta '),
                          MyText('Just Follow My GitHub Account'),
                          MyText('Github.com/najeebagha'),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: MyText('Json to Dart by Najeeb Agha'),
          ),
        ),
      ),
      body: Container(
        width: widthp * 100,
        height: heightP * 100,
        decoration: MyDecoration.boxDecoration,
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(
              width: widthp * 50,
              child: MyTextFeild(hintText: 'Class Name', controller: nameC),
            ),
            isGenerated
                ? SingleChildScrollView(
                  child: MyTextFeild(controller: dartC, maxLines: 16),
                )
                : MyTextFeild(
                  hintText: 'Json ',
                  controller: jsonC,
                  maxLines: 16,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isGenerated)
                  Row(
                    children: [
                      MyText('  Set Private Fields'),
                      Checkbox(
                        value: isFrivate,
                        onChanged: (v) {
                          setState(() {
                            isFrivate = !isFrivate;
                          });
                        },
                      ),
                    ],
                  ),

                SizedBox(width: 10),
                SizedBox(width: 10),
                isGenerated
                    ? MaterialButton(
                      color: isCopyed ? Colors.blue : Colors.blueGrey,
                      onPressed: () async {
                        await FlutterClipboard.copy(dartC.text);
                        if (isCopyed = false) {
                          setState(() {
                            isCopyed = true;
                          });
                        }
                      },
                      child: isCopyed ? MyText('Copyed') : MyText('Copy'),
                    )
                    : MaterialButton(
                      onPressed: () {
                        setState(() {
                          jsonC.clear();
                          dartC.clear();
                        });
                      },
                      child: MyText('Clear Json'),
                    ),
                if (isGenerated)
                  MaterialButton(
                    onPressed: () {
                      setState(() {
                        nameC.clear();
                        jsonC.clear();
                        dartC.clear();
                        isCopyed = false;
                        isGenerated = !isGenerated;
                      });
                    },
                    child: MyText('Clear All'),
                  ),
              ],
            ),

            if (!isGenerated)
              MyButton(
                title: isGenerated ? 'Generated ' : 'Generate Dart Code',
                onPress:
                    isGenerated
                        ? null
                        : () {
                          if (nameC.text.isNotEmpty & jsonC.text.isNotEmpty) {
                            setState(() {
                              try {
                                classGenerator = ModelGenerator(
                                  nameC.text,
                                  isFrivate,
                                );
                                dartCode = classGenerator.generateDartClasses(
                                  jsonC.text,
                                );
                                dartC.text = dartCode!.code;
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())),
                                );
                              }
                              if (dartC.text.isNotEmpty) {
                                isGenerated = !isGenerated;
                              }
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: MyContainer(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 170, 215, 250),
                                        const Color.fromARGB(
                                          255,
                                          216,
                                          215,
                                          215,
                                        ),
                                      ],
                                    ),
                                    widthP: 80,
                                    heightP: 20,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        if (nameC.text.isEmpty)
                                          MyText(
                                            fontSize: 34,
                                            'The Class Name  Should Not be Empty',
                                          ),
                                        if (jsonC.text.isEmpty)
                                          MyText(
                                            fontSize: 34,
                                            'The Json Should  Not be Empty',
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
              ),
          ],
        ),
      ),
    );
  }
}
