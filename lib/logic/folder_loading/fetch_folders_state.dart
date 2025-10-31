abstract class FetchFoldersState {}

class FetchFoldersInitial extends FetchFoldersState {}

class FetchFoldersLoading extends FetchFoldersState {}

class FetchFoldersLoaded extends FetchFoldersState {
  final String currentFolder;
  final List<String> folders;

  FetchFoldersLoaded({required this.folders, required this.currentFolder});
}

class FetchFoldersError extends FetchFoldersState {
  final String error;

  FetchFoldersError(this.error);
}
