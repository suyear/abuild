package cn.abuild.member.action.webwork;

import org.hi.SpringContextHolder;
import org.hi.framework.web.SynchronizationData;
import org.hi.framework.web.webwork.BaseAction;

import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;

public class MemberSaveAction extends BaseAction implements SynchronizationData{
	private Member member;
	
	public String execute() throws Exception {
		MemberManager memberMgr = (MemberManager)SpringContextHolder.getBean(Member.class);
		if(super.perExecute(member)!= null) return returnCommand();
		memberMgr.saveMember(member);
		super.postExecute(member);
		return returnCommand();
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}
