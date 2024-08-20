enum Routes {
  main('main', '/'),
  splash('splash', '/splash'),
  signUp('signUp', '/signUp'),
  login('login', '/login'),
  detail('detail', '/detail'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}