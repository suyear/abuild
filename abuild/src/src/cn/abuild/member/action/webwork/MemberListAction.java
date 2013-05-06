package cn.abuild.member.action.webwork;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.lang.reflect.Method;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hi.SpringContextHolder;
import org.hi.framework.web.webwork.BaseAction;

import cn.abuild.member.action.MemberPageInfo;
import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;


public class MemberListAction extends BaseAction{
	private Member member;
	private MemberPageInfo pageInfo;
	private List<Member> members;

	public String findAll() throws Exception {
		MemberManager memberMgr = (MemberManager)SpringContextHolder.getBean(Member.class);
		pageInfo = pageInfo == null ? new MemberPageInfo() : pageInfo;
		if(StringUtils.isEmpty(pageInfo.getSorterName()))
		{
			pageInfo.setSorterName("create_date");
			pageInfo.setSorterDirection("desc");
		}
		
		members = memberMgr.getMemberAll();
		return returnCommand();	
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
	
	public List<Member> getMembers() {
		return members;
	}

	public void setMembers(List<Member> members) {
		this.members = members;
	}

	public MemberPageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(MemberPageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}	
}
