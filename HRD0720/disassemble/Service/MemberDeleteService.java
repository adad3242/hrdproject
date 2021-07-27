package disassemble.Service;

import disassemble.DAO.MemberDAO;

public class MemberDeleteService {
	
	private MemberDAO memberDao;
	
	public MemberDeleteService(MemberDAO memberDao) {
	}
	
	public void checkPassword(String email, String password, String confirmPassword) {
		// 패스워드 확인
		// MemberDAO 객체 내 selectEmail() 메소드를 호출 
		// 저장된 회원 정보와 입력된 회원 정보 검증
		// MemberDAO 객체 내 delete() 호출
	}
}
