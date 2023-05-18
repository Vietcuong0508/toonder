import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_app/bloc/explore/explore_bloc.dart';
import 'package:toonder_app/screen/explore/category_item.dart';
import 'package:toonder_app/screen/explore/drop_down.dart';
import 'package:toonder_app/screen/explore/list-book.dart';

class ReleaseScheduleView extends StatefulWidget {
  const ReleaseScheduleView({
    super.key,
  });

  @override
  State<ReleaseScheduleView> createState() => _ReleaseScheduleViewState();
}

class _ReleaseScheduleViewState extends State<ReleaseScheduleView>
    with AutomaticKeepAliveClientMixin {
  int _itemSelect = 2;
  int _itemFilter = 1;
  final ExploreBloc _exploreBloc = ExploreBloc();

  @override
  void initState() {
    super.initState();
    _exploreBloc.add(GetReleaseScheduleBook(_itemSelect, _itemFilter));
  }

  void select() {
    _exploreBloc.add(GetReleaseScheduleBook(_itemSelect, _itemFilter));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double width = MediaQuery.of(context).size.width / 375;

    List<dynamic> itemFilter = [];
    itemFilter.add({
      'icon': Icon(Icons.remove_red_eye_outlined, size: width * 16),
      'name': 'Lượt xem',
      'value': 1
    });
    itemFilter.add({
      'icon': Icon(
        Icons.favorite_outline,
        size: width * 16,
      ),
      'name': 'Lượt like',
      'value': 2
    });

    List<dynamic> itemMenu = [];
    itemMenu.add({'name': 'T2', 'value': 2});
    itemMenu.add({'name': 'T3', 'value': 3});
    itemMenu.add({'name': 'T4', 'value': 4});
    itemMenu.add({'name': 'T5', 'value': 5});
    itemMenu.add({'name': 'T6', 'value': 6});
    itemMenu.add({'name': 'T7', 'value': 7});
    itemMenu.add({'name': 'CN', 'value': 1});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: width * 45,
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(width: 1, color: Color(0xFF2F2F47)))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemMenu.length,
                itemBuilder: (context, index) => CategoryItem(
                    name: itemMenu[index]['name'],
                    active: itemMenu[index]['value'] == _itemSelect,
                    onTap: () {
                      setState(() {
                        _itemSelect = itemMenu[index]['value'];
                      });
                      select();
                    })),
          ),
        ),
        DropDown(
          items: itemFilter,
          onTap: (value) {
            setState(() {
              _itemFilter = value;
            });
            select();
          },
        ),
        BlocProvider(
          create: (_) => _exploreBloc,
          child: BlocConsumer<ExploreBloc, ExploreState>(
            buildWhen: (previous, current) {
              return current is ExploreLoaded;
            },
            listenWhen: (previous, current) {
              return current is ExploreLoading || current is ExploreInitial;
            },
            listener: (context, state) {
              if (state is ExploreError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message!)));
              }
            },
            builder: (context, state) {
              if (state is ExploreLoaded) {
                return Expanded(
                  flex: 11,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) => ExploreBook(
                      info: state.books.info![index],
                      index: index + 1,
                    ),
                    itemCount: state.books.info!.length,
                  ),
                );
              } else {
                return _buildLoading();
              }
            },
          ),
        )
      ],
    );
  }

  Widget _buildLoading() =>
      Center(child: Image.asset('assets/images/logo_footer.png'));

  @override
  bool get wantKeepAlive => true;
}
