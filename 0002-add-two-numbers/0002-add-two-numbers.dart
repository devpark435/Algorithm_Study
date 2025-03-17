/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */
class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    ListNode dummy = ListNode(0); // 더미 헤드 노드
    ListNode current = dummy;
    int carry = 0;
  
    // 두 리스트 중 하나라도 남아있거나 올림수가 있는 경우 계속 진행
    while (l1 != null || l2 != null || carry != 0) {
        // 현재 자릿수의 값들 가져오기
        int x = l1?.val ?? 0;
        int y = l2?.val ?? 0;
    
        // 합계 계산 (이전 자릿수의 올림 포함)
        int sum = x + y + carry;
    
        // 새로운 올림 계산
        carry = sum ~/ 10;
    
        // 현재 자릿수 결과 저장
        current.next = ListNode(sum % 10);
        current = current.next!;
    
        // 다음 노드로 이동
        l1 = l1?.next;
        l2 = l2?.next;
    }
  
    return dummy.next; // 더미 헤드 다음부터 반환
  }
}