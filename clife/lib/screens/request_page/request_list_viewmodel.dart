import 'package:clife/app/app_repo.dart';
import 'package:clife/app/locator.dart';
import 'package:clife/model/post_data.dart';
import 'package:clife/services/api_services.dart';
import 'package:clife/util/utility.dart';
import 'package:flutter/foundation.dart';

class RequestListViewModel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  List<PostData> _postList = [];
  bool _loading = false;
  bool hasError = false;
  bool _loadMore = false;
  bool _hasNext = false;
  int currentPage = 1;

  AppRepo _repo;

  intiData(AppRepo repo) {
    _repo = repo;
    fetchPostList(loading: true);
  }

  bool get loadMore => _loadMore;
  bool get hasNext => _hasNext;
  bool get loading => _loading;

  void setPostList(List<PostData> list) {
    _postList = list;
    notifyListeners();
  }

  List<PostData> get postList => _postList;

  fetchPostList({bool loading = false}) async {
    if (loading) {
      currentPage = 1;
      _loading = true;
      hasError = false;
    } else {
      _loadMore = true;
    }
    try {
     // loading = true;
    //  hasError = false;
      notifyListeners();
      final response = await _apiService.fetchPostList(currentPage);
      _postList = response.data;
      if (response.nextPageUrl != null) {
        _hasNext = true;
        currentPage++;
      } else {
        _hasNext = false;
      }
      _loading = false;
       hasError = false;
       _loadMore = false;
      notifyListeners();
    } catch (e) {
      myPrint(e.toString());
      _loading = false;
       _loadMore = false;
      hasError = true;
      notifyListeners();
    }
  }
}
