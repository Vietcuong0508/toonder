import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toonder_app/bloc/explore/explore_bloc.dart';
import 'package:toonder_app/screen/explore/category_item.dart';
import 'package:toonder_app/screen/explore/drop_down.dart';
import 'package:toonder_app/screen/explore/list-book.dart';

class RatingView extends StatefulWidget {
  const RatingView({
    super.key,
  });

  @override
  State<RatingView> createState() => _RatingViewState();
}

class _RatingViewState extends State<RatingView>
    with AutomaticKeepAliveClientMixin {
  int _itemSelect = 2;
  int _itemFilter = 1;
  final ExploreBloc _exploreBloc = ExploreBloc();

  @override
  void initState() {
    super.initState();
    _exploreBloc.add(GetRankBook(_itemSelect, _itemFilter));
  }

  void select() {
    _exploreBloc.add(GetRankBook(_itemSelect, _itemFilter));
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
    itemFilter.add({'name': 'Top tháng', 'value': 1});
    itemFilter.add({'name': 'Top tuần', 'value': 3});
    itemFilter.add({'name': 'Toàn bộ', 'value': 2});

    List<dynamic> itemFilter1 = [];
    itemFilter1.add({'name': 'Tháng này', 'value': 1});
    itemFilter1.add({'name': 'Tháng trước', 'value': 2});

    List<dynamic> itemMenu = [];
    itemMenu.add({'name': 'Top view', 'value': 2});
    itemMenu.add({'name': 'Top like', 'value': 1});
    itemMenu.add({'name': 'Truyện mới', 'value': 3});
    itemMenu.add({'name': 'Truyện full', 'value': 4});
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          height: width * 45,
          decoration: const BoxDecoration(
              border: Border.symmetric(
                  horizontal: BorderSide(width: 1, color: Color(0xFF2F2F47)))),
          child: Padding(
            padding: EdgeInsets.only(left: width * 15),
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
          items: itemMenu[2]['value'] == 3 || itemMenu[3]['value'] == 4
              ? itemFilter1
              : itemFilter,
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
