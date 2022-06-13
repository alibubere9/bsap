import 'package:classified_app/data/models/best_deal.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/widgets/field_fieldname.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/utils/buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bestdeal_bloc.dart';

// ignore: must_be_immutable
class BestDeal extends StatefulWidget {
  final int? classifiedId;
  final String? classifiedName;
  BestDeal({
    Key? key,
    this.classifiedId,
    this.classifiedName,
  }) : super(key: key);

  @override
  _BestDealState createState() => _BestDealState();
}

class _BestDealState extends State<BestDeal> {
  TextEditingController nameController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  clearFields() {
    nameController.clear();
    mobileController.clear();
    emailController.clear();
  }

  @override
  void initState() {
    UserState userState = context.read<UserBloc>().state;
    if (userState is RegisteredUserState) {
      nameController.text = userState.user.username!;
      mobileController.text = userState.user.mobileNumber!;
      emailController.text = userState.user.email!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestDealBloc, BestDealState>(builder: (context, state) {
      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            ConstantStrings.bestDeal,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  widget.classifiedName!,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FieldNameAndField(
                controller: nameController,
                keyboardType: TextInputType.name,
                text: 'Name',
              ),
              SizedBox(height: 12),
              FieldNameAndField(
                controller: mobileController,
                text: 'Mobile No.',
                keyboardType: TextInputType.phone,
                // prefixWidget: Text('+91  '),
                prefixText: '+91',
              ),
              SizedBox(height: 12),
              FieldNameAndField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                text: 'Email Id',
              ),
              Padding(
                padding: ConstPadding.l30t25r30b25,
                child: submitButton(() {
                  if (nameController.text.isEmpty ||
                      mobileController.text.isEmpty ||
                      emailController.text.isEmpty) {
                    showDialogFunc(
                        alert: "Alert",
                        content: 'Please fill the empty fields!',
                        context: context);
                  } else {
                    BestDealState state = context.read<BestDealBloc>().state;
                    if (state is NavigatedBestDeal) {
                      BlocProvider.of<BestDealBloc>(context).add(SubmitBestDeal(
                          BestDealModel(
                              classifiedId: state.classifiedId,
                              customerId: state.customerId,
                              email: emailController.text,
                              name: nameController.text,
                              phoneNumber: mobileController.text)));
                    }
                    clearFields();
                    showDialogFunc(
                        alert: "Alert",
                        content:
                            'Your request is submitted we will notify you soon!',
                        context: context);
                  }
                }, context, 'Submit'),
              ),
              Container(
                padding: ConstPadding.l18t15r10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ConstantStrings.howItWorks,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(height: 5),
                    Text(
                      AppMessagesManager.getMessage(AppMessageKeys.bestDeal),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  showDialogFunc(
      {String? alert, String? content, required BuildContext context}) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text(alert!),
              content: Text(content!),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(ConstantStrings.back),
                  onPressed: () {
                    NavRouter.navKey!.currentState!.pop();
                  },
                ),
              ],
            ));
  }

  SnackBar buildSnackBar(double width, String message) {
    return SnackBar(
      duration: Duration(seconds: 10),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: Colors.blue.shade700,
          ),
          SpaceWidthWithValue(width: 8),
          Container(width: width * 0.73, child: Text(message)),
        ],
      ),
      // action: SnackBarAction(
      //   label: 'CLOSE',
      //   textColor: Colors.white,
      //   onPressed: close,
      // ),
      backgroundColor: Colors.black,
    );
  }
}
