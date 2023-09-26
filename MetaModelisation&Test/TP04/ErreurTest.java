/** ErreurTest est un programme de test qui définit trois méthodes de test
  * dont une provoque une erreur.
  */
public class ErreurTest {
	@UnTest
	public void tester1() {
	}
	@UnTest
	public void tester2() {
		Assert.assertTrue(false);
	}
	@UnTest
	public void tester3() {
		Assert.assertTrue(true);
	}

}
