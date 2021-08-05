/**
 *  183. Wood Cut
 */
public class Solution {
    /**
     * @param L: Given n pieces of wood with length L[i]
     * @param k: An integer
     * @return: The maximum length of the small pieces
     */
    public int woodCut(int[] L, int k) {
        if (L == null || L.length == 0) {
            return 0;
        }

        long maxValue = 0;
        for (int i = 0; i < L.length; i++) {
            maxValue = Math.max(maxValue, L[i]);
        }

        int start = 1;
        int end = (int)maxValue;
        if (start > end) {
            return 0;
        }

        while (start + 1 < end) {
            int mid = start + (end - start) / 2;
            if (getNumberOfPieces(L, mid) >= k) {
                start = mid;
            } else {
                end = mid;
            }
        }

        if (getNumberOfPieces(L, end) >= k) {
            return end;
        }
        if (getNumberOfPieces(L, start) >= k) {
            return start;
        }

        return 0;
    }

    private int getNumberOfPieces(int[] L, int length) {
        int piecies = 0;
        for (int i = 0; i < L.length; i++) {
            piecies += (L[i] / length);
        }
        return piecies;
    }
}