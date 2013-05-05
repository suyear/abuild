package org.hi.i18n.action.struts;

import java.util.List;

import org.hi.SpringContextHolder;
import org.hi.framework.paging.PageInfo;
import org.hi.framework.web.PageInfoUtil;
import org.hi.framework.web.struts.BaseAction;

import org.hi.i18n.action.LanguageCodePageInfo;
import org.hi.i18n.model.LanguageCode;
import org.hi.i18n.service.LanguageCodeManager;

public class LanguageCodeAction extends BaseAction{
    private LanguageCode languageCode;
    private LanguageCodePageInfo pageInfo;
    private List<LanguageCode> languageCodes;
    private String orderIndexs;
    
    
    /**
     * 新增/修改保存语言编码
     */
    public String saveLanguageCode() throws Exception {
        LanguageCodeManager languageCodeMgr = (LanguageCodeManager)SpringContextHolder.getBean(LanguageCode.class);
        if(super.perExecute(languageCode)!= null) return returnCommand();
        languageCodeMgr.saveLanguageCode(languageCode);
        super.postExecute(languageCode);
        return returnCommand();
    }
    
    
    /**
     * 删除语言编码
     */
    public String removeLanguageCode() throws Exception {
        LanguageCodeManager languageCodeMgr = (LanguageCodeManager)SpringContextHolder.getBean(LanguageCode.class);
        languageCodeMgr.removeLanguageCodeById(languageCode.getId());
        return returnCommand();
    }
    
    /**
     * 删除指定的某些语言编码
     */
    public String removeAllLanguageCode() throws Exception {
        LanguageCodeManager languageCodeMgr = (LanguageCodeManager)SpringContextHolder.getBean(LanguageCode.class);
        if (orderIndexs != null && orderIndexs.length()> 0 )
        {
            String[] ids= orderIndexs.split(",");
            for( int i=0; i<ids.length; i++)
            {
                if (ids[i].length()>0)
                {
                Integer languageCodeid = new Integer( ids[i] );
                languageCodeMgr.removeLanguageCodeById(languageCodeid);
                }
            }
        }
        
        return returnCommand();
    }
    
    /**
     *查看语言编码
     */
    public String viewLanguageCode() throws Exception {
        LanguageCodeManager languageCodeMgr = (LanguageCodeManager)SpringContextHolder.getBean(LanguageCode.class);
        languageCode = languageCodeMgr.getLanguageCodeById(languageCode.getId());
        return returnCommand();
    }
    
    /**
     * 语言编码列表
     */
    public String languageCodeList() throws Exception {
        LanguageCodeManager languageCodeMgr = (LanguageCodeManager)SpringContextHolder.getBean(LanguageCode.class);
        pageInfo = pageInfo == null ? new LanguageCodePageInfo() : pageInfo;
        PageInfo sarchPageInfo = PageInfoUtil.populate(pageInfo, this);
        
        languageCodes = languageCodeMgr.getLanguageCodeList(sarchPageInfo);
        
        return returnCommand(); 
    }
    
    
    
    
    public LanguageCode getLanguageCode() {
        return languageCode;
    }

    public void setLanguageCode(LanguageCode languageCode) {
        this.languageCode = languageCode;
    }
    
    public List<LanguageCode> getLanguageCodes() {
        return languageCodes;
    }

    public void setLanguageCodes(List<LanguageCode> languageCodes) {
        this.languageCodes = languageCodes;
    }

    public LanguageCodePageInfo getPageInfo() {
        return pageInfo;
    }

    public void setPageInfo(LanguageCodePageInfo pageInfo) {
        this.pageInfo = pageInfo;
    }   
    
    public String getOrderIndexs() {
        return orderIndexs;
    }

    public void setOrderIndexs(String orderIndexs) {
        this.orderIndexs = orderIndexs;
    }
    
}
