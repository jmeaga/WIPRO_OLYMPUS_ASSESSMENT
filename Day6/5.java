Rohan is given a task two return indices of pair whose sum will be equal to the given target.
Only one such pair is required.

import java.util.*;

class TargetSum{
    static int[] twoSum(int n, int[] nums, int target) {
       //write your answer here
       for(int i=0;i<n;i++)
       {
           for(int j=i+1;j<n;j++)
           {
               if(nums[i]+nums[j]==target)
               {
                   return new int[]{i,j};
               }
           }
       }
       return new int[]{-1,-1};
    }
    
    public static void main (String[] args) {
        Scanner in = new Scanner(System.in);
        int n = in.nextInt();
        int arr[] = new int[n];
        for(int i=0;i<n;i++)
            arr[i] = in.nextInt();
        int target = in.nextInt();
        int[] ans = twoSum(n,arr,target);
        System.out.println("("+ans[0]+" , "+ans[1]+")");
    }

}