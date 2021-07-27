package disassemble.DAO;

import java.util.Collection;

import disassemble.DTO.Member;

public interface MemberDAOInterface {
	public Collection<Member> selectAll() ;
	public Member selectEmail(String email);
	public void insert(Member member);
	public void update(Member member);
	public void delete(String email);
}
