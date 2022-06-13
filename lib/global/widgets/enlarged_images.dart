import 'package:classified_app/const/strings.dart';
import 'package:classified_app/utils/url_concat.dart';
import 'package:flutter/material.dart';

import 'close_button.dart';
import 'image_loading.dart';

class EnlargedImage extends StatefulWidget {
  final List<String>? imageUrls;
  final int selectedIndex;

  const EnlargedImage({
    Key? key,
    required this.imageUrls,
    required this.selectedIndex,
  }) : super(key: key);
  @override
  _EnlargedImageState createState() => _EnlargedImageState();
}

class _EnlargedImageState extends State<EnlargedImage> {
  List<String>? _images = [];
  int _selectedImage = 0;
  @override
  void initState() {
    _images = widget.imageUrls;
    _selectedImage = widget.selectedIndex;
    super.initState();
  }

  void _select(int index) {
    setState(() {
      _selectedImage = index;
    });
  }

  void _previous() {
    if (_selectedImage != 0) {
      setState(() {
        _selectedImage--;
      });
    }
  }

  void _next() {
    if (_selectedImage != _images!.length - 1) {
      setState(() {
        _selectedImage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ConstantStrings.images,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        leading: CloseButtonCircle(),
      ),
      body: SafeArea(
          child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //     icon: Icon(
                //       FontAwesomeIcons.chevronLeft,
                //       color: _selectedImage == 0
                //           ? Colors.grey
                //           : Theme.of(context).primaryColor,
                //       size: 40,
                //     ),
                //     onPressed: _previous),
                GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      _previous();
                    } else if (details.primaryVelocity! < 0) {
                      _next();
                    }
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      width: width * 0.947,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          UrlConcat.concatUrl(_images![_selectedImage]),
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : ImageLoading(
                                    height: 500,
                                    width: width * 0.947,
                                  );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                // IconButton(
                //     icon: Icon(
                //       FontAwesomeIcons.chevronRight,
                //       color: _selectedImage == _images.length - 1
                //           ? Colors.grey
                //           : Theme.of(context).primaryColor,
                //       size: 40,
                //     ),
                //     onPressed: _next),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              child: ListView.builder(
                itemCount: _images!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final String e = _images![index];
                  return GestureDetector(
                    onTap: () {
                      _select(index);
                    },
                    child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: (_selectedImage == index)
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,
                                width: 2)),
                        width: 50,
                        child: Image.network(
                          UrlConcat.concatUrl(e),
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            return loadingProgress == null
                                ? child
                                : ImageLoading(
                                    height: 50,
                                    width: 50,
                                  );
                          },
                        )),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}
