package multipleInheritance;

public class ColorfulCircle implements Drawable, Colorable {

	@Override
	public void color() {
		// TODO Auto-generated method stub
		System.out.println("Coloring the circle.");
	}

	@Override
	public void draw() {
		// TODO Auto-generated method stub
		System.out.println("Drawing the circle.");
	}

}
