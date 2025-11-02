function fn() {
  var config = {
    baseUrl: 'https://petstore.swagger.io/v2',
    headers: { 'Content-Type': 'application/json' }
  };
  karate.configure('ssl', true);
  karate.configure('headers', config.headers);
  return config;
}
