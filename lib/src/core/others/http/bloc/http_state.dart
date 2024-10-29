part of 'http_bloc.dart';

abstract class HttpState {}

class HttpInitial extends HttpState {}

class HttpLoading extends HttpState {}

class HttpLoaded extends HttpState {
  final List<Album> albums;
  HttpLoaded({required this.albums});
}

class HttpError extends HttpState {}
