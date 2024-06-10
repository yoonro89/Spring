package vo;

public class PersonVO {
	private String name, tel;
	private int age;
	
	public PersonVO() {
		System.out.println("--PersonVO의 기본생성자--");
	}
	
	public PersonVO(String name, int age, String tel) {
		this.name = name;
		this.age = age;
		this.tel = tel;
				
		System.out.println("--PersonVO의 파라미터를 받는 생성자--");
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
		System.out.println("--setNmae()호출됨 : " + name + "--");
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
}
