import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:dart_rss/dart_rss.dart';
import 'package:http/http.dart' as http;

part 'news24_state.dart';

const _top7URL = 'https://lenta.ru/rss/last24';

class News24Cubit extends Cubit<News24State> {
  News24Cubit() : super(News24Initial());


  Future<void> loadNews() async{
    try{
      await Future.delayed(const Duration(seconds: 2));
      final response = await http.Client().get(Uri.parse(_top7URL));
      final rssFeed = RssFeed.parse(response.body);
      emit(News24LoadedState(rssFeed.items));
    }catch (e){
      emit(News24ErrorState('Упссс!'));
    }
  }

  Future<void> reloadNews() async{
    emit(News24Initial());
  }
  
}