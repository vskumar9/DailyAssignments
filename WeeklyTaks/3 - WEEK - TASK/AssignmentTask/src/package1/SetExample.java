package package1;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.TreeSet;

public class SetExample {
	public static void main(String[] args) {
		// Set 1. What's the order of elements?        
		Set<String> hashSet = new HashSet<>();
		hashSet.add("Banana");
		hashSet.add("Apple");
		hashSet.add("Orange");
		hashSet.add("Grapes");

		System.out.println("HashSet: " + hashSet); 

		// LinkedHashSet 2. What's the order of elements  ?
		Set<String> linkedHashSet = new LinkedHashSet<>();
		linkedHashSet.add("Banana");
		linkedHashSet.add("Apple");
		linkedHashSet.add("Orange");
		linkedHashSet.add("Grapes");

		System.out.println("LinkedHashSet: " + linkedHashSet);

		// TreeSet 1. What's the order of elements  ?
		Set<String> treeSet = new TreeSet<>();
		treeSet.add("Banana");
		treeSet.add("Apple");
		treeSet.add("Orange");
		treeSet.add("Grapes");

		System.out.println("TreeSet: " + treeSet); 
	}
}

