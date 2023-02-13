import 'helpers/helpers.dart';
import 'ip_validator.dart';

class BasicUrlValidator {
  const BasicUrlValidator._();

  static bool isFullDomainName(
    String str, {
    bool requireTld = true,
    bool allowUnderscores = false,
  }) {
    var parts = str.split('.');
    if (requireTld) {
      var tld = parts.removeLast();
      if (parts.isEmpty || !RegExp(r'^[a-z]{2,}$').hasMatch(tld)) {
        return false;
      }
    }

    for (var part in parts) {
      if (allowUnderscores) {
        if (part.contains('__')) {
          return false;
        }
      }
      if (!RegExp(r'^[a-z\\u00a1-\\uffff\d-]+$').hasMatch(part)) {
        return false;
      }
      if (part[0] == '-' || part[part.length - 1] == '-' || part.contains('---')) {
        return false;
      }
    }
    return true;
  }

  static bool isURL(String? str,
      {List<String?> protocols = const ['http', 'https', 'ftp'],
      bool requireTld = true,
      bool requireProtocol = false,
      bool allowUnderscore = false,
      List<String> hostWhitelist = const [],
      List<String> hostBlacklist = const []}) {
    if (str == null || str.isEmpty || str.length > 2083 || str.startsWith('mailto:')) {
      return false;
    }
    int port;
    String? protocol, auth, user;
    String host, hostname, portStr, path, query, hash;

    // check protocol
    var split = str.split('://');
    if (split.length > 1) {
      protocol = shift(split);
      if (!protocols.contains(protocol)) {
        return false;
      }
    } else if (requireProtocol == true) {
      return false;
    }
    str = split.join('://');

    // check hash
    split = str.split('#');
    str = shift(split);
    hash = split.join('#');
    if (hash.isNotEmpty && RegExp(r'\s').hasMatch(hash)) {
      return false;
    }

    // check query params
    split = str!.split('?');
    str = shift(split);
    query = split.join('?');
    if (query.isNotEmpty && RegExp(r'\s').hasMatch(query)) {
      return false;
    }

    // check path
    split = str!.split('/');
    str = shift(split);
    path = split.join('/');
    if (path.isNotEmpty && RegExp(r'\s').hasMatch(path)) {
      return false;
    }

    // check auth type urls
    split = str!.split('@');
    if (split.length > 1) {
      auth = shift(split);
      if (auth?.contains(':') ?? false) {
        user = shift(auth!.split(':'))!;
        if (!RegExp(r'^\S+$').hasMatch(user)) {
          return false;
        }
        if (!RegExp(r'^\S*$').hasMatch(user)) {
          return false;
        }
      }
    }

    // check hostname
    hostname = split.join('@');
    split = hostname.split(':');
    host = shift(split)!;
    if (split.isNotEmpty) {
      portStr = split.join(':');
      try {
        port = int.parse(portStr, radix: 10);
      } catch (e) {
        return false;
      }
      if (!RegExp(r'^\d+$').hasMatch(portStr) || port <= 0 || port > 65535) {
        return false;
      }
    }

    if (!BasicIPValidator.isIP(host, null) &&
        !isFullDomainName(host, requireTld: requireTld, allowUnderscores: allowUnderscore) &&
        host != 'localhost') {
      return false;
    }

    if (hostWhitelist.isNotEmpty && !hostWhitelist.contains(host)) {
      return false;
    }

    if (hostBlacklist.isNotEmpty && hostBlacklist.contains(host)) {
      return false;
    }

    return true;
  }
}
