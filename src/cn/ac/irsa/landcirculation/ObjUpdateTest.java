package cn.ac.irsa.landcirculation;

public class ObjUpdateTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		// TODO Auto-generated method stub

		Person personDes = new Person();
		Person personSrc = new Person();
		personDes.setName("����");
		personDes.setAge(41);
		personDes.setSex(true);
		personSrc.setAge(60);
		System.out.println("����ǰpersonDes:" + personDes.getName() + personDes.getAge() + personDes.isSex());
		ObjUpdate.update(personDes, personSrc);
		System.out.println("\n���º�personDes:" + personDes.getName() + personDes.getAge() + personDes.isSex());

	}

}
