import 'package:flutter_bloc/flutter_bloc.dart';

import '../category.dart';
import '../http_requests.dart';
import '../http_result.dart';

part 'http_event.dart';
part 'http_state.dart';

class HttpBloc extends Bloc<HttpEvent, HttpState> {
  final http = HttpRequests();

  HttpBloc() : super(HttpInitial()) {
    on<GetCategories>((event, emit) async {
      HttpResult result = await http.getRequest();
      if (result is Result200) {
        final List data = result.response.data;
        final albums = data.map((item) {
          return Album.fromJson(item);
        }).toList();
        emit(HttpLoaded(albums: albums));
      } else {
        emit(HttpError());
      }
    });
  }
}
