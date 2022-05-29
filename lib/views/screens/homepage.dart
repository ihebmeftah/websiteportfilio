// ignore_for_file: avoid_web_libraries_in_flutter, avoid_print, unused_label

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websiteportfilio/views/screens/aboutsection.dart';
import 'package:websiteportfilio/views/screens/projectsection.dart';
import 'package:websiteportfilio/views/theme/theme.dart';
import 'package:http/http.dart' as http;

import '../../responsive.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  GlobalKey formkey = GlobalKey<FormState>();
  TextEditingController namectrl = TextEditingController();
  TextEditingController mailctrl = TextEditingController();
  TextEditingController msgctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: Responsive.isMobile(context) ? AppBar() : null,
      drawer: Visibility(
          visible: Responsive.isMobile(context),
          child: aboutSection(context: context)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              backgroundColor: bgColor,
              title: 'Send Email',
              content: SizedBox(
                width: Get.width / 2,
                child: Padding(
                  padding:
                      EdgeInsets.all(Responsive.isDesktop(context) ? 8.0 : 0),
                  child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          myformfields(
                              hintText: 'Name',
                              textInputType: TextInputType.name,
                              controller: namectrl,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          myformfields(
                              hintText: 'Email',
                              controller: mailctrl,
                              textInputType: TextInputType.emailAddress,
                              validator: (value) {
                                if (!GetUtils.isEmail(value!)) {
                                  return 'Email is not valid';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          myformfields(
                              hintText: 'Message',
                              controller: msgctrl,
                              textInputType: TextInputType.text,
                              maxlinex: 8,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field is required';
                                }
                                return null;
                              }),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    Responsive.isDesktop(context) ? 100 : 0),
                            child: MaterialButton(
                              height: 60,
                              onPressed: () {
                                if (namectrl.text.isNotEmpty &&
                                    mailctrl.text.isNotEmpty &&
                                    msgctrl.text.isNotEmpty) {
                                  sendEmail(
                                      name: namectrl.text,
                                      email: mailctrl.text,
                                      message: msgctrl.text);
                                  namectrl.text = '';
                                  mailctrl.text = '';
                                  msgctrl.text = '';
                                } else {
                                  Get.snackbar('ERROR', 'Verified Your Fields',
                                      backgroundColor:
                                          Colors.redAccent.withOpacity(0.4),
                                      margin:
                                          const EdgeInsets.all(defaultPadding));
                                }
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                              colorBrightness: Brightness.dark,
                              color: Colors.blueGrey,
                              elevation: 20.0,
                              highlightElevation: 1.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.white,
                                    child: Center(
                                        child: Icon(
                                      Icons.send,
                                      size: 15,
                                    )),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("SEND MAIL"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ));
        },
        child: const Icon(Icons.message),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: Row(children: [
                Visibility(
                  visible: Responsive.isDesktop(context),
                  child: Expanded(
                    flex: 2,
                    child: aboutSection(context: context),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 7,
                  child: SingleChildScrollView(
                    child: myProject(context: context),
                  ),
                )
              ]),
            )),
      ),
    ));
  }
}

myformfields(
        {required String? hintText,
        required TextInputType? textInputType,
        int? maxlinex,
        String? Function(String? val)? validator,
        TextEditingController? controller}) =>
    TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxlinex ?? 1,
      keyboardType: textInputType,
      decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.amber,
              width: 20,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              style: BorderStyle.none,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          filled: true,
          hintStyle: const TextStyle(color: Colors.white30),
          hintText: hintText),
    );

Future sendEmail(
    {required String? name,
    required String? email,
    required String? message}) async {
  const String serviceId = 'service_0s6cjnn';
  const String templateId = 'template_mwv3913';
  const String userId = '76lq3_LaB3rFocdaQ';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final respone = await http.post(url,
      headers: {
        'Content-Type': 'application/json',
        'origin': 'http://localhost'
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_message': message
        }
      }));
  Get.back();
  Get.snackbar('DONE', 'Mail sended successfully',
      backgroundColor: Colors.green.withOpacity(0.4),
      margin: const EdgeInsets.all(defaultPadding));

  print(respone);
}
