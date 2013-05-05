package cn.abuild.member.action.webwork;

import org.hi.SpringContextHolder;
import org.hi.framework.web.webwork.BaseAction;

import cn.abuild.member.dao.MD5;
import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;


public class ReturnDefaultPwdAction extends BaseAction {
		private MD5 md5 = new MD5();
		private Member member;

		public MD5 getMd5() {
			return md5;
		}

		public void setMd5(MD5 md5) {
			this.md5 = md5;
		}

		public Member getMember() {
			return member;
		}

		public void setMember(Member member) {
			this.member = member;
		}



		@Override
		public String execute() throws Exception {
			MemberManager memberMgr = (MemberManager)SpringContextHolder.getBean(Member.class);
			member.setPassword(md5.getMD5ofStr("abuild"));
			memberMgr.returnDefaultPwd(member);
		return returnCommand();
		}
	

}
