package cn.abuild.member.service;

import java.util.List;

import org.hi.framework.paging.PageInfo;
import org.hi.framework.service.Manager;

import cn.abuild.member.model.Member;


public interface MemberManager extends Manager{
    
	/**
	 * 添加用户
	 * @param member
	 */
    public void saveMember(Member member);

    /**
     * 移除用户
     * @param id
     */
    public void removeMemberById(Integer id);

    /**
     * 查询用户
     * @param id
     * @return
     */
    public Member getMemberById(Integer id);

    /**
     * 分页查询所有用户
     * @param pageInfo
     * @return
     */
    public List<Member> getMemberList(PageInfo pageInfo);
    
    public boolean updateMemberMark(Member member);
    
    public void saveSecurityMember(Member member);

    public void removeSecurityMemberById(Integer id);

    public Member getSecurityMemberById(Integer id);

    public List<Member> getSecurityMemberList(PageInfo pageInfo); 
    
    public boolean updateMemeber(Member member);
    
    public List<Member> getMemberAll();
    
	public boolean returnDefaultPwd(Member member);
    
    
}
