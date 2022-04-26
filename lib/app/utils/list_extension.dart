extension MyExtensionList<T> on List<T> {
  V foldWithIndex<V>(V initialValue,
      V Function(int index, int length, V previousValue, T element) fWindex) {
    var index = 0;
    var size = this.length;
    return fold(initialValue, (previousValue, element) {
      var retrieveValue = fWindex(index, size, previousValue, element);
      index++;
      return retrieveValue;
    });
  }
}