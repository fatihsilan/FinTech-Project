import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:gamebook/app/controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("GameBook")),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Lütfen Hesap ID'si Giriniz"),
              SizedBox(
                height: 20,
              ),
              Form(
                key: controller.initFormKey,
                child: Center(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(flex: 5, child: Center(child: Text("ID"))),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(
                            flex: 5,
                            child: Center(
                                child: TextFormField(
                              controller: controller.idController,
                              maxLength: 17,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              maxLines: 1,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ))),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        Expanded(
                            flex: 5,
                            child: Center(
                                child: ElevatedButton(
                              onPressed: controller.getData,
                              child: Text("Sorgula"),
                            ))),
                        Spacer(
                          flex: 2,
                        )
                      ],
                    ),
                  ],
                )),
              ),
            ],
          ),
        ));
  }
}
