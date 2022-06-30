import 'package:classified_app/const/padding.dart';
import 'package:classified_app/const/strings.dart';
import 'package:classified_app/global/theme/textstyle.dart';
import 'package:classified_app/ui/classifield_list/bloc/classified_list_bloc.dart';
import 'package:classified_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchField extends StatefulWidget {
  final String text;
  SearchField({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    _controller.text = widget.text;
    super.initState();
  }

  // bool _isArticle = false;
  OutlineInputBorder buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        width: 1.4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            onTap: () {
              _controller.text = widget.text;
              _controller.selection = TextSelection.fromPosition(
                  TextPosition(offset: _controller.text.length));
            },
            textInputAction: TextInputAction.search,
            controller: _controller,

            onSubmitted: (value) {
              if (_controller.text.trim().isNotEmpty) {
                _dispatchSearch(context, value);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid query.")));
              }
              _controller.text = widget.text;
            },
            cursorColor: Theme.of(context).primaryColor,
            // cursorHeight: 30,

            style: TextStyle(fontSize: 24),
            decoration: InputDecoration(
                hintText: ConstantStrings.search,
                hintStyle: TextStyles.style21bold
                    .copyWith(color: Colors.grey.withOpacity(0.5)),
                contentPadding: EdgeInsets.all(10),
                prefix: Padding(
                  padding: ConstPadding.onlyR10,
                  child: Icon(
                    Icons.search,
                    size: 17,
                  ),
                ),
                border: buildOutlineInputBorder(Theme.of(context).primaryColor),
                focusedBorder:
                    buildOutlineInputBorder(Theme.of(context).primaryColor),
                enabledBorder:
                    buildOutlineInputBorder(Theme.of(context).primaryColor)),
          ),
          // Container(
          //   alignment: Alignment.centerRight,
          //   height: 40,
          //   width: MediaQuery.of(context).size.width / 2,
          //   child: Row(
          //     children: [
          //       Text(
          //         ConstantStrings.classifieds,
          //         style: TextStyle(fontSize: 14),
          //       ),
          //       Switch(
          //         activeColor: Theme.of(context).primaryColor,
          //         inactiveThumbColor: Theme.of(context).primaryColor,
          //         activeTrackColor: Theme.of(context).accentColor,
          //         inactiveTrackColor: Theme.of(context).accentColor,
          //         value: _isArticle,
          //         onChanged: (v) {
          //           setState(() {
          //             _isArticle = v;
          //           });
          //         },
          //       ),
          //       Text(
          //         ConstantStrings.articles,
          //         style: TextStyle(fontSize: 14),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  void _dispatchSearch(BuildContext context, String value) {
    // if (_isArticle) {
    //   BlocProvider.of<ArticleListBloc>(context).add(GetArticlesByName(value));
    //   NavRouter.navKey!.currentState!.pushNamed(RouteStrings.ArticleList);
    // } else {
    BlocProvider.of<ClassifiedListBloc>(context)
        .add(GetClassifiedsByName(value));
   // NavRouter.navKey!.currentState!.pushNamed(RouteStrings.ClassifiedList);
    // }
  }
}
