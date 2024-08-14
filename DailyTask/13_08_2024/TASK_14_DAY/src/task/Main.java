package task;

public class Main {
    
    public static int riskyOperation(int value) throws UserException {
        if (value < 0) {
            
            throw new UserException("Value cannot be negative.");
        }
        return value * 2;
    }

    public static void main(String[] args) {
        try {
            
            int result = riskyOperation(-5);
            System.out.println("Result: " + result);
        } catch (UserException e) {
            
            System.out.println("Error: " + e.getMessage());
        }
    }
}
