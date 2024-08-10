package package1;

public class StringComparisonExample {
    public static void main(String[] args) {
        // String literals (pooled)
        String str1 = "Hello";
        String str2 = "Hello";

        // New String objects (not pooled)
        String str3 = new String("Hello");
        String str4 = new String("hello");

        // Using ==
        System.out.println("str1 == str2: " + (str1 == str2)); // 1. (same memory reference) what’s the result?
        System.out.println("str1 == str3: " + (str1 == str3)); //2. (different memory references) what’s the result?

        // Using equals()
        System.out.println("str1.equals(str3): " + str1.equals(str3)); //3.  (same content) what’s the result?
        System.out.println("str1.equals(str4): " + str1.equals(str4)); //4.  (case-sensitive) what’s the result?

        // Using equalsIgnoreCase()
        System.out.println("str1.equalsIgnoreCase(str4): " + str1.equalsIgnoreCase(str4)); //5. (case-insensitive) what’s the result?
    }
}