



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category/category_event.dart';
import 'package:news_app/bloc/category/category_state.dart';
import 'package:news_app/utils/category_list.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
    final CategoryList categoryList = CategoryList();

    CategoryBloc() : super(CategoryInitial()) {
        on<SelectCategory>((event, emit) {
            // Create a new list to avoid direct mutation
            List<bool> updatedList = List.from(categoryList.categoryBoolList);

            int index = _getCategoryIndex(event.category);
            if (index != null) {
                updatedList[index] = !updatedList[index];
                print('Updated List: $updatedList');
                categoryList.categoryBoolList = updatedList;
                emit(CategoryFinal(updatedList));
            }
        });
    }

    // Helper function to get index based on category name
    int _getCategoryIndex(String category) {
        switch (category) {
            case 'Business':
                return 0;
            case 'Entertainment':
                return 1;
            case 'Health':
                return 2;
            case 'Politics':
                return 3;


            default:
                return 4;
        }
    }
}