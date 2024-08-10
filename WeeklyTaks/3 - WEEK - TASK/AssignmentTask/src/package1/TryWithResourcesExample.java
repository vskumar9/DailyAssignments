package package1;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TryWithResourcesExample {
//Eliminating finally block to close resources.

    public static void main(String[] args) {
        // File path (adjust the path as needed)
        String filePath = "C:\\Users\\sanjeevkumar.v\\Desktop\\Training\\Payoda_Phase1_Trainee\\WeeklyTaks\\3 - WEEK - TASK\\AssignmentTask\\src\\package1\\TryWithResourcesExample.java";

        // Traditional try-with-resources block
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
