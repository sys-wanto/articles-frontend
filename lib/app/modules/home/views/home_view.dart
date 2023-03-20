import 'package:articles/app/modules/home/articles_model.dart';
import 'package:articles/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      dispose: (state) => state.dispose(),
      builder: (ctlBuilder) {
        // ctlBuilder.initArticle(10, 10);
        return Scaffold(
          appBar: AppBar(title: const Text('Article')),
          body: Obx(() {
            if (ctlBuilder.loaded.value) {
              List<Data> articleData =
                  ctlBuilder.allArticles.value.data ?? <Data>[];
              return Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.initArticle(
                                    10, controller.offset.value);
                                controller.articleTab.value = 'ARTICLES';
                              },
                              icon: Icon(Icons.article),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.initArticle(
                                    10, controller.offset.value);
                                controller.articleTab.value = 'PUBLISH';
                              },
                              icon: Icon(Icons.public),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.initArticle(
                                    10, controller.offset.value);
                                controller.articleTab.value = 'DRAFT';
                              },
                              icon: Icon(Icons.drafts_rounded),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.initArticle(
                                    10, controller.offset.value);
                                controller.articleTab.value = 'THRASH';
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 10,
                    child: ListView.builder(
                      itemCount: articleData.length,
                      itemBuilder: (context, index) {
                        if (controller.articleTab.value == 'ARTICLES') {
                          int? contentLength =
                              articleData[index].content?.length ?? 0;
                          String cardTitle = articleData[index].title ?? '';
                          String cardContent =
                              '${articleData[index].content!.substring(0, contentLength >= 150 ? 150 : contentLength)}...';
                          return Card(
                            clipBehavior: Clip.hardEdge,
                            color: Colors.yellow[50],
                            elevation: 8.0,
                            margin: const EdgeInsets.all(4.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: Text(
                                      cardTitle,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                    SizedBox(
                                      height: 100,
                                      width: double.infinity,
                                      child: Text(cardContent),
                                    ),
                                    Row(
                                      children: [
                                        Icon(icons(articleData[index].status!)),
                                        TextButton(
                                          onPressed: () {
                                            Get.toNamed(Routes.EDIT,
                                                arguments:
                                                    articleData[index].id);
                                          },
                                          child: Text('Edit'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller
                                                .delete(articleData[index].id!);
                                          },
                                          child: Text('Delete'),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          if (articleData[index].status ==
                              controller.articleTab.value) {
                            int? contentLength =
                                articleData[index].content?.length ?? 0;
                            String cardTitle = articleData[index].title ?? '';
                            String cardContent =
                                '${articleData[index].content!.substring(0, contentLength >= 150 ? 150 : contentLength)}...';
                            return Card(
                              clipBehavior: Clip.hardEdge,
                              color: Colors.yellow[50],
                              elevation: 8.0,
                              margin: const EdgeInsets.all(4.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Center(
                                          child: Text(
                                        cardTitle,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                      SizedBox(
                                        height: 100,
                                        width: double.infinity,
                                        child: Text(cardContent),
                                      ),
                                      Row(
                                        children: [
                                          Icon(icons(
                                              articleData[index].status!)),
                                          TextButton(
                                            onPressed: () {
                                              Get.toNamed(Routes.EDIT,
                                                  arguments:
                                                      articleData[index].id);
                                            },
                                            child: Text('Edit'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller.delete(
                                                  articleData[index].id!);
                                            },
                                            child: Text('Delete'),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                        }
                      },
                    ),
                  ),
                ],
              );
            }

            return CircularProgressIndicator();
          }),
          bottomNavigationBar: Obx(() {
            if (controller.loaded.value) {
              return Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: kToolbarHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: controller.pagination.map((element) {
                    int key = controller.pagination
                            .indexWhere((item) => item == element) +
                        1;
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: key == controller.tabPosition.value
                                ? Colors.blue
                                : Colors.white,
                            textStyle: TextStyle(color: Colors.black)),
                        onPressed: () {
                          controller.offset.value = element;
                          controller.setTabPosition(key);
                          controller.initArticle(10, element);
                        },
                        child: Text(
                          key.toString(),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }
            return Container();
          }),
        );
      },
    );
  }

  IconData icons(String status) {
    if (status == 'PUBLISH') {
      return Icons.public;
    } else if (status == 'DRAFT') {
      return Icons.drafts_rounded;
    } else if (status == 'THRASH') {
      return Icons.delete;
    } else {
      return Icons.article;
    }
  }
}
