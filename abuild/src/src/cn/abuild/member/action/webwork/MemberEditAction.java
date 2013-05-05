package cn.abuild.member.action.webwork;

import org.hi.SpringContextHolder;
import org.hi.framework.web.webwork.BaseAction;

import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;


public class MemberEditAction  extends BaseAction{

		private Member member;
		
		public String execute() throws Exception {
			MemberManager memberMgr = (MemberManager)SpringContextHolder.getBean(Member.class);
			if(super.perExecute(member)!= null) return returnCommand();
			memberMgr.updateMemeber(member);
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
