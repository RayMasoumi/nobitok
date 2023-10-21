part of 'search_cubit.dart';

@immutable
class SearchState {
  final String query;
  final List<Appointment> results;

  const SearchState({this.query = '', this.results = const []});
}

class SearchInitialState extends SearchState {}

class SearchLoading extends SearchState {}

class SearchResults extends SearchState {}

class SearchEmpty extends SearchState {}
