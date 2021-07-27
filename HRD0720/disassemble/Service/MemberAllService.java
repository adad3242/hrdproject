package disassemble.Service;

import java.util.Collection;

import disassemble.DAO.MemberDAO;
import disassemble.DTO.Member;

public class MemberAllService {
	private MemberDAO memberDao = new MemberDAO();
	
	public MemberAllService(MemberDAO memberDao){
	}
	
	public void selectAll() {
		Collection<Member> all = memberDao.selectAll();
		if(all.isEmpty() == false) {
			for(Member member : all) {
				System.out.println(member.getEmail()+", "+member.getPassword()+", "+ member.getName());
			}
		}else {
			System.out.println("등록 후 이용해주세요.");
		}
	}
		// MemberDAO 객체 내부 selectAll() 호출 후 회원 모든 정보 출력
	}

