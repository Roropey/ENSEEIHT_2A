import java.util.Objects;
import lombok.*;
/** DÃ©finir une position.  */
public class Position {
	@Data private int x;
	@Data private int y;

	public int getX() {
		return x;
	}

	@Override
	public int hashCode() {
		return Objects.hash(x, y);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Position other = (Position) obj;
		return x == other.x && y == other.y;
	}

	

	public int getY() {
		return y;
	}

/*
		
	public Position(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("...appel Ã  Position(" + x + "," + y + ")" + " --> " + this);
	}
		
*/				

	@Override public String toString() {
		return super.toString() + "(" + x + "," + y + ")";
	}
	
}
