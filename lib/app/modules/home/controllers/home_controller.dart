import 'package:articles/app/modules/home/articles_model.dart';
import 'package:articles/app/modules/home/factory/Api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final RxInt tabPosition = 1.obs;
  final ArticlesApi api = ArticlesApi();
  final RxList<Data> articleData = (List<Data>.of([])).obs;
  final Rx<Articles> allArticles = Articles().obs;
  final RxList<int> pagination = (List<int>.of([])).obs;
  final RxString articleTab = 'ARTICLES'.obs;
  final RxInt offset = 0.obs;
  final loaded = false.obs;
  final RxInt page = 0.obs;
  @override
  void onInit() {
    super.onInit();
    initArticle(10, 0);
  }

  void initArticle(int limit, int offset) async {
    api.getAllArticles(limit, offset).then((value) {
      // print(value.vars!.dataCount);
      for (var i = 0; i <= value.vars!.dataCount!; i++) {
        // print(i);
        if (i % 10 == 0) {
          if (!pagination.contains(i)) pagination.add(i);
        }
      }
      setArticle(value);
      setArticleData(value.data!);
      isLoaded(true);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setArticle(Articles data) {
    allArticles.value = data;
  }

  void setArticleData(List<Data> data) {
    articleData.value = data;
    isLoaded(true);
  }

  void isLoaded(bool value) {
    loaded.value = value;
  }

  void setTabPosition(int position) {
    tabPosition.value = position;
  }

  Future<void> delete(int id) async {
    var url = Uri.http(api.baseUri(), '/articles/${id}/');
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      initArticle(10, 0);
    }
  }
}
