class Solution {
  int lengthOfLongestSubstring(String s) {
    Map<String, int> charMap = {};

    int maxLength = 0;
    int start = 0;

    for (int i = 0; i < s.length; i++) {
        String currentChar = s[i];

        if (charMap.containsKey(currentChar) && charMap[currentChar]! >= start) {
            start = charMap[currentChar]! + 1;
        }

        charMap[currentChar] = i;

        maxLength = max(maxLength, i - start + 1);
    }

    return maxLength;
  }
}

int max(int a, int b) => a > b ? a : b;