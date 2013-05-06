package cn.abuild.member.dao.springjdbc;

import java.util.List;

import org.hi.framework.dao.springjdbc.BaseDAOSpringJDBC;

import cn.abuild.member.dao.MemberDAO;
import cn.abuild.member.model.Member;


public class MemberDAOSpringJDBC extends BaseDAOSpringJDBC implements MemberDAO {

	@Override
	public boolean updateMemeber(Member member) {
		String sql = "UPDATE abuild_member SET member_name=? WHERE  id=?";

		return this.getJdbcTemplate().update(
				sql,
				new Object[] { member.getMember_name()},
				new int[] {java.sql.Types.VARCHAR}) > 0;
	}


	@Override
	public List<Member> getMemberAll() {
		String sql="SELECT * FROM abuild_member";
		return this.getJdbcTemplate().query(sql, new SpringJDBCHiRowMapper(Member.class, null, 1, null));
	}
	
	@Override
	public boolean updateMemberMark(Member member) {
		String sql="delete from abuild_member where is_delete = 0 and id=?";
		return this.getJdbcTemplate().update(sql, new Object[]{member.getId()}, new int []{java.sql.Types.INTEGER})>0;
	}


	@Override
	public boolean returnDefaultPwd(Member member) {
		String sql ="update abuild_member set password=? where id=?";
		return  this.getJdbcTemplate().update(sql, new Object[]{member.getPassword(), member.getId()}, new int []{java.sql.Types.VARCHAR, java.sql.Types.INTEGER})>0;
	}


}
