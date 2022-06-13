import 'package:classified_app/data/enums/gender_enum.dart';
import 'package:classified_app/data/enums/status_enum.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/register_user/const/string.dart';
import 'package:classified_app/ui/register_user/widgets/birthdate_widget.dart';
import 'package:classified_app/ui/register_user/widgets/radio_widget.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:classified_app/utils/app_messages.dart';
import 'package:classified_app/utils/format_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/data/models/user_model.dart';
import 'package:classified_app/utils/buttons.dart';
import 'package:classified_app/utils/textfields_Utils.dart';
import 'widgets/register_fields.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  List<String> _qualification = ['X', 'XII', 'Grad', 'P.G.', 'P.HD', 'None'];
  String? _selectedQualification;
  bool canPress = false;
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  Gender _gender = Gender.male;
  MaritalStatus _maritalStatus = MaritalStatus.single;

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      currentDate: DateTime.now(),
      initialDate: _selectedDate,
      firstDate: DateTime(1960, 1, 1),
      lastDate: DateTime(2200, 12, 31),
    );
    setState(() {
      _selectedDate = picked!;
    });
  }

  void getCurrentUser() {
    UserState state = context.read<UserBloc>().state;
    if (state is RegisteredUserState) {
      setState(() {
        _emailController.text = state.user.email ?? '';
        _nameTextController.text = state.user.username ?? '';
        _phoneController.text = state.user.mobileNumber ?? '';
        _gender = state.user.gender ?? Gender.male;
        _maritalStatus = state.user.maritalStatus ?? MaritalStatus.single;
        _selectedDate = state.user.birthdate ?? DateTime.now();
        _selectedQualification = state.user.qualification;
        validator();
      });
    } else if (state is NewUserState) {
      setState(() {
        _phoneController.text = state.phoneNumber;
      });
    }
  }

  validator() {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);
    bool val = regExp.hasMatch(_emailController.text);
    //This variable is used to verify if the email is valid otherwise no email is provided.
    bool emailNotEmptyAndValid = (val && _emailController.text.isNotEmpty) ||
        _emailController.text.isEmpty;
    var canhit = _nameTextController.text.isNotEmpty &&
        _phoneController.text.isNotEmpty &&
        emailNotEmptyAndValid &&
        _selectedQualification != null;

    if (canhit) {
      setState(() {
        canPress = true;
      });
    } else {
      setState(() {
        canPress = false;
      });
    }
  }

  void _getQualifications() {
    setState(() {
      _qualification =
          AppMessagesManager.getMessage(AppMessageKeys.qualifications)
              .split(",");
    });
  }

  @override
  void initState() {
    _getQualifications();
    _nameTextController.addListener(() {
      validator();
    });
    _phoneController.addListener(() {
      validator();
    });
    _emailController.addListener(() {
      validator();
    });
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          RegisterUserConstString.registerUser,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: ConstPadding.symmH10,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: ConstPadding.l12t25,
                        child: Text(RegisterUserConstString.name,
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 150.0, maxWidth: 250),
                          child: RegisterTextField(
                            _nameTextController,
                            RegisterUserConstString.enterName,
                            TextAlign.start,
                            TextInputType.name,
                            // onTap: () {
                            //   if (state is RegisteredUserState) {
                            //     BlocProvider.of<UserBloc>(context).add(
                            //         DeleteNameEvent(
                            //             userName: true,
                            //             email: state.isEmail,
                            //             phoneNumber: state.isNumbered));
                            //   }
                            // },
                            // onChanged: (_nameTextController) {
                            //   BlocProvider.of<UserBloc>(context).add(
                            //       UpdateNameEvent(_nameTextController));
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              EditUsersWidget(
                readOnly: true,
                controller: _phoneController,
                fieldName: RegisterUserConstString.mobileNumber,
                hintText: RegisterUserConstString.phoneNumber,
                inputType: TextInputType.phone,
                // onTap: () {
                //   if (state is RegisteredUserState) {
                //     BlocProvider.of<UserBloc>(context).add(
                //         DeletePhoneNumber(
                //             phoneNumber: true,
                //             email: state.isEmail,
                //             userName: state.isNamed));
                //   }
                // },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              RadioWidget<Gender>(
                values: Gender.values,
                groupValue: _gender,
                title: RegisterUserConstString.gender,
                onChanged: (Gender? value) {
                  setState(() {
                    _gender = value!;
                  });
                },
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              BirthDateWidget(
                fieldName: RegisterUserConstString.birthday,
                onTap: () {
                  _selectDate(context);
                },
                birthDaytext: formatAsDDMMYYYY(_selectedDate),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: RadioWidget<MaritalStatus>(
                  values: MaritalStatus.values,
                  groupValue: _maritalStatus,
                  title: RegisterUserConstString.maritalStatus,
                  onChanged: (MaritalStatus? value) {
                    setState(() {
                      _maritalStatus = value!;
                    });
                  },
                ),
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: ConstPadding.l12t11,
                        child: Text(RegisterUserConstString.emailId,
                            style: TextStyle(fontWeight: FontWeight.w400)),
                      ),
                      Container(
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 150.0, maxWidth: 250),
                          child: RegisterTextField(
                            _emailController,
                            RegisterUserConstString.emailId,
                            TextAlign.start,
                            TextInputType.name,
                            // onTap: () {
                            //   if (state is RegisteredUserState) {
                            //     BlocProvider.of<UserBloc>(context).add(
                            //         DeleteEmail(
                            //             email: true,
                            //             phoneNumber: state.isNumbered,
                            //             userName: state.isNamed));
                            //   }
                            // },
                            // onChanged: (_nameTextController) {
                            //   BlocProvider.of<UserBloc>(context).add(
                            //       UpdateNameEvent(_nameTextController));
                            // },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: ConstPadding.onlyl12,
                    child: Text('Qualification',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 16.5)),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: false,
                      isDense: false,
                      focusColor: Theme.of(context).primaryColor,

                      // underline: Container(
                      //   height: 1.0,
                      //   decoration: const BoxDecoration(
                      //     border: Border(
                      //       bottom: BorderSide(
                      //         color: Colors.black,
                      //         width: 0.0,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      hint: Text('Select Your Qualification'),
                      // elevation: 5,
                      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
                      iconSize: 34,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).primaryColor,
                      ),
                      value: _selectedQualification,
                      items: _qualification.map((value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Container(
                              padding: ConstPadding.symmH10,
                              child: Text(value)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedQualification = value!;
                          validator();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                height: 15,
              ),
              (canPress)
                  ? submitButton(() async {
                      BlocProvider.of<UserBloc>(context).add(UpdateUserEvent(
                          UserModel(
                              birthdate: _selectedDate,
                              email: _emailController.text,
                              mobileNumber: _phoneController.text,
                              gender: _gender,
                              username: _nameTextController.text,
                              maritalStatus: _maritalStatus,
                              qualification: _selectedQualification)));

                      BlocProvider.of<AuthenticationBloc>(context)
                          .add(AppStarted());

                      NavRouter.navKey!.currentState!
                          .popUntil((route) => route.isFirst);
                    }, context, RegisterUserConstString.save)
                  : Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Theme.of(context).primaryColor.withOpacity(0.7),
                                Theme.of(context).primaryColor.withAlpha(190)
                              ])),
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
              SpaceHeightWithValue(height: 20)
            ],
          ),
        ),
      ),
    );
    // }));
  }
}
