import 'package:articles/app/modules/home/articles_model.dart';
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
              List<Data> articleData = ctlBuilder.allArticles.value.data!;
              return ListView.builder(
                itemCount: articleData.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.yellow[50],
                    elevation: 8.0,
                    margin: const EdgeInsets.all(4.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                                '${articleData[index].title!} - ${articleData[index].id.toString()}'),
                            Spacer(flex: 2),
                            Text(
                                '${articleData[index].content!.substring(0, 200)}...')
                          ],
                        ),
                      ),
                    ),
                  );
                  // return Text(data.data![index].title!);
                },
              );
            }

            return CircularProgressIndicator();
          }),
          bottomNavigationBar: Obx(() {
            if (controller.loaded.value) {
              print(controller.Pagination.value.length);
              return Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: kToolbarHeight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.initArticle(
                            10, controller.allArticles.value.vars!.prevPage!);
                      },
                      child: Text("Prev"),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.initArticle(10, 0);
                      },
                      child: Text("1"),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.initArticle(10, 10);
                      },
                      child: Text("2"),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.initArticle(
                            10, controller.allArticles.value.vars!.nextPage!);
                      },
                      child: Text("Next"),
                    ),
                  ],
                ),
              );
            }
            return Container();
          }),
        );
      },
    );
  }
}
