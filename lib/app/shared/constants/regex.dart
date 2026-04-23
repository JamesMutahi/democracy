/// The regular expression to match URLs (supporting http, https, and www.)
final RegExp linkRegExp = RegExp(
  r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?',
);

/// RRegex to match allowed search characters.
final searchRegex = RegExp(r'^[a-zA-Z0-9]*$');
