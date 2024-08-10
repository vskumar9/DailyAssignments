package package1;

public class IntegerComparisonExample {
    public static void main(String[] args) {

//Mention what's the result in 1, 2, 3,4 and 5
        // Primitive int
        int int1 = 100;
        int int2 = 100;
        
        // Integer objects
        Integer intObj1 = 100;
        Integer intObj2 = 100;
        Integer intObj3 = new Integer(100);
        Integer intObj4 = new Integer(200);

        // Using == with primitive int
        System.out.println("int1 == int2: " + (int1 == int2)); // 1. (compares values)

        // Using == with Integer objects (within -128 to 127 range)
        System.out.println("intObj1 == intObj2: " + (intObj1 == intObj2)); // 2. (cached objects)

        // Using == with Integer objects (new instance)
        System.out.println("intObj1 == intObj3: " + (intObj1 == intObj3)); // 3. (different instances)

        // Using equals() with Integer objects
        System.out.println("intObj1.equals(intObj3): " + intObj1.equals(intObj3)); // 4. (same content)
        System.out.println("intObj1.equals(intObj4): " + intObj1.equals(intObj4)); // 5. (different content)
    }
}
