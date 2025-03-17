class Solution {
  bool isPalindrome(int x) {
    String xString = x.toString();

    return xString == xString.split("").reversed.join("");
  }
}