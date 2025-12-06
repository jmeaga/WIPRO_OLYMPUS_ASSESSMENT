Write a java program to remove an element from the Map, you can use the remove() method. This method takes the key value and

removes the mapping for a key from this map if it is present in the map.

Instruction- before running the program , give 4 string inputs and then the one  integer number which key you want to remove.
keys should start from 1.

import java.util.*;
import java.util.Scanner;
// Java program to remove
// elements from HashMap
import java.io.*;
public class Main {

    public static void main(String[] args) {
	Scanner sc=new Scanner(System.in);
        //write your answer here
    String str=sc.nextLine();
    String arr[]=str.split("\\s+");
    // System.out.print(Arrays.toString(arr));
    HashMap<Integer,String> map=new HashMap<>();
    for(int i=1;i<=4;i++){
        map.put(i,arr[i-1]);
    }
    int key=Integer.parseInt(arr[4]);
    System.out.println("Mappings of HashMap are : "+map);
    map.remove(key);
    System.out.println("Mappings after removal are : "+map);
    }
}