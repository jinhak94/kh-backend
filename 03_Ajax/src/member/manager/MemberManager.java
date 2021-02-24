package member.manager;

import java.util.ArrayList;
import java.util.List;

import member.model.vo.Member;

/**
 * singleton객체
 * 1. 생성자를 private로 지정해서 클래스 밖에서 객체 생성을 방지
 * 2. getInstance static 메소드를 통해서 특정 조건일떄만 객체를 생성
 * 
 */

public class MemberManager {
	//단 하나의 객체를 관리하기 위한 static field
	private static MemberManager instance;
	private List<Member> list;
	
	
	//new 연산자를 사용해서 객체 생성이 불가능하게 private로
	private MemberManager() {
		list = new ArrayList<>();
		list.add(new Member("박보검", "01012341234", "parkBogum.jpg"));
		list.add(new Member("쥴리아 로버츠", "01033334444", "juliaRoberts.jpg"));
		list.add(new Member("맷 데이먼", "01043215314", "mattDamon.jpg"));
		
	}
	
	public List<Member> getList(){
		return this.list;
	}
	
	/*
	 * 객체를 생성하거나, 생성된 객체를 리턴
	 */
	public static MemberManager getInstance() {
		if(instance == null) 
			instance = new MemberManager();
		return instance;
	}
}






