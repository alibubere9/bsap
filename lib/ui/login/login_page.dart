import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/beizerdesign/beizer.dart';
import 'package:classified_app/global/widgets/beizerdesign/biezer2.dart';
import 'package:classified_app/global/widgets/loading_indicator.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/nullsafe-dependencies/pin-entry.dart';
import 'package:classified_app/utils/textfields_Utils.dart';
import 'package:classified_app/utils/buttons.dart';
import 'package:classified_app/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import 'bloc/login_bloc.dart';

GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => sl<LoginBloc>(),
      child: Scaffold(
        key: scaffoldKey,
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, loginState) {
        if (loginState is ExceptionState || loginState is OtpExceptionState) {
          String? message;
          if (loginState is ExceptionState) {
            message = loginState.message;
          } else if (loginState is OtpExceptionState) {
            message = loginState.message;
          }
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnackBar(width, message!),
          );
        }
      },
      child: Container(
        // height: height,
        child: Stack(
          children: [
            // Positioned(
            //     top: 600 * .10,
            //     right: -MediaQuery.of(context).size.width * .4,
            //     child: BezierContainer()),
            // Positioned(
            //     bottom: 800 * .65,
            //     left: -MediaQuery.of(context).size.width * .2,
            //     child: BezierDarkContainer()),
            // Positioned(
            //     bottom: -1500 * .20,
            //     right: -MediaQuery.of(context).size.width * .4,
            //     child: BezierContainer()),
            // Positioned(
            //     bottom: -1400 * .40,
            //     left: -MediaQuery.of(context).size.width * .2,
            //     child: BezierDarkContainer()),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Logo(
                          width: width * 0.7,
                        ),
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                        return getViewAsPerState(state, context);
                      }),
                      SizedBox(height: height * .055),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SnackBar buildSnackBar(double width, String message) {
    return SnackBar(
      duration: Duration(seconds: 10),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.error,
            color: Colors.red,
          ),
          SpaceWidthWithValue(width: 5),
          Container(width: width * 0.62, child: Text(message)),
        ],
      ),
      action: SnackBarAction(
        label: 'CLOSE',
        textColor: Colors.white,
        onPressed: close,
      ),
      backgroundColor: Colors.black,
    );
  }

  void close() {
    ScaffoldMessengerState().hideCurrentSnackBar();
  }

  getViewAsPerState(LoginState state, BuildContext context) {
    if (state is Unauthenticated) {
      return NumberInput();
    } else if (state is OtpSentState || state is OtpExceptionState) {
      return OtpInput();
    } else if (state is LoadingState) {
      return LoadingIndicator();
    } else if (state is LoginCompleteState) {
      BlocProvider.of<AuthenticationBloc>(context)
          .add(LoggedInEvent(firebaseUser: state.firebaseUser));
      return Container();
    } else {
      return NumberInput();
    }
  }
}

class NumberInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _phoneTextController = TextEditingController();

  Widget entryField(TextEditingController controller) {
    return Form(
      key: _formKey,
      child: EditTextUtils().getCustomEditTextArea(
          labelValue: "Enter phone number",
          controller: controller,
          keyboardType: TextInputType.number,
          icon: Icons.phone,
          validator: (value) {
            return validatePhone(value);
          }),
    );
  }

  // String validateMobile(String value) {
  //   if (value.length != 10)
  //     return 'Mobile Number must be of 10 digit';
  //   else
  //     return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // SizedBox(height: height * .3),
        entryField(_phoneTextController),
        SizedBox(
          height: 12,
        ),
        submitButton(() {
          if (_formKey.currentState!.validate()) {
            BlocProvider.of<LoginBloc>(context).add(SendOtpEvent(
                phoNo: "+91" + _phoneTextController.value.text,
                context: context));
          }
        }, context, 'Login'),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(ConstantStrings.otp,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    );
  }
}

class OtpInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          child: Padding(
            padding: ConstPadding.l16t48r17b16,
            child: Column(
              children: <Widget>[
                Container(
                  height: 48,
                  width: double.infinity,
                  child: PinEntryTextField(
                      showFieldAsBox: true,
                      fields: 6,
                      onSubmit: (String pin) {
                        BlocProvider.of<LoginBloc>(context)
                            .add(VerifyOtpEvent(otp: pin));
                      }),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Enter your One Time Password above',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                // ElevatedButton(
                //   onPressed: () {
                //     String phnNumber =
                //         BlocProvider.of<LoginBloc>(context).phNumber;
                //     BlocProvider.of<LoginBloc>(context).sendOtp(phnNumber);
                //   },
                //   child: Text("Resend OTP"),
                // )
              ],
            ),
          ),
          constraints: BoxConstraints.tight(Size.fromHeight(200)),
        ),
      ],
    );
  }
}
