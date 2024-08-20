import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bookmark/bookmark_bloc.dart';
import '../bloc/bookmark/bookmark_state.dart';

class SavedNews extends StatefulWidget {
  const SavedNews({super.key});

  @override
  State<SavedNews> createState() => _SavedNewsState();
}

class _SavedNewsState extends State<SavedNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved News', style: Theme
            .of(context)
            .textTheme
            .headlineLarge),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
          child: BlocBuilder<BookmarkBloc, BookmarkState>(
            builder: (context, state) {
              if(state is FinalBookmarkState){
                return ListView.builder(
                    itemCount:state.bookmarkList.length,
                    itemBuilder: (context, index) {
                        return state.bookmarkList[index];
                    }
                );
              }
              else{
                return Container(child:Text('Empty'));
              }
            },
          ),
        ),
      ],),
    );
  }
}
