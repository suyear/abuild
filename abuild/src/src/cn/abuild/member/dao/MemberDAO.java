package cn.abuild.member.dao;

import java.util.List;

import org.hi.framework.dao.DAO;

import cn.abuild.member.model.Member;

/**
 * 
 * @author SUYEAR
 *
 */
public interface MemberDAO extends DAO{
	 /**
	  * 
	  * @param member
	  * @return
	  */
	public boolean updateMemeber(Member member);
	/**
	 * 
	 * @param pageInfo
	 * @return
	 */
	public List<Member> getMemberAll();
	/**
	 * 恢复默认密码
	 * @param member
	 * @return
	 */
	public boolean returnDefaultPwd(Member member);
	/**
	 * 
	 * @param member
	 * @return
	 */
	public boolean updateMemberMark(Member member);
}
