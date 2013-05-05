package cn.abuild.member.service.impl;

import java.util.List;

import org.hi.framework.paging.PageInfo;
import org.hi.framework.service.impl.ManagerImpl;

import cn.abuild.member.dao.MemberDAO;
import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;

public class MemberManagerImpl extends ManagerImpl implements MemberManager{
    
    protected void preSaveObject(Object obj) {
        super.preSaveObject(obj);

    }

    protected void postSaveObject(Object obj) {
        super.postSaveObject(obj);

    }

    @Override
	public List<Member> getMemberAll() {
		
    	
		return ((MemberDAO)dao).getMemberAll();
	}

	protected void preRemoveObject(Object obj) {
        super.preRemoveObject(obj);
        
    }

    @Override
	public boolean updateMemeber(Member member) {

		return ((MemberDAO)dao).updateMemeber(member);
	}

	protected void postRemoveObject(Object obj) {
        super.postRemoveObject(obj);
        
    }
    
    public void saveMember(Member member){
    	saveObject(member);
    
    }

    public void removeMemberById(Integer id){
    	removeObjectById(id);
    	
    }

    public Member getMemberById(Integer id){
   		return (Member) getObjectById(id);
    }

    public List<Member> getMemberList(PageInfo pageInfo){
    	return super.getList(pageInfo);
    }

    public void saveSecurityMember(Member member){
    	saveObject(member);
    
    }

    public void removeSecurityMemberById(Integer id){
    	removeObjectById(id);
    	
    }

    public Member getSecurityMemberById(Integer id){
   		return (Member) getObjectById(id);
    }

    public List<Member> getSecurityMemberList(PageInfo pageInfo){
    	return super.getList(pageInfo);
    }

	@Override
	public boolean returnDefaultPwd(Member member) {
		return ((MemberDAO)dao).returnDefaultPwd(member);
	}    
	
	@Override
	public boolean updateMemberMark(Member member) {
		
		return ((MemberDAO)dao).updateMemberMark(member);
	}
}
