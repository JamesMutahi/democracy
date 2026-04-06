/// The regular expression to match URLs (supporting http, https, and www.)
final RegExp linkRegExp = RegExp(
  r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&:/~+#-]*[\w@?^=%&/~+#-])?',
);
