import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:duaya_app/features/search/data/model/SearchModel.dart';
import 'package:duaya_app/features/search/data/repositories/searchRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  late SearchModel searchModel;
  List<Data> products = [];
  int page = 1;
  bool isSearchData = false;
  bool isScrollAtBottom = false;
  bool active = false;
  Timer? _debounceTimer;
  ScrollController scrollController = ScrollController();
  searchRepoImp repo = searchRepoImp();
  Future<void> fetchSearchData(
      {required String name, int? page, String? companyID}) async {
    emit(SearchInitial());
    if (page == null) {
      final json = await repo.getSearchData(name: name, companyID: companyID);
      searchModel = SearchModel.fromJson(json);
      searchModel.data!.forEach((element) {
        products.add(element);
      });
    } else {
      final json = await repo.getSearchData(
          name: name, page: page, companyID: companyID);
      searchModel = SearchModel.fromJson(json);
      searchModel.data!.forEach((element) {
        products.add(element);
      });
    }
    print(
        " //////////////////  search data fetched well      ///////////////////");
    isSearchData = true;
    emit(SearchSuccess());
  }

  Future clearProducts() async {
    emit(SearchDeleteLoading());
    products.clear();
    products = [];
    page = 1;
    emit(SearchDeleteSuccess());
  }

  Future<void> turnOff() async {
    emit(SearchTurnOffLoading());
    isSearchData = false;
    await clearProducts();
    emit(SearchTurnOffSuccess());
  }

  void turnOn() {
    emit(SearchTurnOnLoading());
    isSearchData = true;
    emit(SearchTurnOnSuccess());
  }

  Future<void> scrollListener({required String name, String? companyID}) async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (_debounceTimer != null && _debounceTimer!.isActive) {
        // If timer is active, cancel it to reset
        _debounceTimer!.cancel();
      }

      // Start a new timer with a delay
      _debounceTimer = Timer(Duration(milliseconds: 250), () async {
        // This function will execute after the delay if the user has stopped scrolling
        isScrollAtBottom = true;
        page++;
        await fetchSearchData(name: name, page: page, companyID: companyID);
        print("New productsData fetched (Page: $page)");
        emit(SearchLoading());
      });
    }
  }
}
