package looseCouplingwithBaseClass;

import abstractOverloadingOverriding.Circle;
import abstractOverloadingOverriding.Rectangle;
import abstractOverloadingOverriding.Shape;
import finalMethodClass.Utility;
import multipleInheritance.ColorfulCircle;

public class Main {
	public static void main(String[] args) {
		BaseShape base = new BaseShape();

		Shape circle = new Circle();
		Shape rectangle = new Rectangle();

		base.displayShape(circle); // Drawing a circle
		base.displayShape(rectangle); // Drawing a rectangle

		ColorfulCircle colorfulCircle = new ColorfulCircle();
		colorfulCircle.draw(); // Drawing a circle
		colorfulCircle.color(); // Coloring the circle

		Utility utility = new Utility();
		utility.printMessage(); // This is a final method and cannot be overridden.
	}
}
