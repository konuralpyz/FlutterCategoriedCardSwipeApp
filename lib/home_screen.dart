import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0FE1C9), Color(0xDB9B0CEE)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: ElevatedButton(
            child: Text('   START   ', style: TextStyle(
              color: Colors.black,
              fontSize: 50,
            ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(1),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryScreen()),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryScreen extends StatefulWidget {
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final List<String> categories = [
    'Category1',
    'Category2',
    'Category3',
    'Category4',
    'Category5',
    'Category6',
    'Category7',
    'Category8'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategoriler'),
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
        ),
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return CategoryCard(
            categoryName: categories[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestionScreen(
                    categoryName: categories[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final VoidCallback onTap;

  const CategoryCard({
    Key key,
    this.categoryName,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          height: 100.0,
          child: Center(
            child: Text(
              categoryName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




class QuestionScreen extends StatefulWidget {
  final String categoryName;

  const QuestionScreen({
    Key key,
     this.categoryName,
  }) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  List<String> questions = [    'Söylenmedi Hiç',    'Sana Layık Düşler',    'Benden Önce',    'Tutsak Yüreğim',
    'Biliyorsun Sen De İnce İnce',    'Yangın Yeri Hep', 'Buralar Sayende','Yok Şikayet', 'GEL Bİ SARAYIIIIMMM', 'AŞKIN OLAYIIIIIIIIIMMMMMMMMM'  ];

  @override
  Widget build(BuildContext context) {
    CardController controller = CardController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Center(
        child: TinderSwapCard(
          swipeUp: true,
          swipeDown: true,
          orientation: AmassOrientation.TOP,
          totalNum: questions.length,
          stackNum: 3,
          swipeEdge: 5.0,
          maxWidth: MediaQuery.of(context).size.width * 0.9,
          maxHeight: MediaQuery.of(context).size.width * 1.2,
          minWidth: MediaQuery.of(context).size.width * 0.8,
          minHeight: MediaQuery.of(context).size.width * 0.8,
          cardBuilder: (context, index) => Card( color: Colors.blueAccent,
            child: Center(
              child: Text(
                questions[index],
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          cardController: controller,
          swipeUpdateCallback: (DragUpdateDetails details, Alignment align) {},
          swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {},
        ),
      ),
    );
  }
}