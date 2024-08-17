
import 'package:equatable/equatable.dart';
abstract class NewsEvent extends Equatable{

    const NewsEvent();
}

class LoadNews extends NewsEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ClickOnCategory extends NewsEvent{
  ClickOnCategory(this.c);
  String c;
  @override
  // TODO: implement props
  List<Object?> get props => [c];

}