package disassemble.Service;

import disassemble.DAO.MemberDAO;

public class ChangePasswordService {
	private MemberDAO memberDao;
	
	public ChangePasswordService(MemberDAO memberDao) {
	}

	public void changePassword(String email, String oldPw, String newPw) {
		// 이메일 등록여부 확인.
		// 패스워드 확인 및 MemberDAO.update() 호출 
	}

}
