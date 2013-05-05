package cn.abuild.member.action.webwork;

import java.util.List;

import org.hi.SpringContextHolder;
import org.hi.framework.web.webwork.BaseAction;

import cn.abuild.member.model.Member;
import cn.abuild.member.service.MemberManager;

import com.google.gson.Gson;
import com.opensymphony.xwork.ActionContext;

public class MemberViewAction extends BaseAction{
	private Member member;
	private String listArr;
	
	public String getListArr() {
		return listArr;
	}

	public void setListArr(String listArr) {
		this.listArr = listArr;
	}

	public String execute() throws Exception {
		MemberManager memberMgr = (MemberManager)SpringContextHolder.getBean(Member.class);
		ActionContext map = ActionContext.getContext();
		Gson gson = new Gson();
		map.put("listArr", listArr);

		member = memberMgr.getMemberById(member.getId());
		return returnCommand();
	}
	
	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}
}
