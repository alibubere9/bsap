class StringFunctions {
  static String abbrievate(String name) {
    List<String> abbrievateList = name.trim().split(' ');
    return ((abbrievateList.length > 1)
            ? abbrievateList[0].substring(0, 1) +
                abbrievateList[1].substring(0, 1)
            : abbrievateList[0].substring(0, 1))
        .toUpperCase();
  }

  static String toPascalCaseForPattern(String string, Pattern pattern) {
    List<String> values = string.trim().split(pattern);
    List<String> updated = [];
    values.forEach((str) {
      String pascal = pascalCase(str).trim();
      updated.add(pascal);
    });

    String finalStr = updated.toString();
    return finalStr.substring(1, finalStr.lastIndexOf("]"));
  }

  static String pascalCase(String str) {
    String spaceless = str.trim();
    if (spaceless.isEmpty) {
      return "";
    }
    String initial = spaceless.substring(0, 1).toUpperCase();
    String remaining = spaceless.substring(1);
    String pascal = initial + remaining;
    return pascal;
  }
}
