



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/category/category_event.dart';
import 'package:news_app/bloc/category/category_state.dart';
import 'package:news_app/utils/category_list.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState>{
    CategoryList categoryList=CategoryList();
    CategoryBloc():super(CategoryInitial()){

        on<SelectCategory>((event,emit){
            emit(CategoryInitial());

            List<dynamic> f=categoryList.categoryBoolList;
            if(event.category=='Business'){
                print('Select Category Called');
                print(f[0]);
                if(f[0]==true){
                    f[0]=false;
                    print('Health: '+f[0].toString());
                }
                else{
                    f[0]=true;
                    print(f[0]);
                }

            }
            else if(event.category=='Entertainment'){
                if(f[1]==true){
                    f[1]=false;
                    print(f[1]);
                }
                else{
                    f[1]=true;
                    print(f[1]);
                }
            }
            else if(event.category=='Health'){
                if(f[2]==true){
                    f[2]=false;
                    print('Enter: '+f[2].toString());
                }
                else{
                    f[2]=true;
                    print(f[2]);
                }
            }
            else{
                if(f[3]==true){
                    f[3]=false;
                    print('Health: '+f[3].toString());
                }
                else{
                    f[3]=true;
                    print(f[3]);
                }
            }
            emit(CategoryFinal(f));
            categoryList.categoryBoolList=f;
        });

    }
}