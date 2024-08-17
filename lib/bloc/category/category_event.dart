


import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SelectCategory extends CategoryEvent{
  SelectCategory(this.category);
  String category;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}


class DeselectCategory extends CategoryEvent{
  DeselectCategory(this.category);
  String category;
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

