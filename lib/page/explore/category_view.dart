import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:toonder_app/bloc/category/category_bloc.dart';
import 'package:toonder_app/bloc/explore/explore_bloc.dart';
import 'package:toonder_app/model/category_model.dart';
import 'package:toonder_app/screen/explore/category_book.dart';
import 'package:toonder_app/screen/explore/category_item.dart';
import 'package:toonder_app/screen/explore/drop_down.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({
    super.key,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with AutomaticKeepAliveClientMixin {
  int _itemSelect = 0;
  int _selectIndex = 0;
  int _itemFilter = 1;
  final ExploreBloc _exploreBloc = ExploreBloc();
  final CategoryBloc _categoryBloc = CategoryBloc();
  final ItemScrollController _scrollController = ItemScrollController();

  var _visible = true;
  var _visible1 = false;

  List<Info> info = [];

  @override
  void initState() {
    super.initState();
    _exploreBloc.add(GetCategoryBook(_itemSelect, _itemFilter));
    _categoryBloc.add(GetCategoryList());
  }

  void select() {
    _exploreBloc.add(GetCategoryBook(_itemSelect, _itemFilter));
  }

  void _toggle() {
    setState(() {
      _visible = !_visible;
      _visible1 = !_visible1;
    });
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
    itemFilter.add({
      'icon': SvgPicture.asset("assets/icons/refresh.svg"),
      'name': 'Mới cập nhật',
      'value': 3
    });
    return Stack(
      children: [
        Visibility(
          visible: _visible,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                height: width * 45,
                decoration: const BoxDecoration(
                    border: Border.symmetric(
                        horizontal:
                            BorderSide(width: 1, color: Color(0xFF2F2F47)))),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: width * 5,
                  ),
                  child: BlocProvider(
                    create: (_) => _categoryBloc,
                    child: BlocConsumer<CategoryBloc, CategoryState>(
                      buildWhen: (previous, current) {
                        return current is CategoryLoaded ||
                            current is CategoryLoading;
                      },
                      listenWhen: (previous, current) {
                        return current is CategoryLoading ||
                            current is CategoryInitial ||
                            current is CategoryLoaded;
                      },
                      listener: (context, state) {
                        if (state is CategoryError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.message!)));
                        }
                        if (state is CategoryLoaded) {
                          Category category = state.category;
                          info = category.info!;
                          info.insert(
                              0,
                              Info(
                                  categoryName: "Tất cả",
                                  categoryId: 0,
                                  iconLink:
                                      "https://res.cloudinary.com/dzn2tvrbx/image/upload/v1683691237/all-icon_pbi5ce.png"));
                        }
                      },
                      builder: (context, state) {
                        if (info.isNotEmpty) {
                          return Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: width * 45),
                                child: ScrollablePositionedList.builder(
                                    itemScrollController: _scrollController,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: info.length,
                                    itemBuilder: (context, index) {
                                      return CategoryItem(
                                          name: info[index].categoryName!,
                                          active: info[index].categoryId! != 0
                                              ? info[index].categoryId! - 2 ==
                                                  _selectIndex
                                              : info[index].categoryId! ==
                                                  _selectIndex,
                                          onTap: () {
                                            _scrollController.scrollTo(
                                                index: info[index]
                                                            .categoryId! ==
                                                        0
                                                    ? info[index].categoryId!
                                                    : info[index].categoryId! -
                                                        2,
                                                duration: const Duration(
                                                    milliseconds: 500));
                                            setState(() {
                                              _itemSelect =
                                                  info[index].categoryId!;
                                              _selectIndex = info[index]
                                                          .categoryId! !=
                                                      0
                                                  ? info[index].categoryId! - 2
                                                  : info[index].categoryId!;
                                            });
                                            select();
                                          });
                                    }),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    bottom: width * 3, right: width * 8),
                                child: Container(
                                  width: width * 36,
                                  height: width * 36,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: const Color(0xFF27273F)),
                                      borderRadius: BorderRadius.circular(40),
                                      color: const Color(0xFF27273F)
                                          .withOpacity(0.6)),
                                  child: IconButton(
                                      padding: const EdgeInsets.only(
                                          right: 0, top: 1),
                                      splashRadius: 18,
                                      onPressed: () {
                                        _toggle();
                                      },
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down)),
                                ),
                              )
                            ],
                          );
                        }
                        return _buildLoading();
                      },
                    ),
                  ),
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
                    return current is ExploreLoading ||
                        current is ExploreInitial;
                  },
                  listener: (context, state) {
                    if (state is ExploreError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.message!)));
                    }
                  },
                  builder: (context, state) {
                    if (state is ExploreLoaded) {
                      return state.books.info!.isEmpty
                          ? Expanded(
                              flex: 11,
                              child: Image.asset(
                                'assets/images/duck.gif',
                                fit: BoxFit.cover,
                              ))
                          : Expanded(
                              flex: 11,
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) => CategoryBook(
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
          ),
        ),
        filterPage(width),
      ],
    );
  }

  Visibility filterPage(double width) {
    return Visibility(
      visible: _visible1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(
                      horizontal:
                          BorderSide(width: 1, color: Color(0xFF2F2F47)))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Danh sách thể loại',
                      style: TextStyle(fontSize: width * 17),
                    ),
                    Container(
                      width: width * 36,
                      height: width * 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: const Color(0xFF27273F)),
                          borderRadius: BorderRadius.circular(40),
                          color: const Color(0xFF27273F).withOpacity(0.6)),
                      child: IconButton(
                          padding: const EdgeInsets.only(right: 0, top: 1),
                          splashRadius: 18,
                          onPressed: () {
                            _toggle();
                          },
                          icon: const Icon(Icons.keyboard_arrow_up)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocProvider(
            create: (_) => _categoryBloc,
            child: BlocConsumer<CategoryBloc, CategoryState>(
              buildWhen: (previous, current) {
                return current is CategoryLoaded;
              },
              listenWhen: (previous, current) {
                return current is CategoryLoading ||
                    current is CategoryInitial ||
                    current is CategoryLoaded;
              },
              listener: (context, state) {
                if (state is CategoryError) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message!)));
                }
              },
              builder: (context, state) {
                if (state is CategoryLoaded) {
                  return Expanded(
                    flex: 11,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              splashRadius: 1,
                              iconSize: width * 52,
                              onPressed: () {
                                _toggle();
                                setState(() {
                                  _selectIndex = info[index].categoryId! != 0
                                      ? info[index].categoryId! - 2
                                      : info[index].categoryId!;
                                  _itemSelect = info[index].categoryId!;
                                });
                                select();
                              },
                              icon: CachedNetworkImage(
                                imageUrl: '${info[index].iconLink}',
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) => Image.asset(
                                    'assets/images/logo_footer.png'),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Text(info[index].categoryName!)
                          ],
                        );
                      },
                      itemCount: info.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 20,
                        crossAxisCount: 4,
                      ),
                    ),
                  );
                } else {
                  return _buildLoading();
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLoading() =>
      Center(child: Image.asset('assets/images/logo_footer.png'));

  @override
  bool get wantKeepAlive => true;
}
