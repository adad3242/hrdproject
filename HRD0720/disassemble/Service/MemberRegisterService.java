package disassemble.Service;

import disassemble.DAO.MemberDAO;
import disassemble.DTO.Member;
import disassemble.DTO.RegisterRequest;

public class MemberRegisterService {
	private MemberDAO memberDao = new MemberDAO();
	
	public MemberRegisterService(MemberDAO memberDao) {
		
	}
	
	public void regist(RegisterRequest req) {
			Member member2 = memberDao.selectEmail(req.getEmail());
			if(member2 == null) {
				Member member = new Member();
				member.setEmail(req.getEmail());
				member.setName(req.getName());
				member.setPassword(req.getPassword());
				memberDao.insert(member);
				System.out.println("계정이 등록되었습니다.");
			} else {
				System.out.println("중복된 이메일이 등록되어 있습니다.");
			}
			
			
			
			
		// password == confirmPassword
		// email로 계정 등록 여부 확인
		// memberDao.insert() 계정 등록
	}

}
