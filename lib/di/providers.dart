import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// db
import 'package:workplace_clone/models/db/database_manager.dart';

// repositories
import 'package:workplace_clone/models/repositories/user_repository.dart';

// view models
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
  ProxyProvider<DatabaseManager, UserRepository>(
    update: (_, dbManager, repository) => UserRepository(dbManager: dbManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<WelcomeViewModel>(
    create: (context) => WelcomeViewModel(
      userRepository: context.read<UserRepository>(),
    ),
  )
];
