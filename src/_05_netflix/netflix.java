package _05_netflix;

public class netflix {

public static void main(String[] args) {
Movie birb = new Movie("twilight", 1);
Movie stck = new Movie("harry potter", 2);
Movie crcle = new Movie("captian maerica", 5);
Movie oldman = new Movie("the intern", 3);
Movie swordlady = new Movie("mulan", 5);
Movie urmom = new Movie("the social delema", 0);


System.out.println(swordlady.getTicketPrice());
	
NetflixQueue list = new NetflixQueue();

list.addMovie(urmom);
list.addMovie(swordlady);
list.addMovie(oldman);
list.addMovie(crcle);
list.addMovie(stck);
list.addMovie(birb);
list.printMovies();
System.out.println(list.getBestMovie().getTitle());
System.out.println(list.getMovie(1).getTitle());
	
}	
	
}
