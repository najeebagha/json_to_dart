import 'dart:developer';

import 'package:flutter/material.dart';
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
        child: MyAppBar(screenName: 'Json to Dart by Najeeb Agha'),
      ),
      body: Container(
        width: widthp * 100,
        height: heightP * 100,
        decoration: MyDecoration.boxDecoration,
        alignment: Alignment.center,
        child: Column(
          children: [
            MyTextFeild(hintText: 'Class Name', controller: nameC),
            isGenerated
                ? SingleChildScrollView(
                  child: MyTextFeild(controller: dartC, maxLines: 16),
                )
                : MyTextFeild(
                  hintText: 'Json ',
                  controller: jsonC,
                  maxLines: 10,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (!isGenerated) Text('  Set Private Fields'),

                if (!isGenerated)
                  Checkbox(
                    value: isFrivate,
                    onChanged: (v) {
                      setState(() {
                        isFrivate = !isFrivate;
                      });
                    },
                  ),
                isGenerated
                    ? MaterialButton(
                      color: Colors.blueGrey,
                      onPressed:
                          isCopyed
                              ? null
                              : () async {
                                await FlutterClipboard.copy(dartC.text);
                                if (isCopyed = false) {
                                  setState(() {
                                    isCopyed = true;
                                  });
                                }
                              },
                      child: MyText('Copy'),
                    )
                    : MaterialButton(
                      onPressed: () {
                        setState(() {
                          nameC.clear();
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
                        },
              ),
          ],
        ),
      ),
    );
  }
}
