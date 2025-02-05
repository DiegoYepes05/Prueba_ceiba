import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prueba_ceiba/features/user/user.dart';

final postUserProvider = StateNotifierProvider.autoDispose
    .family<PostsUserNotifier, PostsUserState, int>((ref, userId) {
  final userRepository = ref.watch(userRepositoryProvider);
  return PostsUserNotifier(userId: userId, userRepository: userRepository);
});

class PostsUserNotifier extends StateNotifier<PostsUserState> {
  final UserRepository userRepository;

  PostsUserNotifier({required this.userRepository, required int userId})
      : super(PostsUserState()) {
    loadPost(userId);
  }

  void loadPost(int userId) async {
    final posts = await userRepository.getPostByUser(userId);
    if (posts.isEmpty) {
      state = state.copyWith(isLoading: true);
    }
    state = state.copyWith(isLoading: false, posts: [...state.posts, ...posts]);
  }
}

class PostsUserState {
  final List<Post> posts;
  final bool isLoading;

  PostsUserState({this.posts = const [], this.isLoading = true});

  PostsUserState copyWith({List<Post>? posts, bool? isLoading}) =>
      PostsUserState(
          posts: posts ?? this.posts, isLoading: isLoading ?? this.isLoading);
}
