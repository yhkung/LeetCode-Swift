/// 443 · Two Sum - Greater than target
/// https://www.lintcode.com/problem/443/
public class Solution {
    public int twoSum2(int[] nums, int target) {
        if (nums == null || nums.length == 0) {
            return 0;
        }
        Arrays.sort(nums);

        int pairs = 0;

        int low = 0;
        int high = nums.length - 1;

        while (low < high) {
            if (nums[low] + nums[high] > target) {
                pairs += high - low;
                high -= 1;
            } else {
                low += 1;
            }
        }

        return pairs;
     }
}