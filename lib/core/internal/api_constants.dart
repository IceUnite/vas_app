const bool isDevServer = bool.fromEnvironment('isDev');
const bool isProdServer = !isDevServer;

const String localGatewayServerUrl = 'http://192.168.31.100:8000/';
const String netGatewayServerUrl = 'https://messenger-v-dooctor.amvera.io/';

// const String testGWGatewayServerUrl = 'https://gw.test.apeironspace.ru/';
//
// const String stageGWGatewayServerUrl = 'https://gw.stage.apeironspace.ru/';
//
// const String prodGWGatewayServerUrl = 'https://gw.apeironspace.online/';

// enum ServerType {
//   // ежедневные билды
//   dev,
//   // то на чем проводим тестирование и демонстрации
//   test,
//   // зеркало от прода
//   stage,
//   // прод (в сторах)
//   prod,
// }

abstract class ErrorServerCode {
  static const inValidPasswordCode = 1000400;
  static const timeOOutConnectionCode = 1000402;
  static const userBlockedCode = 1000403;
}

// extension ServerTypeExtension on ServerType {
//   String get toDiningString => mobileGatewayServerUrl;
//
//   static ServerType fromMobileGatewayServerUrl(String url) {
//     switch (url) {
//       case devGWGatewayServerUrl:
//         return ServerType.dev;
//       case testGWGatewayServerUrl:
//         return ServerType.test;
//       case stageGWGatewayServerUrl:
//         return ServerType.stage;
//       case prodGWGatewayServerUrl:
//       default:
//         return ServerType.prod;
//     }
//   }
//
//   String get mobileGatewayServerUrl {
//     switch (this) {
//       case ServerType.dev:
//         return devGWGatewayServerUrl;
//       case ServerType.test:
//         return testGWGatewayServerUrl;
//       case ServerType.stage:
//         return stageGWGatewayServerUrl;
//       case ServerType.prod:
//       default:
//         return prodGWGatewayServerUrl;
//     }
//   }
//
//   bool get isDebugServer {
//     switch (this) {
//       case ServerType.dev:
//       case ServerType.test:
//         return true;
//       case ServerType.stage:
//       case ServerType.prod:
//       default:
//         return false;
//     }
//   }
// }
