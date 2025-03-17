class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    // 배열 합치기
    List<int> nums = [...nums1, ...nums2];
  
    // 합친 배열 정렬
    nums.sort();
  
    int length = nums.length;
  
    // 배열 길이가 짝수인 경우
    if (length % 2 == 0) {
        int middle1 = nums[length ~/ 2 - 1];
        int middle2 = nums[length ~/ 2];
        return (middle1 + middle2) / 2.0;
    } 
    // 배열 길이가 홀수인 경우
    else {
        return nums[length ~/ 2].toDouble();
    }
  }
}