package disassemble.DAO;

import java.util.Collection;
import java.util.HashMap;

import disassemble.DTO.Member;


public class MemberDAO implements MemberDAOInterface{
	private HashMap<String, Member> map = new HashMap<String, Member>();

	@Override
	public Collection<Member> selectAll() {
		return map.values();
	}

	@Override
	public Member selectEmail(String email) {
		return map.get(email);
	}

	@Override
	public void insert(Member member) {
		map.put(member.getEmail(), member);
		
	}

	@Override
	public void update(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(String email) {
		// TODO Auto-generated method stub
		
	}

}
