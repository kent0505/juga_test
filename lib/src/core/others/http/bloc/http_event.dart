part of 'http_bloc.dart';

abstract class HttpEvent {}

class GetCategories extends HttpEvent {}

class AddCategory extends HttpEvent {}

class EditCategory extends HttpEvent {}

class DeleteCategory extends HttpEvent {}
