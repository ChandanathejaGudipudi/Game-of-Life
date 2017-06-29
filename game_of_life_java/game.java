package game_of_life;
import java.util.*;

public class game 
{
		private int dim;
		private long gen;
		private boolean matrix[][];
		
		//constructor
		game(int d)
		{
			this.dim = d;
			this.gen = 0;
			create();			
		}
		
		//function to instantiate the matrix
		private void create()
		{
			boolean temp[][] = new boolean[dim][dim];
			int i, j;
			for(i=0; i<dim; i++)
			{
				for(j=0; j<dim; j++)
					temp[i][j] = (Math.random() < 0.5);
			}
			matrix = temp;
		}
		
		//print the current matrix
		public void print()
		{
			System.out.println("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*");
			System.out.println();
			System.out.println("Generation : " + gen);
			System.out.println();
			int i, j;
			for(i=0; i<dim; i++)
			{
				for(j=0; j<dim; j++)
				{
					if(matrix[i][j])
						System.out.print("#");
					else
						System.out.print(".");
					System.out.print(" ");
				}
				System.out.println();
			}
			System.out.println();
			System.out.println("~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*~*");
			System.out.println();
			System.out.println();
		}
		
		// generate new matrix based upon the rules if you use 
		//non memory efficient method
		public void generate_new()
		{
			boolean temp[][] = new boolean[dim][dim];
			int i, j;
			for(i=0; i<dim; i++)
			{
				for(j=0; j<dim; j++)
					temp[i][j] = check(i, j);
			}
			matrix = temp;
			gen++;
		}
		
		//change the current matrix to the next matrix
		//memory efficient method
		public void generate_next()
		{
			Vector x = new Vector();
			Vector y = new Vector();
			int i, j;
			for(i=0; i<dim; i++)
			{
				for(j=0; j<dim; j++)
				{
					if(toggle(i, j))
					{
						x.addElement(new Integer(i));
						y.addElement(new Integer(j));
					}
				}
			}
			j = 0;
			for(i=0; i<x.size(); i++)
			{
				int r = (int)x.get(i);
				int c = (int)y.get(j);
				if(matrix[r][c])
					matrix[r][c] = false;
				else
					matrix[r][c] = true;
				j++;
			}
			gen++;
		}
		
		//check if this cell has to live or die in the next generation 
		//if you use non memory efficient method
		private boolean check(int row, int col)
		{
			boolean curr = matrix[row][col];
			int live_neighbours = 0;
			int i, j, r, c;
			for(i =(-1); i<=1; i++)
			{
				r = row + i;
				if(r<0 || r>=dim)
					continue;
				for(j=(-1); j<=1; j++)
				{
					c = col + j;
					if(c<0 || c>=dim)
						continue;
					if(matrix[r][c])
						live_neighbours++;
				}
			}
			if(curr)
				live_neighbours--;
			if(live_neighbours==2 && curr)
				return true;
			else if(live_neighbours == 3)
				return true;
			else
				return false;
		}
		
		//check if the value of this cell need to be toggled
		// memory efficient method
		private boolean toggle(int row, int col)
		{
			boolean curr = matrix[row][col];
			int live_neighbours = 0;
			int i, j, r, c;
			for(i =(-1); i<=1; i++)
			{
				r = row + i;
				if(r<0 || r>=dim)
					continue;
				for(j=(-1); j<=1; j++)
				{
					c = col + j;
					if(c<0 || c>=dim)
						continue;
					if(matrix[r][c])
						live_neighbours++;
				}
			}
			if(curr)
				live_neighbours--;
			if(live_neighbours==2 && curr)
				return false;
			if(live_neighbours == 3 && curr)
				return false;
			if(live_neighbours == 3 && !curr)
				return true;
			if((live_neighbours<2 || live_neighbours>3) && curr)
				return true;
			if(live_neighbours!=3 && !curr)
				return false;
			return false;
		}
}
