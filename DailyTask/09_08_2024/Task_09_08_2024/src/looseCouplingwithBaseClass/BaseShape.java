package looseCouplingwithBaseClass;

import abstractOverloadingOverriding.Shape;

//Base class
class BaseShape {
	void displayShape(Shape shape) {
		shape.draw();
		shape.draw(10); // Overloaded method call
	}
}