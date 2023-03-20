import 'package:articles/app/modules/home/articles_model.dart';
import 'package:articles/app/modules/home/factory/Api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final ArticlesApi api = ArticlesApi();
  final RxList<Data> ArticleData = (List<Data>.of([])).obs;
  final Rx<Articles> allArticles = Articles().obs;
  final RxList<int> Pagination = (List<int>.of([])).obs;
  final loaded = false.obs;
  @override
  void onInit() {
    super.onInit();
    initArticle(10, 0);
  }

  void initArticle(int limit, int offset) async {
    api.getAllArticles(limit, offset).then((value) {
      for (var i = 0; i <= value.vars!.dataCount!; i + 10) {
        if (i % 10 == 0) allArticles.value = value;
      }
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

  void increment() => count.value++;

  void setArticleData(List<Data> data) {
    ArticleData.value = data;
    isLoaded(true);
  }

  void isLoaded(bool value) {
    loaded.value = value;
  }
}
