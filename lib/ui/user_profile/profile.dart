import 'dart:io';
import 'dart:ui';
import 'package:classified_app/const/image_paths.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/widgets/notification_button.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/global/widgets/user_image_shimmer.dart';
import 'package:classified_app/global/widgets/user_profile_shimmer.dart';
import 'package:classified_app/router.dart';
import 'package:classified_app/ui/user/bloc/user_bloc.dart';
import 'package:classified_app/utils/name_abbrievation.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'Widgets/contact_widget.dart';
import 'Widgets/navigator_widget.dart';

class UserProfileScreen extends StatelessWidget {
  void _chooseImage(BuildContext context) {
    openBottomSheet(context);
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              height: 135,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(FontAwesomeIcons.image),
                    title: Text(ConstantStrings.gallery),
                    onTap: () async {
                      await updateImage(ImageSource.gallery, context);
                    },
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                      leading: Icon(FontAwesomeIcons.camera),
                      title: Text(ConstantStrings.camera),
                      onTap: () async {
                        await updateImage(ImageSource.camera, context);
                      }),
                ],
              ),
            ));
  }

  Future updateImage(ImageSource source, BuildContext context) async {
    PickedFile? pickedFile = await ImagePicker()
        .getImage(source: source, maxHeight: 250, maxWidth: 250);
    NavRouter.navKey!.currentState!.pop();
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      BlocProvider.of<UserBloc>(context).add(UpdateUserImage(file));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            ConstantStrings.profile,
            style:
                TextStyle(color: Theme.of(context).primaryColor, fontSize: 22),
          ),
          actions: [NotificationButton(), SpaceWidthWithValue(width: 15)],
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocBuilder<UserBloc, UserState>(builder: (context, state) {
            return (state is RegisteredUserState)
                ? Column(
                    children: [
                      Container(
                          padding: ConstPadding.all8,
                          height: 220,
                          child: buildStack(context, state)),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        state.user.username!,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: ConstPadding.symmH20V8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NavigatorWidget(
                              icon: FontAwesomeIcons.userEdit,
                              constString: ConstantStrings.edit,
                              onTap: () {
                                NavRouter.navKey!.currentState!
                                    .pushNamed(RouteStrings.SignUp);
                              },
                            ),
                            NavigatorWidget(
                              icon: FontAwesomeIcons.image,
                              constString: ConstantStrings.changePicture,
                              onTap: () {
                                _chooseImage(context);
                              },
                            ),
                            NavigatorWidget(
                              icon: FontAwesomeIcons.cog,
                              constString: ConstantStrings.settings,
                              onTap: () {
                                NavRouter.navKey!.currentState!
                                    .pushNamed(RouteStrings.Settings);
                              },
                            ),
                            //
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.6)),
                      Container(
                          padding: ConstPadding.symmH20V5,
                          child: Column(
                            children: [
                              Contacts(
                                icon: FontAwesomeIcons.envelopeOpen,
                                hintText: ConstantStrings.email,
                                text: state.user.email,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Divider(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.6)),
                              Contacts(
                                icon: FontAwesomeIcons.phone,
                                hintText: ConstantStrings.phone,
                                text: state.user.mobileNumber,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ))
                    ],
                  )
                : Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    child: UserProfileShimmer(),
                  );
          }),
        ));
  }

  Stack buildStack(BuildContext context, RegisteredUserState state) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(12)),
          height: 150,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 120, sigmaX: 20,
                //  tileMode: TileMode.decal
              ),
              child: Image.network(
                UrlConcat.concatUrl(
                    state.user.image ?? ImagePaths.noImageUrl),
                loadingBuilder: (context, child, loadingProgress) {
                  return loadingProgress == null
                      ? child
                      : ProfileRectImageShimmer();
                },
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(color: Colors.white, width: 2.5),
              borderRadius: BorderRadius.circular(100),
            ),
            child: CircleAvatar(
              radius: 65,
              child: (state.user.image != null && state.user.image!.isNotEmpty)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        UrlConcat.concatUrl(
                            state.user.image ?? ImagePaths.noImageUrl),
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                        loadingBuilder: (context, child, loadingProgress) {
                          return loadingProgress == null
                              ? child
                              : ProfileCircleImageShimmer( );
                        },
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Text(
                        StringFunctions.abbrievate(state.user.username!),
                        style: TextStyle(color: Colors.white, fontSize: 38),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
