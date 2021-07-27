package disassemble.DTO;

import java.sql.Date;

public interface MemberInterface {
	public void setEmail(String email);
	public void setPassword(String password);
	public void setName(String name);
	public void setRegisterDate(Date registerDate);

	public String getEmail();
	public String getPassword();
	public String getName();
	public Date getRegisterDate();
}
