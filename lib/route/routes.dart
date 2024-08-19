enum Routes {
  main('main', '/'),
  detail('detail', '/detail'),
  splash('splash', '/splash'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}