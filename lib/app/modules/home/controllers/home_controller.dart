import 'package:articles/app/modules/home/articles_model.dart';
import 'package:articles/app/modules/home/factory/Api.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final ArticlesApi api = ArticlesApi();
  final RxList<Data> ArticleData = (List<Data>.of([])).obs;
  late Future<Articles> allArticles;
  @override
  void onInit() {
    super.onInit();
    initArticle(10, 0);
  }

  initArticle(int limit, int offset) async {
    allArticles = api.getAllArticles(limit, offset);
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
}
