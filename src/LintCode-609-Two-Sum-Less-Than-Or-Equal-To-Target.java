/// https://www.lintcode.com/problem/609/

public class Solution {
    /**
     * @param nums: an array of integer
     * @param target: an integer
     * @return: an integer
     */
    public int twoSum5(int[] nums, int target) {
        if (nums == null || nums.length == 0) {
            return 0;
        }

        int numberOfPairs = 0;

        Arrays.sort(nums);
        int left = 0;
        int right = nums.length - 1;

        while (left < right) {
            int sum = nums[left] + nums[right];
            if (sum <= target) {
                numberOfPairs += (right - left);
                left += 1;
            } else {
                right -= 1;
            }
        }

        return numberOfPairs;
    }
}