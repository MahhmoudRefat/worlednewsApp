import 'package:flutter/material.dart';
import '../helpers/date_updater.dart';
import '../widgets/categorylistview.dart';
import '../widgets/news_listview_builder.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String formattedDate;
  final DateUpdater dateUpdater = DateUpdater();

  // GlobalKey to access the NewsListViewBuilder's state
  final GlobalKey<NewsListViewBuilderState> newsListViewKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    dateUpdater.updateDate((date) {
      setState(() {
        formattedDate = date;
      });
    });
    dateUpdater.scheduleMidnightUpdate((date) {
      setState(() {
        formattedDate = date;
      });
    });
  }

  @override
  void dispose() {
    dateUpdater.dispose(); // Cancel the timer
    super.dispose();
  }

// Future<void> getGeneralNews() async {
  @override
  Widget build(BuildContext context) {
    // Get the current date
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset("assets/world_icon.png", fit: BoxFit.contain),
          ),
          title: const Text(
            "World News ",
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          //centerTitle: true,
        ),

        /******************* The body *******/
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  formattedDate, // Display current date
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
              ),
            ),

            /********* Category  List *****************/

            const SliverToBoxAdapter(child: CategoryListView()),
            /******* Spaces between them **************/
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 5,
              ),
            ),
            /********* News List *****************/
            SliverToBoxAdapter(
              child: MaterialButton(
                onPressed: () {
                  print("Refresh button clicked");
                  newsListViewKey.currentState?.refreshNews();
                },
                color: Colors.green, // Button background color
                textColor: Colors.white,
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  // Makes sure the row takes the least space needed
                  children: [
                    Text("What's New"),
                    SizedBox(width: 8),
                    // Adds some space between the text and the icon
                    Icon(Icons.refresh),
                    // Refresh icon
                  ],
                ), // Text color
              ),
            ),
            NewsListViewBuilder(
              key: newsListViewKey,
              category: "general",
            ),
          ],
        ));
  }
}

// Column(
//   children: [
//     SizedBox(
//       height: 200,
//       child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//           itemCount: categoryModelData.length,
//           itemBuilder: (context, index) {
//             return CategoryContainer(categoryModelData: categoryModelData[index]);
//           }),
//     ),
//     Expanded(
//       child: ListView.builder(
//         physics: BouncingScrollPhysics(),
//           itemCount: newsModelData.length,
//           itemBuilder: (context, index) {
//             return NewsContainer(newsModelData: newsModelData[index]);
//           }),
//     ),
//   ],
// ),
