package abstractOverloadingOverriding;

public abstract class Shape {
	// Abstract method (overridden by subclasses)
	public abstract void draw();

	// Overloaded method
	public void draw(int size) {
		System.out.println("Drawing shape of size: " + size);
	}

}
