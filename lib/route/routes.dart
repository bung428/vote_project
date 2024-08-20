enum Routes {
  splash('splash', '/splash'),
  signUp('signUp', '/signUp'),
  login('login', '/login'),
  main('main', '/'),
  detail('detail', '/detail'),
  comment('comment', '/comment'),
  addVote('addVote', '/addVote'),
  ;

  final String path;
  final String name;

  const Routes(this.path, this.name);
}