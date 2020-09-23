import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

// repositories
import 'package:workplace_clone/models/repositories/group_repository.dart';
import 'package:workplace_clone/models/repositories/post_repository.dart';
import 'package:workplace_clone/models/repositories/user_repository.dart';

// view models
import 'package:workplace_clone/view_models/feed_view_model.dart';
import 'package:workplace_clone/view_models/group_view_model.dart';
import 'package:workplace_clone/view_models/post_view_model.dart';
import 'package:workplace_clone/view_models/welcome_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) => DatabaseManager(),
  ),
];

List<SingleChildWidget> dependentModels = [
  ChangeNotifierProvider<UserRepository>(
    create: (context) => UserRepository(
      auth: FirebaseAuth.instance,
      dbManager: context.read<DatabaseManager>(),
    ),
  ),
  ProxyProvider<DatabaseManager, GroupRepository>(
    update: (_, dbManager, repository) => GroupRepository(dbManager: dbManager),
  ),
  ProxyProvider<DatabaseManager, PostRepository>(
    update: (_, dbManager, repository) => PostRepository(dbManager: dbManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProxyProvider2<UserRepository, GroupRepository,
      WelcomeViewModel>(
    create: (context) => WelcomeViewModel(
      userRepository: context.read<UserRepository>(),
      groupRepository: context.read<GroupRepository>(),
    ),
    update: (_, userRepository, groupRepository, viewModel) =>
        viewModel..onUserRepositoryUpdated(userRepository),
  ),
  ChangeNotifierProxyProvider3<UserRepository, GroupRepository, PostRepository,
      FeedViewModel>(
    create: (context) => FeedViewModel(
      userRepository: context.read<UserRepository>(),
      groupRepository: context.read<GroupRepository>(),
      postRepository: context.read<PostRepository>(),
    ),
    update: (_, userRepository, groupRepository, postRepository, viewModel) =>
        viewModel..onUserRepositoryUpdated(userRepository),
  ),
  ChangeNotifierProxyProvider2<UserRepository, GroupRepository, GroupViewModel>(
    create: (context) => GroupViewModel(
      userRepository: context.read<UserRepository>(),
      groupRepository: context.read<GroupRepository>(),
    ),
    update: (_, userRepository, groupRepository, viewModel) =>
        viewModel..onUserRepositoryUpdated(userRepository),
  ),
  ChangeNotifierProxyProvider3<UserRepository, GroupRepository, PostRepository,
      PostViewModel>(
    create: (context) => PostViewModel(
      userRepository: context.read<UserRepository>(),
      groupRepository: context.read<GroupRepository>(),
      postRepository: context.read<PostRepository>(),
    ),
    update: (_, userRepository, groupRepository, postRepository, viewModel) =>
        viewModel..onUserRepositoryUpdated(userRepository),
  ),
];
