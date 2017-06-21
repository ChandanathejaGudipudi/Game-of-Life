package game_of_life;

public class start {
	public static void main(String[] args)
	{
		game g = new game(6);
		g.print();
		int i = 0;
		while(i<50)
		{
			g.generate_next(); // memory efficient
			//g.generate_new(); // non-memory efficient
			g.print();
			i++;
		}
	}
}
