package _02_backpack;

public class BackpackRunner {
	public static void main(String[] args) {
		new Backpack().packAndCheck();
		
		Backpack bag = new Backpack();
		Pencil pen = new Pencil();
		Ruler inch = new Ruler();
		Textbook book = new Textbook();
		
		bag.putInBackpack(pen);
		bag.putInBackpack(inch);
		bag.putInBackpack(book);
		bag.packAndCheck();
		bag.goToSchool();
		
		inch.measure();
		pen.write("oolooloogogloolool");
		book.read();
		
	}
}
