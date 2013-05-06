package cn.abuild.category.dao;

import java.util.List;

import org.hi.framework.dao.DAO;

import cn.abuild.category.model.Category;


public interface CategoryDAO extends DAO {
	/**
	  * 
	  * @param member
	  * @return
	  */
	public boolean updateCategroy(Category categroy);
	/**
	 * 
	 * @param pageInfo
	 * @return
	 */
	public List<Category> getCategoryAll();
	/**
	 * 恢复默认密码
	 * @param member
	 * @return
	 */
	public boolean returnDefaultPwd(Category categroy);
}
