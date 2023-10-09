import 'package:flutter/material.dart';
import 'package:mad_tasks_chp_9/widgets/header_widget.dart';
import 'package:mad_tasks_chp_9/widgets/row_with_card_widgets.dart';
import 'package:mad_tasks_chp_9/widgets/row_widget.dart';
import 'package:mad_tasks_chp_9/widgets/silver_list_widget.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Custom Scroll Example'),
              background: Image.network(
                'https://example.com/your-image-url.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
                childCount: 20, // Adjust the number of list items.
              ),
            ),
          ),
        ],
      ),
    );
  }
    
    
    /*Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContexttext, int index) {
          if (index == 0) {
           return HeaderWidget(key: Key('header_$index'), index: index);
          } else if (index >= 1 && index <= 3) {
          return RowWithCardWidget(key: Key('rowWithCard_$index'), index: index);
          }
          /*else if(index >= 3 && index <= 7)
          {
            return SliverListWidget(key: Key('row_$index'), index: index);
          }*/ 
          else {
          return RowWidget(key: Key('row_$index'), index: index);
          }
          },
        ),
      ),
    )*/
}