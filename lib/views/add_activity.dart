import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:psl_foundation/Data/activity_model.dart';
import 'package:psl_foundation/views/widgets/appbar.dart';
import 'package:psl_foundation/views/widgets/custom_raised_button.dart';

import '../constant.dart';
class AddActivity extends StatefulWidget {
  const AddActivity({Key? key}) : super(key: key);

  @override
  State<AddActivity> createState() => _AddActivityState();
}

class _AddActivityState extends State<AddActivity> {

  final GlobalKey<FormBuilderState> _activityKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PFAppBar(title: "Add Activity"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(kDefaultSpace),
          child: FormBuilder(
              key: _activityKey,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Activity_Id",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Activity ID",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),
                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Title",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      labelText: "Activity Title",
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1.5, color: Colors.black26)
                      )
                    ),
                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Activity_Type",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Activity Type",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),

                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Location",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Location of Activity",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),

                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  child: FormBuilderDateTimePicker(name: "Date",

                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Date and Time",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),
                    onChanged: (val){
                      _activityKey.currentState?.save();
                     _activityKey.currentState?.setInternalFieldValue("Date",
                         _activityKey.currentState?.fields["Date"]?.value.toString(), isSetState: true);
                      _activityKey.currentState?.save();
                    },
                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Notification_Duration",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Notify After",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),

                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Whatsapp_Chat_Link ",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Communication Link",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),

                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Description",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Description",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),

                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: kVerticalSpace),
                  child: FormBuilderTextField(
                    name: "Lives_Touched",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                        labelText: "Lives Touched",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5, color: Colors.black26)
                        )
                    ),

                    validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required()
                        ]
                    ),
                  ),
                ),
                PFRaisedButton(title: "Submit",
                onPressed: (){
                bool? isValid = _activityKey.currentState?.isValid;

                if(isValid!){
                  _activityKey.currentState?.save();
                  Map<String, dynamic> o = _activityKey.currentState!.value;
                  ActivityModel activity = ActivityModel.fromJson(o);
                }
                else{
                  Get.snackbar("Please enter all values", "message",
                    snackPosition: SnackPosition.BOTTOM

                  );
                }


                },
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}