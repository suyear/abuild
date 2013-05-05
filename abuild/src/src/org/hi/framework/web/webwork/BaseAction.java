/**
 * 
 */
package org.hi.framework.web.webwork;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.hi.framework.HiConfigHolder;
import org.hi.framework.web.Action;
import org.hi.framework.web.BusinessException;
import org.hi.framework.web.taglib.component.bean.Token;
import org.hi.i18n.util.I18NUtil;

import com.google.gson.Gson;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;
import com.opensymphony.xwork.ActionProxy;
import com.opensymphony.xwork.ActionSupport;

/**
 * Action基类,继承了ww的ActionSupport,封装了一些获得request和respnose的方法
 * 
 * @author wei.li,张昊
 * @version 20070511
 */
public abstract class BaseAction extends ActionSupport implements Action{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String lookup;
	private String workflow;
	private Object errorObject;
	
	protected static final String DOWNLOAD="download";
	protected static final String AUTO="auto";
	protected static final String JSON="json";
	protected static final String NEXTPAGE="nextpage";
	
	private String ftpip="127.0.0.1";
	private String ftpUser="xiao";
	private String ftpPassword="xiao";
	private String ftpRoot="";
	private String nextPage;
	
	private ActionProxy proxy;
	
	/**
	 * 返回当前时间戳
	 * @return
	 */
	public Timestamp getCurTimestamp()
	{		
		return  new Timestamp(System.currentTimeMillis());
	}
	
	/**
	 * 返回当前日期
	 * @return
	 */
	public Date getCurDate()
	{
		return new Date();		
	}
	
	public String getNextPage() {
		return nextPage;
	}
	public void setNextPage(String nextPage) {
		this.nextPage = nextPage;
	}
	public ActionProxy getProxy(){
		if(proxy  == null)
			proxy = ActionContext.getContext().getActionInvocation().getProxy();
		return proxy;
	}
	public String getLookup() {
		return lookup;
	}

	public void setLookup(String lookup) {
		this.lookup = lookup;
	}

	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}

	public HttpServletResponse getResponse() {
		return ServletActionContext.getResponse();
	}


	public HttpSession getSession() {
		return ServletActionContext.getRequest().getSession(true);
	}

	public String getParameter(String name) {
		return getRequest().getParameter(name);
	}
	
	public Object getErrorObject() {
		return errorObject;
	}

	public void setErrorObject(Object errorObject) {
		this.errorObject = errorObject;
	}	

	
	/*
	 * 将字符串转换成日期类型如果出错就返回空
	 */
	protected Date getDateFromStr(String sendTime_str) {
		Date returnDate= null;
		DateFormat df =  new SimpleDateFormat("yyyy-MM-dd HH:mm");
		 if (sendTime_str == null || sendTime_str.equals(""))
	     {
	    	return null;
	     }else
	     {
	    	 try{
	    		 returnDate = df.parse(sendTime_str);
	    	 }
	    	 catch(Exception e)
	    	 {
	    		 returnDate =  null; 
	    	 }
	     }
	    return returnDate;
	}
	 

	 
	public String saveFile(File file, String fileName,String moduleName) throws IOException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String prefix = ServletActionContext.getServletContext().getRealPath("/");
		String dateString = new Long (new Date().getTime() ).toString();
		String fileNameExt = fileName.substring(fileName.lastIndexOf("."));
		fileName  = dateString+ fileNameExt;
		 
		
		String filePath = HiConfigHolder.getRootUpload() + "/"  
				+ moduleName + "/" + formatter.format(new Date())
				+ "/" + fileName;
		File dest = new File(prefix + "/" + filePath);
		 
		FileUtils.copyFile(file, dest);
		 
		return filePath;
	}
	
	/**
	public String saveFileToFTP(File file, String fileName,String moduleName) throws IOException {
		if(moduleName == null || moduleName.equals(""))
			moduleName = "common";
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String prefix = ServletActionContext.getServletContext().getRealPath(
				"/");
		String dateString = new Long (new Date().getTime() ).toString();
		String fileNameExt = fileName.substring(fileName.lastIndexOf("."));
		fileName  = dateString+ fileNameExt;
		 
		
		 FtpUtil ftp = new FtpUtil();    
		    try {
		    	
		         //连接ftp服务器    
		         ftp.connectServer(ftpip, ftpUser, ftpPassword, ftpRoot);    
		       // 上传文件到 moduleName 文件夹下 如果没有就创建文件夹     
		         ftp.upload(file,moduleName,fileName);    
		        
		    } catch (IOException e) {    
		       throw e;
		    }finally    
		    {    
		       ftp.closeServer();    
		    }    
		 
		return moduleName+"/"+fileName;
	}
	 **/
	 
	
	

	public String perExecute(Object obj) throws Exception {
//		if(!(obj instanceof BaseObject))
//			return null;
		
		if(this.getErrorObject() != null)
			throw new BusinessException(I18NUtil.getString("该页面中的数据已经被改写，请重新刷新页面后重新编辑该记录"));
		
		Token token = null;
		if(getSession().getAttribute(Token.TOKEN_LIST_NAME) == null){
			token = new Token();
			getSession().setAttribute(Token.TOKEN_LIST_NAME, token);
		}
		else{
			token = (Token)getSession().getAttribute(Token.TOKEN_LIST_NAME);
		}
		boolean hasToken = token.isTokenStringValid(getRequest().getParameter(Token.TOKEN_STRING_NAME));
		
		return hasToken ? null : getRequest().getParameter(Token.TOKEN_STRING_NAME);
	}
	
	
	
	public String postExecute(Object obj) throws Exception{
		return null;
	}

	public String getWorkflow() {
		return workflow;
	}

	public void setWorkflow(String workflow) {
		this.workflow = workflow;
	}
	
	//------- for dwz -----//

	protected String returnCommand(){
		return returnCommand(null);
	}
	protected String returnCommand(String message){
		String viewMode = HiConfigHolder.getViewMode();
		
		if(viewMode.equals("dwz")){
			if ((ajax == null || !ajax.trim().equals("1")) && message == null)
				return SUCCESS;
			if(message == null)
				return ajaxForwardSuccess(I18NUtil.getString("操作成功"));
			else
				return ajaxForwardError(message);
		}
		
		return SUCCESS;
	}
	
	//zhanghuihua for dwz
	private int statusCode = 200;
	private boolean success = false;


	private String tipsMessage;
	private String forwardUrl;
	private String ajax;
	
	
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public void setAjax(String ajax) {
		this.ajax = ajax;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode){
		this.statusCode = statusCode;
	}
	
	public String getTipsMessage() {
		return tipsMessage;
	}

	public void setTipsMessage(String tipsMessage) {
		this.tipsMessage = tipsMessage;
	}

	public String getForwardUrl() {
		return forwardUrl;
	}

	public void setForwardUrl(String forwardUrl) {
		this.forwardUrl = forwardUrl;
	}
	public String getTargetType(){
		if (lookup != null && lookup.length()>0){
			return "dialog";
		}
		return "navTab";
	}
	
	private String ajaxForward(int statusCode, String message) {
		this.statusCode = statusCode;
		this.tipsMessage = message;
		return "ajaxDone";
	}
	protected String ajaxForwardSuccess(String message) {
		return ajaxForward(200, message);
	}
	protected String ajaxForwardError(String message) {
		return ajaxForward(300, message);
	}
	
	//SDF
	
	
	private String dataJson;
	
	
	/**
	 * 返回ajax数据是，附带的自定义数据
	 * @param dataJson
	 */
	public String getDataJson() {
		return dataJson==null||dataJson==""?"{}":dataJson;
	}
	
	/**
	 * 返回ajax数据是，附带的自定义数据
	 * @param dataJson
	 */
	public void setDataJson(String dataJson) {
		this.dataJson = dataJson;
	}

	/**
	 * 这是ajax返回的数据
	 * @param success	是否成功
	 * @param setTipsMessage 提示信息
	 * @param forwardUrl	跳转地址
	 * @param jsonData	附加数据(自动转为json字符)
	 */
	protected String setAjaxResult(boolean success,String setTipsMessage,String forwardUrl,Object jsonData)
	{
		return this.setAjaxResult(success, setTipsMessage, forwardUrl, jsonData,this.returnCommand());
	}
	
	protected String setAjaxResult(boolean success,String setTipsMessage,String forwardUrl)
	{
		return this.setAjaxResult(success, setTipsMessage, forwardUrl, null);
	}
	
	protected String setAjaxResult(boolean success,String setTipsMessage)
	{
		return this.setAjaxResult(success, setTipsMessage, "" , null);
	}
	
	protected String setAjaxResult(boolean success)
	{
		return this.setAjaxResult(success, "" , "" , null);
	}
	
	protected String setAjaxResult(boolean success,String setTipsMessage,String forwardUrl,Object jsonData,String successString)
	{
		this.setSuccess(success);
		this.setTipsMessage(setTipsMessage);
		this.setForwardUrl(forwardUrl);			
		String dataJson=new Gson().toJson(jsonData);
		this.setDataJson(dataJson==null||dataJson==""?"{}":dataJson);		
		return successString;
	}
	
	

}
