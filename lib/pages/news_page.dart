import 'package:codigo6_alertas/models/news_model.dart';
import 'package:codigo6_alertas/services/api_service.dart';
import 'package:codigo6_alertas/widgets/general_widget.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Noticias",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                FutureBuilder(
                  future: apiService.getNews(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<NewsModel> news = snap.data;
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: news.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Image.network(news[index].imagen),
                            ],
                          );
                        },
                      );
                    }
                    return loadingWidget;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
