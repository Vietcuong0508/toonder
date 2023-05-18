import 'package:flutter/material.dart';
import 'package:toonder_app/page/explore/category_view.dart';
import 'package:toonder_app/page/explore/rating_view.dart';
import 'package:toonder_app/page/explore/release_schedule_view.dart';

class NestedMenu extends StatefulWidget {
  const NestedMenu({super.key});

  @override
  State<NestedMenu> createState() => _NestedMenuState();
}

class _NestedMenuState extends State<NestedMenu>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Scaffold(
      backgroundColor: const Color(0xFF1A182E),
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Khám phá",
            style: TextStyle(fontSize: width * 34),
          )),
      body: NestedScrollView(
        body: TabBarView(
          controller: _controller,
          children: const <Widget>[
            RatingView(),
            CategoryView(),
            ReleaseScheduleView()
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: const Color(0xFF1A182E),
              flexibleSpace: TabBar(
                indicatorColor: const Color(0xFFFC5A15),
                controller: _controller,
                tabs: const [
                  Tab(child: Rating()),
                  Tab(child: Category()),
                  Tab(child: CalendarRelease()),
                ],
              ),
            ),
          ];
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class CalendarRelease extends StatelessWidget {
  const CalendarRelease({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Text("Lịch ra mắt", style: TextStyle(fontSize: width * 17));
  }
}

class Category extends StatelessWidget {
  const Category({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Text("Thể loại", style: TextStyle(fontSize: width * 17));
  }
}

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return Text(
      "Xếp hạng",
      style: TextStyle(fontSize: width * 17),
    );
  }
}
