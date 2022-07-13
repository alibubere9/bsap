import 'package:classified_app/data/mock/mock_mtrEntrySection.dart';
import 'package:classified_app/global/auth/bloc/authentication_bloc.dart';
import 'package:classified_app/global/widgets/logo_widget.dart';
import 'package:classified_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:classified_app/const/padding.dart';
import 'package:classified_app/global/widgets/spaces.dart';
import 'package:classified_app/ui/drawer/app_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../const/icons.dart';
import '../../utils/hex_color_extension.dart';
import 'bloc/home_bloc.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return
            // (state is Unauthenticated)
            //     ? LoginPage()
            //     :
            Scaffold(
                appBar: _buildAppBar(context),
                drawer: AppDrawer(),
                body: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return (state is HomeLoaded)
                        ? SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Padding(
                              padding: ConstPadding.all12,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SpaceHeightWithValue(height: 1),
                                  Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              3.4,
                                      width: 400,
                                      child: CarouselWithIndicatorDemo()),
                                  SizedBox(height: 10),
                                  GridView.count(
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    childAspectRatio: 3 / 1.3,
                                    children: [
                                      DashboardCard(
                                          leading: Icon(
                                              FontAwesomeIcons.shirtsinbulk,
                                              size: 33,
                                              color: ColorExtensions.fromHex(
                                                  "#B22222")),
                                          onTap: () {},
                                          subtitleText: "Packing Slip",
                                          titleText: 'Bale'),
                                      DashboardCard(
                                          leading: Icon(
                                              FontAwesomeIcons.receipt,
                                              size: 33,
                                              color: ColorExtensions.fromHex(
                                                  "#800080")),
                                          onTap: () {
                                            NavRouter.navKey!.currentState!
                                                .pushNamed(
                                                    RouteStrings.ChallanList);
                                          },
                                          subtitleText: "Meter Entry",
                                          titleText: 'Challan'),
                                      DashboardCard(
                                          leading: Icon(FontAwesomeIcons.ankh,
                                              size: 33,
                                              color: ColorExtensions.fromHex(
                                                  "#FF0000")),
                                          onTap: () {},
                                          subtitleText: "Meter Entry",
                                          titleText: 'Taka Actual'),
                                      DashboardCard(
                                          leading: Icon(
                                              FontAwesomeIcons.boxOpen,
                                              size: 33,
                                              color: ColorExtensions.fromHex(
                                                  "#C4A484")),
                                          onTap: () {},
                                          subtitleText: "Meter Entry",
                                          titleText: 'Goods Return'),
                                      DashboardCard(
                                          leading: Icon(
                                              FontAwesomeIcons.pencilRuler,
                                              size: 33,
                                              color: ColorExtensions.fromHex(
                                                  "#B22222")),
                                          onTap: () {},
                                          subtitleText: "Gradation Entry",
                                          titleText: 'Gradation')
                                    ],
                                  )
                                  // GridView.builder(
                                  //     gridDelegate:
                                  //         const SliverGridDelegateWithMaxCrossAxisExtent(
                                  //             maxCrossAxisExtent: 200,
                                  //             childAspectRatio: 3 / 1.3,
                                  //             crossAxisSpacing: 20,
                                  //             mainAxisSpacing: 20),
                                  //     itemCount: 5,
                                  //     physics: BouncingScrollPhysics(),
                                  //     shrinkWrap: true,
                                  //     itemBuilder: (context, index) {
                                  //       return DashboardCard();
                                  //     })
                                ],
                              ),
                            ),
                          )
                        : Container();
                  },
                ));
      },
    );
  }
}

class DashboardCard extends StatelessWidget {
  final Function()? onTap;
  final Widget? leading;
  final String? titleText;
  final String? subtitleText;
  const DashboardCard({
    this.leading,
    this.onTap,
    this.subtitleText,
    this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      // (() {
      //   NavRouter.navKey!.currentState!.pushNamed(RouteStrings.MeterEntry);
      // }),
      child: Card(
        child: Container(
          alignment: Alignment.center,
          child: ListTile(
              minLeadingWidth: 12,
              leading: leading,
              // IconMap.copyColor(
              //   IconMap.iconById(state.entrySectionList![index].iconId)!,
              //   size: 33,
              //   color: (state.entrySectionList![index].color != null)
              //       ?
              //       : Theme.of(context).primaryColor,
              // ),
              title: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: Text(titleText!,
                    //state.entrySectionList![index].name!,
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              ),
              subtitle: Text(
                subtitleText!,
                // state.entrySectionList![index].subName!,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              )),
          decoration: BoxDecoration(
              //color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}

AppBar _buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
    title: Logo(),
    actions: const [
      // ProfileButton(),
      SpaceWidthWithValue(
        width: 15,
      )
    ],
  );
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Carousel with indicator controller demo')),
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              MockEntrySection.entriesSection.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 9.0,
                height: 9.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Theme.of(context).primaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]),
    );
  }
}

final List<Widget> imageSliders = MockEntrySection.entriesSection
    .map((item) => Container(
          //width: 500,
          child: Container(
            width: 500,
            margin: EdgeInsets.all(1.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.blue.shade900),
                      width: 400,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(child: item.iconId),
                          Center(
                              child: Text(
                            item.name!,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();
