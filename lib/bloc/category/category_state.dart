


import 'package:equatable/equatable.dart';

class CategoryState extends Equatable{
  const CategoryState();

  @override
  // TODO: implement props
  List<Object?> get props => [];


}

class CategoryInitial extends CategoryState{


  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoryFinal extends CategoryState{
  CategoryFinal(this.fcat);
  List<dynamic> fcat;
  @override
  // TODO: implement props
  List<Object?> get props => [fcat];
}

class CategorySelected extends CategoryState{

  @override
  // TODO: implement props
  List<Object?> get props => [];
}




