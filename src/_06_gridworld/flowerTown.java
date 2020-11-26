package _06_gridworld;

import java.awt.Color;

import info.gridworld.actor.Bug;
import info.gridworld.actor.Flower;
import info.gridworld.grid.Location;
import info.gridworld.world.World;

public class flowerTown {

public static void main(String[] args) {
World kelp = new World();
kelp.show();
Bug kevin = new Bug(Color.blue);
Bug letuce = new Bug(Color.red);
Flower mush = new Flower(Color.CYAN);
Flower lef = new Flower(Color.green);
Location noodle = new Location(7,2);
Location LA = new Location(3,5);
Location LF = new Location(7,1);
Location Lt = new Location(7,3);
for (int i = 0; i < 10; i++) {
	for (int j = 0; j < 10; j++) {
		if (i%2==1) {
			kelp.add(new Location(i,j), new Flower(Color.white));
		}
		else {
			kelp.add(new Location(i,j), new Flower(Color.red));
		}
	}
}
kelp.add(LA, kevin);
kelp.add(noodle, letuce);
letuce.turn();
letuce.turn();
kelp.add(Lt, mush);
kelp.add(LF, lef);



}	
}
