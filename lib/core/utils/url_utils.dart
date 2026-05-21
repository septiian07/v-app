bool isValidUrl(String? url) {
  return url != null && url.isNotEmpty && url.startsWith('http');
}
