import 'package:flutter/material.dart';

void main() {runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Отзывы пользователей',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Оставь и ты свой отзыв',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          FavoriteWidget(),
        ],
      ),
    );
    Widget titleSections = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    'Нравится',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.favorite_outlined,
            color: Colors.red[500],
          ),
          Text('50'),
        ],
      ),
    );
    Widget titleSectiona = Container(
      padding: const EdgeInsets.all(32),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'Звонок'),
          _buildButtonColumn(color, Icons.near_me, 'Поиск'),
          _buildButtonColumn(color, Icons.share, 'Поделиться'),
        ],
      ),
    );
    Widget buttonSections = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.play_for_work_outlined, 'Скачать'),
          _buildButtonColumn(color, Icons.refresh , 'Обновить'),
          _buildButtonColumn(color, Icons.image_search, 'Увеличить'),
          _buildButtonColumn(color, Icons.backup , 'На облако'),
          _buildButtonColumn(color, Icons.laptop, ' Компьютер'),
        ],
      ),
    );
    Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
      'Фла́ттер (англиц. от flutter «дрожание, вибрация») — сочетание самовозбуждающихся'
      'незатухающих изгибающих и крутящих автоколебаний элементов конструкции летательного'
      'аппарата: главным образом, крыла самолёта либо несущего винта вертолёта.'
      'Как правило, флаттер проявляется при достижении некоторой критической скорости,'
      'зависящей от характеристик конструкции летательного аппарата; возникающий резонанс'
      'может привести к его разрушению. Переход к сверхзвуковым скоростям осложнялся опасностями флаттера.',
        softWrap: true,
      ),
    );
    Widget textSections = Container(
      padding: const EdgeInsets.all(32),
      child: Text(
      'Исследования флаттера в CCCР начались в середине 1930-х годов.'
      'Советская авиация столкнулась с тем, что при увеличении скорости,'
      'при некотором критическом её значении, самолёты начинало сильно трясти'
      'и они разрушались в воздухе. Вибрация нарастала настолько быстро, что у'
      'лётчика не оставалось времени на снижение скорости.'
      'От начала вибраций до разрушения самолёта проходили считанные секунды.',
        softWrap: true,
      ),
    );
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter'),
        ),
        body: ListView(
          children:[
            textSection,
            buttonSections,
            titleSectiona,
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,),
            titleSection,
            buttonSection,
            titleSections,
            Image.asset(
              'images/lak.jpg',
              width: 300,
              height: 270,
              fit: BoxFit.cover,),
            textSections,
          ],
        ),
      ),
    );
  }
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
// #docregion FavoriteWidget
class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}
// #enddocregion FavoriteWidget

// #docregion _FavoriteWidgetState, _FavoriteWidgetState-fields, _FavoriteWidgetState-build
class _FavoriteWidgetState extends State<FavoriteWidget> {
  // #enddocregion _FavoriteWidgetState-build
  bool _isFavorited = true;
  int _favoriteCount = 10;
  // #enddocregion _FavoriteWidgetState-fields

  // #docregion _toggleFavorite
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
  // #enddocregion _toggleFavorite

  // #docregion _FavoriteWidgetState-build
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            padding: EdgeInsets.all(0),
            alignment: Alignment.centerRight,
            icon: (_isFavorited ? Icon(Icons.thumb_up_alt_rounded) : Icon(Icons.thumb_up_outlined)),
            color: Colors.green[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }
// #docregion _FavoriteWidgetState-fields
}