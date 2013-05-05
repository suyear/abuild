package cn.abuild.member.action.webwork;

import org.hi.SpringContextHolder;
import org.hi.framework.web.webwork.BaseAction;
import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;

public class MemberRemoveAllAction extends BaseAction{
	private Member member;
	private String orderIndexs;
	
	public String execute() throws Exception {
		MemberManager memberMgr = (MemberManager)SpringContextHolder.getBean(Member.class);
		
		if (orderIndexs != null && orderIndexs.length()> 0 )
		{
			String[] ids= orderIndexs.split(",");
			for( int i=0; i<ids.length; i++)
			{
				if (ids[i].length()>0)
				{
				Integer memberid = new Integer( ids[i] );
				
				member =new Member();
				member.setId(memberid);
				memberMgr.updateMemberMark(member);
				}
			}
		}
		
		return returnCommand();
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	public String getOrderIndexs() {
		return orderIndexs;
	}

	public void setOrderIndexs(String orderIndexs) {
		this.orderIndexs = orderIndexs;
	}
}
