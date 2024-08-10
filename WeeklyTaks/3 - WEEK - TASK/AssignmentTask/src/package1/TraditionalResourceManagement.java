package package1;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class TraditionalResourceManagement { 

	public static void main(String[] args) { 

		BufferedReader reader = null; 

		try { 
			reader = new BufferedReader(new FileReader("C:\\Users\\sanjeevkumar.v\\Desktop\\Training\\Payoda_Phase1_Trainee\\WeeklyTaks\\3 - WEEK - TASK\\AssignmentTask\\src\\package1\\TraditionalResourceManagement.java")); 
			String line; 
			while ((line = reader.readLine()) != null) { 
				System.out.println(line); 
			} 
		} catch (IOException e) { 
			e.printStackTrace(); 
		} finally { 
			if (reader != null) { 
				try { 
					reader.close(); 
				} catch (IOException e) { 
					e.printStackTrace(); 
				} 
			} 
		} 
	} 
} 