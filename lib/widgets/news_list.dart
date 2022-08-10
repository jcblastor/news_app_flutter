import 'package:app_news/models/news_models.dart';
import 'package:app_news/theme/theme_dark.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<Article> news;

  const NewsList({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: news.length,
      itemBuilder: (BuildContext context, int i) {
        return _News(news: news[i], index: i);
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News({
    required this.news,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopBarCard(news, index),
        _TitleCard(news),
        _ImageCard(news),
        _BodyCard(news),
        _ButtonsCard(),
        const SizedBox(height: 10),
        const Divider(),
      ],
    );
  }
}

class _ButtonsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.colorScheme.secondary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.star_border),
        ),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: const Icon(Icons.more),
        )
      ],
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article news;

  const _BodyCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text((news.description ?? '')),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article news;

  const _ImageCard(this.news);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Container(
        child: news.urlToImage != null
            ? FadeInImage(
                placeholder: const AssetImage('assets/giphy.gif'),
                image: NetworkImage(news.urlToImage!),
              )
            : const Image(
                image: AssetImage('assets/no-image.png'),
              ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article news;

  const _TitleCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Text(
        news.title.toString(),
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;

  const _TopBarCard(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Text('${index + 1}. ', style: TextStyle(color: myTheme.colorScheme.secondary)),
          Text('${news.source.name}'),
        ],
      ),
    );
  }
}
