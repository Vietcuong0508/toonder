import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:toonder_app/bloc/hot/hot_bloc.dart';
import 'package:toonder_app/model/hot_model.dart';

class HotTopic extends StatefulWidget {
  const HotTopic({super.key});

  @override
  State<HotTopic> createState() => _HotTopicState();
}

class _HotTopicState extends State<HotTopic> {
  final HotBloc _hotBloc = HotBloc();
  List<Info> info = [];

  bool _showBackToTopButton = false;

  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          if (_scrollController.offset >= 400) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
    _hotBloc.add(GetHotList());
    super.initState();
  }

  void fresh() {
    _hotBloc.add(GetHotList());
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 375;
    return BlocProvider(
      create: (_) => _hotBloc,
      child: BlocConsumer<HotBloc, HotState>(
        listenWhen: (previous, current) {
          return current is HotInitial ||
              current is HotLoading ||
              current is HotLoaded;
        },
        listener: (context, state) {
          if (state is HotError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message!)));
          }
          if (state is HotLoaded) {
            Hot hot = state.hot;
            info = hot.info!;
          }
        },
        buildWhen: (previous, current) {
          return current is HotInitial ||
              current is HotLoading ||
              current is HotLoaded;
        },
        builder: (context, state) {
          if (state is HotLoaded) {
            return Padding(
              padding: EdgeInsets.all(width * 15),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  StaggeredGridView.countBuilder(
                      controller: _scrollController,
                      staggeredTileBuilder: (index) =>
                          const StaggeredTile.fit(1),
                      crossAxisCount: 2,
                      mainAxisSpacing: width * 16,
                      crossAxisSpacing: width * 8,
                      itemCount: info.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(width * 10),
                                  child: CachedNetworkImage(
                                    imageUrl: info[index].links![0],
                                    placeholder: (context, url) => Image.asset(
                                        'assets/images/logo_footer.png'),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                info[index].links!.length.toString() == '1'
                                    ? const SizedBox()
                                    : Padding(
                                        padding: EdgeInsets.all(width * 4),
                                        child: Container(
                                          width: width * 55,
                                          height: width * 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      width * 5),
                                              color: Colors.black
                                                  .withOpacity(0.2)),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Icon(Icons.copy_all_sharp),
                                              Text(info[index]
                                                  .links!
                                                  .length
                                                  .toString())
                                            ],
                                          ),
                                        ),
                                      )
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: width * 5),
                              child: Row(
                                children: [
                                  info[index].avatar! == ""
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.asset(
                                            "assets/images/duck.png",
                                            height: width * 25,
                                            width: width * 25.0,
                                          ))
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Image.network(
                                            info[index].avatar!,
                                            height: width * 25,
                                            width: width * 25.0,
                                          ),
                                        ),
                                  Padding(
                                    padding: EdgeInsets.only(left: width * 8),
                                    child: Text(info[index].createNickName!),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: width * 175,
                                child: Text(
                                  info[index].caption!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: width * 12),
                                ))
                          ],
                        );
                      }),
                  _showBackToTopButton == false
                      ? const SizedBox()
                      : FloatingActionButton(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          onPressed: _scrollToTop,
                          child: Column(
                            children: [
                              const Icon(
                                Icons.arrow_circle_up_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                'Lên đầu',
                                style: TextStyle(
                                    fontSize: width * 10, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                ],
              ),
            );
          } else {
            return _buildLoading();
          }
        },
      ),
    );
  }

  Widget _buildLoading() =>
      Center(child: Image.asset('assets/images/logo_footer.png'));
}
