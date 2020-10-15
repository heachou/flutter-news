const SERVER_API_URL = bool.fromEnvironment("dart.vm.product")
    ? "http://192.168.10.25:3100/mock/11"
    : 'http://10.0.2.2:3100/mock/11';
