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
          body: FutureBuilder(
              future: ctlBuilder.allArticles,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Articles data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.yellow[50],
                        elevation: 8.0,
                        margin: EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Center(child: Text(data.data![index].title!)),
                              Text(
                                  '${data.data![index].content!.substring(0, 200)}...')
                            ],
                          ),
                        ),
                      );
                      // return Text(data.data![index].title!);
                    },
                  );
                }
                return const CircularProgressIndicator();
              }),
        );
      },
    );
  }
}
