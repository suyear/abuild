package org.hi.framework.dao.ibatis;

import java.beans.PropertyDescriptor;
import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hi.SpringContextHolder;
import org.hi.common.util.BeanUtil;
import org.hi.common.util.StringUtils;
import org.hi.framework.dao.DAO;
import org.hi.framework.dao.Filter;
import org.hi.framework.dao.HiDialect;
import org.hi.framework.dao.Sorter;
import org.hi.framework.dao.impl.FilterBean;
import org.hi.framework.dao.impl.FilterFactory;
import org.hi.framework.dao.impl.LikeFilter;
import org.hi.framework.model.BaseObject;
import org.hi.framework.paging.Page;
import org.hi.framework.paging.PageInfo;
import org.hi.metadata.hsc.HSC;
import org.hi.metadata.hsc.HSCHelper;
import org.hi.metadata.hsc.constant.FieldType;
import org.hi.metadata.hsc.context.service.Entity;
import org.hi.metadata.hsc.context.service.ExtendEntity;
import org.hi.metadata.hsc.context.service.Field;
import org.springframework.orm.ibatis.SqlMapClientCallback;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapExecutor;


/**
 * 
 * 本类是接口<code>DAO</code>多个实现类中的一个，是对Ibatis的DAO的实现。
 * <p> 本类继承Spring的<code>SqlMapClientDaoSupport</code>而后者是DAO实现的服务基类，它带有
 * 一个SessionFactory引用并且它提供一个<code>SqlMapClientTemplate</code>实例 
 * 对于<code>SqlMapClientTemplate</code>作用是：用于DAO中的数据访问，无缝地在后台处理Ibatis
 * Session.自动参与Spring驱动的和EJB驱动的事务。将可控式<code>IbatisException</code>转换成Spring提供
 * 的通用<code>DataAccessException</code>层次结构
 * <p>另外该类中的实现紧密的与平台*.hsc文件(即生成器的数据元文件)相结合,实体与实体间的主从关系、继承关系、lookup关系
 * 均取至*.hsc这些matedata文件，从而实现在增加或删除主表时子表的记录也会一并增加或删除,增、删子表记录时祖先表中的记录也会一并增、删除
 * @author 张昊
 * @author 尹福全
 * @since 2006-10-15
 * @see org.hi.framework.dao.DAO
 * @see org.springframework.orm.ibatis.support.SqlMapClientDaoSupport
 * @see org.springframework.orm.ibatis.SqlMapClientTemplate
 * @see org.springframework.orm.ibatis.SqlMapClientCallback
 */



public class BaseDAOIbatis extends SqlMapClientDaoSupport implements DAO {
	public static final String ID_PREFIX_GET = "get";
	public static final String ID_PREFIX_DEL = "del";
	public static final String ID_PREFIX_INS = "ins";
	public static final String ID_PREFIX_UPDATE = "update";
	public static final String ID_PREFIX_LIST = "list";
	public static final String ID_PREFIX_COUNT = "count";
	
	protected final Log log = LogFactory.getLog(getClass());
	
	/**
	 * ibatis的工厂
	 */
	private HiSqlMapClientFactoryBean sessionFactory; 
	
	/**
	 * @param sqlMapClient
	 */
	public void setSessionFactory(SqlMapClient sqlMapClient){
		setSqlMapClient(sqlMapClient);
		sessionFactory = (HiSqlMapClientFactoryBean)SpringContextHolder.getBean("&sessionFactory");
	}
	
	
	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjectById(java.lang.Class, java.io.Serializable)
	 */
	public Object getObjectById(Class clazz, Serializable id) {
		if(id == null || Integer.parseInt(id.toString()) < 0)
			return null;
		
		BaseObject bo = null;
		List<Entity> entitis = getSuperClassName(clazz, null, null);
		if(entitis.size() <=1){
			String name = ID_PREFIX_GET+clazz.getSimpleName();
			bo = (BaseObject)getSqlMapClientTemplate().queryForObject(name, id);
		}
		else{
			Filter filter = FilterFactory.getSimpleFilter("id", id, Filter.OPERATOR_EQ);
			List<Object> result = this.getObjects(clazz, filter);
			if(result.size() > 0)
				bo = (BaseObject)result.get(0);
		}
		
		if(bo != null) bo.setDirty(false);
		return bo;
	}

	
	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjectCount(java.lang.Class)
	 */
	public int getObjectCount(Class clazz) {
		return this.getObjectCount(clazz, null);
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjectCount(java.lang.Class, org.hi.framework.dao.Filter)
	 */
	public int getObjectCount(Class clazz, Filter filter) {
		return (Integer)getSqlMapClientTemplate().queryForObject(ID_PREFIX_GET+clazz.getSimpleName()+ID_PREFIX_COUNT,new Integer(1));
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjects(java.lang.Class)
	 */
	public List getObjects(Class clazz) {
		return this.getObjects(clazz,null,null);
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjects(java.lang.Class, org.hi.framework.dao.Filter)
	 */
	public List getObjects(Class clazz, Filter filter) {
		return this.getObjects(clazz, filter, null);
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjects(java.lang.Class, org.hi.framework.dao.Filter, org.hi.framework.dao.Sorter)
	 */
	public List getObjects(Class clazz, Filter filter, Sorter soter) {
		return this.getObjects(clazz, filter, soter, null);
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getObjects(java.lang.Class, org.hi.framework.dao.Filter, org.hi.framework.dao.Sorter, org.hi.framework.paging.Page)
	 */
	public List getObjects(final Class clazz,final Filter filter, final Sorter sorter, final Page page) {
		long startTime = System.currentTimeMillis(); 
		List result = getSqlMapClientTemplate().executeWithListResult(new SqlMapClientCallback(){
			 public Object doInSqlMapClient(SqlMapExecutor sqlExecutor)
             throws  SQLException {
                 return processFind(sqlExecutor, clazz, filter, sorter, page);
			 }
		});
		if(log.isTraceEnabled()){
			long endTime = System.currentTimeMillis();
			log.debug("Query  use:" + (endTime - startTime) + "ms");
		}
        return result;
	}
    List processFind(SqlMapExecutor sqlExecutor, Class clazz, Filter filter, Sorter sorter, Page page) throws SQLException{
    		Query[] querys = setupQuery(sqlExecutor, clazz, filter, sorter, page);
    		Query selectQuery = querys[0];//查询属性语句
    		Query countQuery = querys[1];//查询行数语句
    		if(sessionFactory.isSqlShow()){
    			System.out.println(selectQuery);
    			if(countQuery != null)
    				System.out.println(countQuery);
    		}
    		int skip =0;
    		int max = 0;
    		if(page != null && countQuery != null){
    			int count = 0;
    			String name = ID_PREFIX_COUNT+clazz.getSimpleName();
    			List countResult = (List) sqlExecutor.queryForList(name,countQuery);//查找行数
    			if(countResult != null && countResult.size() != 0){
    				if (countResult.size() > 1 ) 
    					count = countResult.size();
    				else{
    					Object result = countResult.get(0);
       					if (result instanceof Integer) 
    						count = ((Integer)result).intValue();
    					else if (result instanceof Long) 
    						count = ((Long) result).intValue();
    					else if(result instanceof BigDecimal)
    						count = ((BigDecimal) result).intValue();
    					else if(result instanceof BigInteger)
    						count = ((BigInteger) result).intValue();
    					else
    						count = ((Number) result).intValue();
    				}
    				
    				//如果真实记录数最大限记录数就取最大限记录数
    				count = page.getMaxRecords() != 0 && count > page.getMaxRecords() ? page.getMaxRecords() : count;
    					
    				page.setTotalRecords(count);		//设置查询结果的总记录数
    				
    				int totoalPage = 0;
    				totoalPage= count%page.getPageSize() > 0 ? count/page.getPageSize() + 1  : count/page.getPageSize();
    				page.setTotalPage(totoalPage);						//设置查询结果的总页数
    			}
    			
    			skip =page.getStartRowPosition(); 	//设置返回的第一条记录的位置
    			
    			if(page.getMaxRecords() != 0 && (page.getStartRowPosition() + page.getPageSize()) > page.getMaxRecords())
    				max =page.getMaxRecords() - page.getStartRowPosition();
    			else
    				max =page.getPageSize();			//设置返回的记录数
    		}
    		String name = ID_PREFIX_LIST+clazz.getSimpleName();
    		if(page == null)
    			return (List) sqlExecutor.queryForList(name,selectQuery);//首页调用
    		return (List) sqlExecutor.queryForList(name,selectQuery, skip, max);//不是首页调用
	}

    
    /**
     * 通过Filter和Sorter及表继承从而处理出表与表之前的关联关系
     * 将封装好的实体信息对象封装成map
     */
    private Map<String,DomainORInfo> getDomainInfo(Class clazz, Filter filter, Sorter sorter, List<Entity> entities){
    	Map<String ,DomainORInfo> result = new HashMap<String ,DomainORInfo>();		//用Map的目的是确保相应的属性信息只有一个
    	if(filter != null && filter.getConditions().size() > 0){//如果过滤器不为空
    		List<FilterBean> filterBeans1 = filter.getConditions();//获得所有过滤条件
        	for (int i = 0; i<filterBeans1.size(); i++) {
    			FilterBean filterBean = (FilterBean) filterBeans1.get(i);
    			if(!filterBean.getFieldName().contains("."))//如果属性名称中不包括"."  跳过
    				continue;

    			String[] domainProperty = filterBean.getFieldName().split("[.]");//用"."进行拆分属性名字
    			PropertyDescriptor domainPropertyDescriptor = null;
    			Entity domainEntity = null;
    			Class dominClazz = clazz;
    			for (int j = 0; j < domainProperty.length - 1 ; j++) {
    				try {
    					//
    					domainPropertyDescriptor = PropertyUtils.getPropertyDescriptor(BeanUtil.CreateObject(dominClazz.getName()), domainProperty[j]);
    					dominClazz = domainPropertyDescriptor.getPropertyType();//获得实体类型
    					domainEntity = HSCHelper.getEntity(sessionFactory.getServletContext().getRealPath(""), dominClazz);//获得domain matedata实体信息
    				} catch (Exception e) {continue;}

    				DomainORInfo domainInfo = new DomainORInfo();
    				domainInfo.setTableName(domainEntity.getTableName());//设置表名  
    				domainInfo.setPropertyName(domainProperty[j]);//设置属性名字
    				
    				if(j > 0)  //表示有多表级联，因为加.
    					domainInfo.setResourcePropertyName(domainProperty[j-1]);//表连接左半部分的别名
    				
    				//没有级联但有表继承，如果在本实体中找不到当前的属性，则在祖先实体中做匹配，并将表名赋给resourcePropertyName
    				if(entities.size() > 1 && j <= 0){
    					String fieldName = filterBean.getFieldName();
    					if(fieldName.contains("."))
    						fieldName = fieldName.substring(0, fieldName.indexOf("."));
    					entityLabel:for(int z=entities.size()-1; z>=0; z--){			//如果有继承要加继承表的
    						List<Field> allFields=entities.get(z).getField();
    						for (Field field : allFields) {
    							if(field.getFieldName().equals(fieldName)){
    								domainInfo.setResourcePropertyName(entities.get(z).getTableName());
    						        break entityLabel;
    							}
    						}
    					}
    				}	
    				result.put(domainProperty[j], domainInfo);
    	    	}
        	}
        }
    	
    	//循环对含有"."的属性名称进行拆分
    	if(sorter!=null && sorter.getSorts().size()>0){
    		Map<String,String> sorterMap = sorter.getSorts();
    		Set<String> keyValue = sorterMap.keySet();
    		for (String string : keyValue) {
				if(!string.contains("."))
					continue;
			String[] domainProperty = string.split("[.]");
			PropertyDescriptor domainPropertyDescriptor = null;
			Entity domainEntity;
			Class dominClazz = clazz;
			for (int i = 0; i < domainProperty.length - 1 ; i++) {//获得domin类属性对应的实体
				try {
					domainPropertyDescriptor = PropertyUtils.getPropertyDescriptor(BeanUtil.CreateObject(dominClazz.getName()), domainProperty[i]);
					dominClazz = domainPropertyDescriptor.getPropertyType();
					domainEntity = HSCHelper.getEntity(sessionFactory.getServletContext().getRealPath(""), dominClazz);
				} catch (Exception e) {continue;}
				//开始封装domainORInfo
				DomainORInfo domainInfo = new DomainORInfo();
				domainInfo.setTableName(domainEntity.getTableName());
				domainInfo.setPropertyName(domainProperty[i]);
				if(i > 0)
					domainInfo.setResourcePropertyName(domainProperty[i-1]);
				
				//没有级联但有表继承，如果在本实体中找不到当前的属性，则在祖先实体中做匹配，并将表名赋给resourcePropertyName
				if(entities.size() > 1 && i <= 0){
					String fieldName = string;
					if(fieldName.contains("."))
						fieldName = fieldName.substring(0, fieldName.indexOf("."));
					entityLabel:for(int z=entities.size()-1; z>=0; z--){			//如果有继承要加继承表的
						List<Field> allFields=entities.get(z).getField();
						for (Field field : allFields) {
							if(field.getFieldName().equals(fieldName)){
								domainInfo.setResourcePropertyName(entities.get(z).getTableName());
						        break entityLabel;
							}
						}
					}
				}				
				result.put(domainProperty[i], domainInfo);
	    		}
    		}
    	}
    	return result;
    }
    
    
    private Query[] setupQuery(SqlMapExecutor sqlExecutor, Class clazz, Filter filter, 
			Sorter sorter, Page page){
    	
		StringBuffer mainSb = new StringBuffer(); //主SQL语句（统计与查询共用）
		Query countSb = new Query(); //统计记录数的SQL语句
		Query selectSb = new Query(); //查询记录数的SQL语句
		String orderSt = "";	//排序的字符串
		
		Entity entity=null;
		try {
			
			entity = HSCHelper.getEntity(sessionFactory.getServletContext().getRealPath(""), clazz);//通过class获得实体类
		} catch (Exception e) {
			log.error("not found Entity Define by className:" + clazz.getName());
		}
		String tableName = entity.getTableName(); //获得实体的表名
		String	aliasName = filter == null || filter.getAliasName() == null ? tableName : filter.getAliasName();//设置别名
		
		List<Entity> entities = this.getSuperClassName(entity, null, null);//获得包括实体在内的所有祖先实体
		
		Map<String, DomainORInfo> domainInfos = this.getDomainInfo(clazz, filter, sorter, entities);
		
		selectSb.append("select ");
		for (int i = 0; i < entities.size(); i++) {			//如果有继承要加继承表的所有字段
			if(i > 0)
				selectSb.append(",");
			
			selectSb.append(entities.get(i).getTableName()).append(".* ");
		}
		
		countSb.append("select count(*) ");
	
		//加sql部分数据库表
		mainSb.append("from ");
		//加自己及继承表
		for (int i = 0; i < entities.size(); i++) {			//如果有继承要加继承表的
			if(i > 0)
				mainSb.append(",");
			mainSb.append(entities.get(i).getTableName()).append(" ").append(entities.get(i).getTableName()).append(" ");
		}
		
		//加domain的表
		for (Map.Entry<String, DomainORInfo> entry : domainInfos.entrySet()){
			DomainORInfo domainORInfo = entry.getValue();
			mainSb.append(",").append(domainORInfo.getTableName()).append(" ")//加表名
			.append(domainORInfo.getPropertyName()).append(" ");//加属性名
		}
		
		if(domainInfos.size() > 0 ||  entities.size() > 1)
			mainSb.append(" where ");
		
		//加sql部分数据库表连接
		String[] keySet = domainInfos.keySet().toArray(new String[domainInfos.keySet().size()]);
		int andSetp = 0; //在where后面加and的累加器
		for (int i = 0; i < keySet.length; i++) {
			if(andSetp > 0)
				mainSb.append(" and ");

			DomainORInfo domainORInfo = domainInfos.get(keySet[i]);			
			mainSb.append(domainORInfo.getResourcePropertyName() == null ? aliasName : domainORInfo.getResourcePropertyName()).append(".").append(domainORInfo.getPropertyName())
			.append("=").append(domainORInfo.getPropertyName()).append(".").append("id ");
			andSetp ++;
		}
		if(entities.size() > 1){
			for (int i = 0; i < entities.size() - 1; i++) {	
				if(andSetp > 0)
					mainSb.append(" and ");
				mainSb.append(tableName).append(".id = ")
				.append(entities.get(i).getTableName()).append(".id ");
				andSetp ++;
			}
		}
		
		
		/*SQL的过滤部分*/
		if(filter != null && filter.getConditions().size() > 0){
			if(andSetp == 0)
				mainSb.append(" where ");
			else
				mainSb.append(" and ");
			List<FilterBean> filterBeans = filter.getConditions();
			
			List<List<FilterBean>> filterGroup = filter.getFilterGroup();
			
			if(filterGroup.size() < 2) //如果filter组中只有它自己，没有通过addFilter方法连接的
				setupConditions(entities, mainSb, filterBeans, aliasName, null);
			else{
				for(int i = 0; i < filterGroup.size(); i++){
					List<FilterBean> filtergroup = filterGroup.get(i);
					setupConditions(entities, mainSb, filtergroup, aliasName, i);
					mainSb.append(") ");
				}
			}
		}			
		
		
		selectSb.append(mainSb);
		/*SQL的排序部分*/
		if(sorter != null && !sorter.getSorts().isEmpty()){
			orderSt = " order by "; 
			
			Map<String, String> sorts = sorter.getSorts();
			int _step = 0;
			for (Map.Entry<String, String> entry : sorts.entrySet()){
				String properyName = entry.getKey();
				if(!properyName.contains(".")){
					String _aliasName = aliasName;
					for (Entity _entity : entities) { //如果是实体继承
						try {
							Field field = HSCHelper.getField(SpringContextHolder.getServletContext().getRealPath(""), _entity, properyName);
							if(field != null && field.getFieldType() != FieldType.FIELD_TYPE_LOOKUP){
								_aliasName = _entity.getTableName();
								break;
							}
						} catch (Exception e) {}
						
					}
					properyName = _aliasName + "."  + properyName;
				}
				else{
					String[] domainProperty = properyName.split("[.]");
					properyName = domainProperty[domainProperty.length - 2] + "." + domainProperty[domainProperty.length - 1];
				}
				if(_step > 0)
					orderSt += ", ";

				orderSt += properyName + " " + entry.getValue();
				
				_step++;
			}

		}
		countSb.append(mainSb);
		
		/*为count加最大限记录数，提升大数据量的检索速度*/
		if(sessionFactory.getDialect() instanceof IbatisHiDialect) {
			IbatisHiDialect dialect = (IbatisHiDialect)sessionFactory.getDialect();
			dialect.getMaxRecode(countSb, filter, page);
		}
		
		Query selectQuery = selectSb.append(orderSt);
		
		/*向过滤条件的引用占位符中添加相应的值*/
		if(filter != null  && filter.getConditions().size() > 0){
			List<FilterBean> filterBeans = filter.getConditions();
			for (int i = 0; i< filterBeans.size(); i++) {
				FilterBean filterBean =  filterBeans.get(i);
				
				if(filterBean.getValue() == null)
					continue;
				
				String operater = filterBean.getOperater();
				
				/*如果是值的类型是字符串，并且操作符是like则在值的两端加百分号（%）*/
				if(operater.equals(Filter.OPERATOR_LIKE) && filterBean.getValue() instanceof String ){
					String val = (String)filterBean.getValue();
					//判断like的控制符
					if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_LEFT)
						val = "%" + val;
					else if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_RIGHT)
						val =  val + "%";
					else if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_ALL)
						val =  "%" + val + "%";	
					else
						val =  "%" + val + "%";
					
					filterBean.setValue(val);
				}
				
				setParameter(selectQuery, filterBean.getFieldName() + i,filterBean.getValue());  //为SQL的Query对象,设置引用占位符的值
				if(page != null)
					setParameter(countSb, filterBean.getFieldName() + i,filterBean.getValue());
				
			}
		}
		/*创建统计返回查询记录数与需要查询的Query实例*/
		Query countQuery = null;
		if (page != null) 
			countQuery = countSb;
		Query[] querySql = {selectQuery,countQuery};
		return querySql;
	}
   
    private void setupConditions(List<Entity> entities,StringBuffer mainSb, List<FilterBean> filterBeans, String aliasName, Integer groupIndex){
		/*为SQL条件部分设置引用占位符*/
		for (int i = 0; i<filterBeans.size(); i++) {
			FilterBean filterBean = (FilterBean) filterBeans.get(i);
			String operater = filterBean.getOperater();
			if(groupIndex !=null && groupIndex == 0 && i ==0)  //如果是第一个条件组,则在最前面加个括号 group主要就是为了添加括号用
				mainSb.append("( ");
			if(groupIndex !=null && groupIndex != 0 && i == 0)  //如果不是第一个条件组,则在关系符后面加括号
				mainSb.append(filterBean.getRelations()).append(" ( ");
			if(i > 0 )
				mainSb.append(" ").append(filterBean.getRelations()).append(" ");			//添加两个条件之间的关系符
			
			if(aliasName != null && !aliasName.trim().equals("")){
				
				//获取待级联的表的别名
				String tableName = aliasName;
				if(entities.size() > 1){
					String fieldName = filterBean.getFieldName();
					if(fieldName.contains("."))
						fieldName = fieldName.substring(0, fieldName.indexOf("."));
					entityLabel:for(int j=entities.size()-1;j>=0;j--){			//如果有继承要加继承表的
						List<Field> allFields=entities.get(j).getField();
						for (Field field : allFields) {
							if(field.getFieldName().equals(fieldName)){
								tableName = entities.get(j).getTableName();
						        break entityLabel;
							}
						}
					}
				}
				
				//对查询条件级联字段的处理
				if(!filterBean.getFieldName().contains(".")){
					mainSb.append(tableName + ".");
					mainSb.append(filterBean.getFieldName()).append(" ");
				}
				else{
					String[] fieldNames = filterBean.getFieldName().split("[.]");//拆分还有"."的属性名称
					mainSb.append(fieldNames[fieldNames.length - 2] + "." + fieldNames[fieldNames.length - 1]).append(" ");//留下属性的后两个a.b
				}
				
			}
			Object val = filterBean.getValue();
			if(val == null){
				if (operater.equals(Filter.OPERATOR_EQ))
					mainSb.append("IS NULL ");
				else
					mainSb.append("IS NOT NULL ");
				continue;
			}
			mainSb.append(operater).append(" "); 				//添加操作符
			
			if(filterBean.isNot())					
				mainSb.append("NOT ");							//添加NOT操作符
			
			/*如果是值的类型是字符串，并且操作符是like则在值的两端加百分号（%）*/
			if(operater.equals(Filter.OPERATOR_LIKE) && filterBean.getValue() instanceof String ){
				val = (String)filterBean.getValue();
				//判断like的控制符
				if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_LEFT)
					val = "%" + val;
				if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_RIGHT)
					val =  val + "%";
				if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_ALL)
					val =  "%" + val + "%";
				filterBean.setValue(val);
			}
			if(operater.equals(Filter.OPERATOR_IN)){		//	如果操作符是IN，则每一个值对应一个引用占位符
				mainSb.append("(");
				Collection coll = (Collection)filterBean.getValue();
				for(int j = 0; j < coll.size(); j++){
					if(j > 0)
						mainSb.append(",");
					mainSb.append("?");
					
				}
				mainSb.append(") ");
			}
			else{
				if(filterBean.getValue() instanceof BaseObject)
					mainSb.append(((BaseObject)filterBean.getValue()).getPrimarykey());
				else
		            mainSb.append("?");		
			}
		}
	}

	public List getObjects(Class clazz, PageInfo pageInfo) { 
		if(pageInfo == null)
			return new ArrayList();
		Filter filter = null;
		Sorter sorter = null;
		Page page = null;
		filter = pageInfo.getFilter();
		sorter = pageInfo.getSorter();
		page = pageInfo.getPage();
		return getObjects(clazz, filter, sorter, page);
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#getUniqueObject(java.lang.Class, org.hi.framework.dao.Filter)
	 */
	public Object getUniqueObject(Class clazz, Filter filter) {
		List list = getObjects(clazz, filter);
		if(list == null || list.size() <= 0)
			return null;
		return list.get(0);
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#removeObject(java.lang.Object)
	 */
	public void removeObject(Object obj) {
		if(obj == null)
			return;
		BaseObject baseObj = (BaseObject)obj;
		Serializable id = baseObj.getPrimarykey();
		this.removeSubObject(baseObj);//删除子表对象
		List<Entity> entitis = this.getSuperClassName(obj, null, null);//获得所有祖先
		for (Entity entity : entitis) //级联删除继承的祖先对象
			getSqlMapClientTemplate().delete(ID_PREFIX_DEL+entity.getEntityName(),id);
        
	}
	
	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#removeObjectById(java.lang.Class, java.io.Serializable)
	 */
	public void removeObjectById(Class clazz, Serializable id) {
		Object obj = this.getObjectById(clazz, id);
		removeObject(obj);
	}
	 /**
     * 删除孩子对象
     */
	protected void removeSubObject(BaseObject parentObj){
		PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(parentObj);
		for (int i = 0; i < propertyDescriptors.length; i++) {
			Class propertyClss = propertyDescriptors[i].getPropertyType();
			if(propertyClss == null) continue;
			if(!List.class.isAssignableFrom(propertyClss))
				continue;
			
			String propertyName = propertyDescriptors[i].getName();
			List<BaseObject> propertyValues = (List<BaseObject>)BeanUtil.getPropertyValue(parentObj, propertyName);
			if(propertyValues == null || propertyValues.size() <= 0)
				continue;
			
			for (BaseObject subObject : propertyValues) {
				removeObject(subObject);
			}
		}
	}

	/* (non-Javadoc)
	 * @see org.hi.framework.dao.DAO#saveObject(java.lang.Object)
	 */
	public void saveObject(Object obj) {
		
		Map<String, Object> map = this.objectToRow(obj);
		if(!(obj instanceof BaseObject)) return;
		BaseObject bo = (BaseObject)obj;
		
		if(!bo.isCascadeDirty()) return; //如果数据没有改变(包括明细)将不与数据库通信
		
		//获得当前POJO所有父类的名称（包括其本身）
		List<Entity> entites = getSuperClassName(bo, null, null);
		
		if(bo.getPrimarykey() == null){
			for (Entity entity : entites) {
				
				Object primarykey =getSqlMapClientTemplate().insert(ID_PREFIX_INS+entity.getEntityName(), map);
				if(primarykey != null){
					BeanUtil.setPropertyValue(bo, "id", Integer.parseInt(primarykey.toString()));
					bo.setVersion(new Integer(1)); //插入时缺省version为1
				}
			}
		}else{
			Serializable primaryKey = bo.getPrimarykey();
			BaseObject pObj = (BaseObject)this.getObjectById(obj.getClass(), primaryKey);
			if(pObj.getVersion()> bo.getVersion()){
				log.error("Object " + obj + "save database is dirty!");
				return;
			}
			for (Entity entity : entites) {
				getSqlMapClientTemplate().update(ID_PREFIX_UPDATE+entity.getEntityName(), map);
			}
		}
		
		this.saveSubObject(bo);	//保存明细
	}
	 /**
     * 获得包括当前类在内的所有祖先对象实体
     */
	
	private List<Entity> getSuperClassName(Object obj, List<Entity> entitis, Entity superEntity){
		if(entitis == null)
			entitis = new ArrayList<Entity>();
		
		String servletRootPath = sessionFactory.getServletContext().getRealPath("");
		Entity entity = null;
		try {
			if(obj != null){
				if(obj instanceof BaseObject)
					entity = HSCHelper.getEntity(servletRootPath, obj.getClass());//获得给定类型的实体
				if(obj instanceof Class)
					entity = HSCHelper.getEntity(servletRootPath, (Class)obj);
				if(obj instanceof Entity)
					entity = (Entity)obj;
			}
			else
				entity = superEntity;
			
			ExtendEntity extendEntity = entity.getExtendEntity();//获得继承的实体
			if(extendEntity != null  && extendEntity.getExtendEntityName() != null && !extendEntity.getExtendEntityName().trim().equals("")){
				//获得祖先实体的名字
				getSuperClassName(null, entitis, HSCHelper.getEntity(servletRootPath, extendEntity.getExtendEntityName(), extendEntity.getExtendServiceName()));
			}
		} catch (Exception e) {}
		
		if(entity != null)
			entitis.add(entity);
		
		return entitis;
	}
	/**
     * 将对象参数转换成map做参数
     */
	protected  Map<String, Object> objectToRow(Object obj) {
		Map<String, Object> rowMap= new HashMap<String, Object>();
		PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(obj);//获得对象的所有属性描述
		for (int i = 0; i < propertyDescriptors.length; i++) {
			if(propertyDescriptors[i].getWriteMethod() == null) // 如果没有set方法就说明没有属性与数据库字段对应，忽略
				continue;
			Class propertyClss = propertyDescriptors[i].getPropertyType();//获得属性的类型
			String propertyName = propertyDescriptors[i].getName();//获得属性的名字
			Object propertyValue = BeanUtil.getPropertyValue(obj, propertyName);//获得属性值
			if(propertyClss == null) continue;
			//如果不是baseObject子类 或者 集合类型 
			if(!BaseObject.class.isAssignableFrom(propertyClss) && !Collection.class.isAssignableFrom(propertyClss)){//如果不是类对象 并且不是数组
				
				 rowMap.put(propertyName, propertyValue);
				 continue;
			 }
			 //如果是baseObject类型 那么value值方对象的主键id
			 if(BaseObject.class.isAssignableFrom(propertyClss)){
				 
				 BaseObject baseObj = (BaseObject)propertyValue;
				 rowMap.put(propertyName, baseObj == null ? null : baseObj.getPrimarykey());
				 continue;
			 }
		}
		return rowMap;
	}

	 /**
     * 保存给定父表的所有子表对象
     */
	
	protected  void saveSubObject(BaseObject parentObj) {
		PropertyDescriptor[] propertyDescriptors = PropertyUtils.getPropertyDescriptors(parentObj);//获得所有父表属性
		for (int i = 0; i < propertyDescriptors.length; i++) {
			Class propertyClss = propertyDescriptors[i].getPropertyType();//获得属性的类型
			if(!List.class.isAssignableFrom(propertyClss))//如果不是list类型的活跳过
				continue;
			
			String propertyName = propertyDescriptors[i].getName();//获得属性的名称
			
			List _propertyValues = (List)BeanUtil.getPropertyValue(parentObj, propertyName);//获得list里所有值
			if(_propertyValues == null || _propertyValues.size() <= 0)
				continue;
			
			//如果集合中的元素不是BaseObject的
			Object element = _propertyValues.get(0);
			if(!(element instanceof BaseObject))
				continue;
			List<BaseObject> propertyValues = (List<BaseObject>)_propertyValues;
			
			//判断该主实体下是否有这个从实体
			Entity subEntity = null;
			try{
				if(HSC.getEntity(element.getClass()) == null)	//如果元素所对应的实体不存在就跳过
					continue;
				List<Entity> itemEntitys = HSC.getItemEntities(parentObj.getClass());
				for (Entity itemEntity : itemEntitys) {
					if(HSC.getEntityClass(itemEntity).equals(element.getClass())){
						subEntity = itemEntity;
						break;
					}
				}
			} catch (Exception e) {}
			if(subEntity == null)
				continue;
			
			
			for (BaseObject baseObject : propertyValues) {//获得list中的实体 循环保存
				List<Field> fields = subEntity.getField();//获得实体的所有属性
				for (Field field : fields) {
					if(!field.isIsParent()) continue;
					String _parentClassName = field.getLookupEntity().getLkEntityName();//获得祖先类名称
					if(!_parentClassName.equals(parentObj.getClass().getSimpleName()))
						continue;
					BeanUtil.setPropertyValue(baseObject, field.getFieldName(), parentObj);
				}
				this.saveObject(baseObject);
			}
		}
	}
	
	
	 /**
     * 将filter中的属性封装成java类 方便数据的传输
     */
	
	class DomainORInfo{
		/**
		 * where条件=右侧的表名
		 */
		String tableName;
		/**
		 * where条件=右侧属性名
		 */
		String propertyName;
		/**
		 * where条件=左侧的属性名
		 */
		String resourcePropertyName;
		public String getTableName() {
			return tableName;
		}
		public void setTableName(String tableName) {
			this.tableName = tableName;
		}
		public String getPropertyName() {
			return propertyName;
		}
		public void setPropertyName(String propertyName) {
			this.propertyName = propertyName;
		}
		public String getResourcePropertyName() {
			return resourcePropertyName;
		}
		public void setResourcePropertyName(String resourcePropertyName) {
			this.resourcePropertyName = resourcePropertyName;
		}
	}
	
      /**
       * 将给定的属性名与值赋到query中
       */
      private void setParameter(Query query,String parameterName, Object value) {
//      	判断value的类型是否是一个集合,IN操作符的值就是一个集合
    	  if(value instanceof Collection){
      		Collection values = (Collection)value;
      		int j = 0;
      		for (Iterator i = values.iterator(); i.hasNext();) {
  				Object val = (Object) i.next();
  				setParameterSingle(query,parameterName+j, val);
  				j++;
  			}
      	}
      	else{
      		 setParameterSingle(query, parameterName, value);
      	}
      }
      
      private void setParameterSingle(Query query,String parameterName, Object value) {
          if (value instanceof Boolean) {
        	  query.putParameter(parameterName, ((Boolean) value).booleanValue());
          } else if (value instanceof Byte) {
          	 query.putParameter(parameterName, ((Byte) value).byteValue());
          } else if (value instanceof Character) {
          	 query.putParameter(parameterName, ((Character) value).charValue());
          } else if (value instanceof Double) {
          	 query.putParameter(parameterName, ((Double) value).doubleValue());
          } else if (value instanceof Float) {
          	 query.putParameter(parameterName, ((Float) value).floatValue());
          } else if (value instanceof Integer) {
          	 query.putParameter(parameterName, ((Integer) value).intValue());
          } else if (value instanceof Long) {
          	 query.putParameter(parameterName, ((Long) value).longValue());
          } else if (value instanceof Short) {
          	 query.putParameter(parameterName, ((Short) value).shortValue());
          } else if (value instanceof String) {
          	 query.putParameter(parameterName, (String) value);
          } else if (value instanceof byte[]) {
          	 query.putParameter(parameterName, (byte[]) value);
          } else if (value instanceof BigDecimal) {
          	 query.putParameter(parameterName, (BigDecimal) value);
          } else if (value instanceof BigInteger) {
          	 query.putParameter(parameterName, (BigInteger) value);
          } else if (value instanceof Date) {
          	 query.putParameter(parameterName, (Date) value);
          } else if (value instanceof Time) {
          	 query.putParameter(parameterName, (Time) value);
          } else if (value instanceof Timestamp) {
          	 query.putParameter(parameterName, (Timestamp) value);
          } else if (value instanceof java.util.Date) {
          	 query.putParameter(parameterName, (java.util.Date) value);
          } else if (value instanceof Locale) {
          	 query.putParameter(parameterName, (Locale) value);
          } else {
          	 query.putParameter(parameterName, value);
          }
      }
      
      /**
       * 根据给定的SQL语句从数据库中返回与SQL相一致的结果集
       * <p>例如:select hiuser.* from HiUser hiuser, HiOrg org where org.id = hiuser.id and org.id = 2
       * 通过例子可出看到人员与部门虽然已经设定关系,而且也加入了部门的过滤条件,但对于SQL来说它只返回所有HiUser的信息
       * @param sql SQL语句,注意该SQL必须有select中有且只有一个实体的结果集列表
       * @return 返回指定类型对象的<code>List</code>集合
  	 * @see #getSQLObjects(String, String, Class)
  	 */  
      
    protected List<Object> getSQLObjects(String sql){
      	return this.getSQLObjects(sql, null, null, null, null, null);
    }
    
    /**
     * 根据给定的SQL语句从数据库中返回与SQL相一致的结果集,并且如果page不为null，则根据page的
 	 * 当前要返回记录数返回指定长度的集合。
      * <p>例如:select hiuser.* from HiUser hiuser, HiOrg org where org.id = hiuser.id and org.id = 2
      * 通过例子可出看到人员与部门虽然已经设定关系,而且也加入了部门的过滤条件,但对于SQL来说它只返回所有HiUser的信息,
      * @param SQL  SQL语句,注意该SQL必须有select中有且只有一个实体的结果集列表
      * @param page 待查询的页面信息，该参数在本方法内的作用主要是控制返回集合的长度与返回记录的启止位置
      * @return 回指定类型对象的<code>List</code>集合
      * @see #getSQLObjects(String, String, Class,Page)
      */
    
    protected List<Object> getSQLObjects(String sql, Page page){
      	return this.getSQLObjects(sql, null, null, null, null, page);
    }
    
    /**
	 * 根据给定的SQL语句及属性名列表从数据库中返回指定类型结果集
	 * <p>目的：通过SQL将查询结果封装为指定的对象集合，封装的规则为查询结果集与给定的属性名顺序一一按对应
	 * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
	 * @param propertyNames 属性名列表的字符串,以逗号分隔.对于对象树属性名可以通过.(点号)逐级设置。
	 * 注意：属性名的关系与给定类型的属性相一致
	 * @param clazz 待封装的类型
	 * @return 返回指定类型对象的<code>List</code>集合
	 * @see #getSQLObjects(String, String, Class, Filter, Sorter, Page)
	 */   
    
    protected List<Object> getSQLObjects(String sql, String propertyNames, Class clazz){
      	return this.getSQLObjects(sql, propertyNames, clazz, null, null);
    }
    
    /**
	 * 根据给定的SQL语句及属性名列表从数据库中返回指定类型结果集,并且如果page不为null，则根据page的
 	 * 当前要返回记录数返回指定长度的集合。
	 * <p>目的：通过SQL将查询结果封装为指定的对象集合，封装的规则为查询结果集与给定的属性名顺序一一按对应
     * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
     * @param propertyNames 属性名列表的字符串,以逗号分隔.对于对象树属性名可以通过.(点号)逐级设置。
	 * 注意：属性名的关系与给定类型的属性相一致
	 * @param clazz 待封装的类型
     * @param page 待查询的页面信息，该参数在本方法内的作用主要是控制返回集合的长度与返回记录的启止位置
     * @return 返回指定类型对象的<code>List</code>集合
     */
    
    protected List<Object> getSQLObjects(String sql, String propertyNames, Class clazz, Page page){
      	return this.getSQLObjects(sql, propertyNames, clazz, null, null, page);
    }
    
    /**
	 * 根据给定的SQL语句及过滤器从数据库中返回与SQL相一致的结果集
     * <p>例如:select hiuser.* from HiUser hiuser, HiOrg org where org.id = hiuser.org.id and org.id = 2
     * 通过例子可出看到人员与部门虽然已经设定关系,而且也加入了部门的过滤条件,但对于SQL来说它只返回所有HiUser的信息,
     * 也就是说它只返回一个实体类型
     * <p>注意:<code>getSQLObjects(String, filer)</code>方法与<code>getSQLObjects(String, String, Class)</code>
     * 的主要区别在于,<code>getSQLObjects(String)</code>方法的SQL语句仅返回单一的实体类型,而且后者则是返回
     * 多个实体类型的属性再根据给定的Class封装出来与该Class类型一致的POJO对象集合
     * @param SQL SQL语句,注意该SQL必须有select中有且只有一个实体的结果集列表
	 * @param filter 待查询的过滤器
     * @return 返回SQL类型类型相一致的对象<code>List</code>集合
     * @see #getSQLObjects(String, String, Class, Filter)
     */
    
    protected List<Object> getSQLObjects(String sql, Filter filter){
      	return getSQLObjects(sql, null, null, filter, null);
    }
    
	/**
	 * 根据给定的SQL语句及属性名列表及过滤器从数据库中返回指定类型结果集
	 * <p>目的：通过SQL将查询结果封装为指定的对象集合，封装的规则为查询结果集与给定的属性名顺序一一按对应
	 * 
	 * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
	 * @param propertyNames 属性名列表的字符串,以逗号分隔.对于对象树属性名可以通过.(点号)逐级设置。
	 * 注意：属性名的关系与给定类型的属性相一致
	 * @param clazz 待封装的类型
	 * @param filter 待查询的过滤器
	 * @return 返回指定类型对象的<code>List</code>集合
	 * @see org.hi.framework.dao.Filter
	 * @see #getSQLObjects(String, String, Class, Filter, Sorter, Page)
	 */ 
    
    protected List<Object> getSQLObjects(String sql, String propertyNames, Class clazz, Filter filter){
      	return getSQLObjects(sql, propertyNames, clazz, filter, null);
    }
    
    /**
	 * 根据给定的SQL语句及过滤器与批序器从数据库中返回与SQL相一致的结果集
     * <p>例如:select hiuser.* from HiUser hiuser, HiOrg org where org.id = hiuser.org.id and org.id = 2
     * 通过例子可出看到人员与部门虽然已经设定关系,而且也加入了部门的过滤条件,但对于SQL来说它只返回所有HiUser的信息,
     * 也就是说它只返回一个实体类型
     * <p>注意:<code>getSQLObjects(String, filer)</code>方法与<code>getSQLObjects(String, String, Class)</code>
     * 的主要区别在于,<code>getSQLObjects(String)</code>方法的SQL语句仅返回单一的实体类型,而且后者则是返回
     * 多个实体类型的属性再根据给定的Class封装出来与该Class类型一致的POJO对象集合
     * @param SQL SQL语句,注意该SQL必须有select中有且只有一个实体的结果集列表
	 * @param filter 待查询的过滤器
	 * @param soter 待查询的排序器
     * @return 返回SQL类型类型相一致的对象<code>List</code>集合
     * @see #getSQLObjects(String, String, Class, Filter, Sorter)
     */ 
    
    protected List<Object> getSQLObjects(String sql, Filter filter, Sorter sorter){
      	return getSQLObjects(sql, null, null, filter, sorter, null);
    }   
  	
	/**
	 * 根据给定的SQL语句及属性名列表及过滤器与批序器从数据库中返回指定类型结果集
	 * <p>目的：通过SQL将查询结果封装为指定的对象集合，封装的规则为查询结果集与给定的属性名顺序一一按对应
	 * 
	 * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
	 * @param propertyNames 属性名列表的字符串,以逗号分隔.对于对象树属性名可以通过.(点号)逐级设置。
	 * 注意：属性名的关系与给定类型的属性相一致
	 * @param clazz 待封装的类型
	 * @param filter 待查询的过滤器
	 * @param soter 待查询的排序器
	 * @return 返回指定类型对象的<code>List</code>集合
	 * @see org.hi.framework.dao.Filter
	 * @see org.hi.framework.dao.Sorter
	 * @see #getSQLObjects(String, String, Class, Filter, Sorter, Page)
	 */
    
    protected List<Object> getSQLObjects(String sql, String propertyNames, Class clazz, Filter filter, Sorter sorter){
    	return getSQLObjects(sql, propertyNames, clazz, filter, sorter, null);
    }
    
	/**
	 * 根据给定的SQL语句及属性名列表及过滤器与批序器从数据库中返回指定对应的结果,并且如果page不为null，则根据page的
	 * 当前要返回记录数返回指定长度的集合。<p>如根据过滤器满足条件的有50条记录，每页10条，当前要查询
	 * 的是第三页，那么返回的<code>List</code>集合只有10条记录且是满足条件的前第21条到第30条记录
	 * <p>注意：带有page的参数只能在前端显示列表页面中使用，不推荐将该方法用于业务逻辑层上，因为这样
	 * 有可能会损失部分满足条件的数据。对于海量数据的查询最好不要用ORM这些框架性项目，推荐最传统的JDBC与
	 * 存储过程相结合的方式实现，在效率上要比使用中间层的框快很多
	 * 
	 * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
	 * @param propertyNames 属性名列表的字符串,以逗号分隔.对于对象树属性名可以通过.(点号)逐级设置。
	 * 注意：属性名的关系与给定类型的属性相一致
	 * @param clazz 待封装的类型
	 * @param filter 待查询的过滤器
	 * @param soter 待查询的排序器
	 * @param page 待查询的页面信息，该参数在本方法内的作用主要是控制返回集合的长度与返回记录的启止位置
	 * @return 返回指定类型对象的<code>List</code>集合
	 * @see org.hi.framework.dao.Filter
	 * @see org.hi.framework.dao.Sorter
	 * @ses org.hi.framework.paging.Page
	 */
    protected List<Object> getSQLObjects(final String sql, String propertyNames, Class clazz,final Filter filter,final Sorter sorter,final Page page){
  		
  		List result = new ArrayList();
    	if(sql == null || sql.trim().equals(""))
    		return result;
    	
    	long startTime = System.currentTimeMillis(); 
    	List sqlResult;
    	SqlMapClientTemplate sm =  getSqlMapClientTemplate();
		SqlMapClient sqlMapper = sm.getSqlMapClient();
		sqlResult = sm.executeWithListResult(new SqlMapClientCallback(){
			 public Object doInSqlMapClient(SqlMapExecutor sqlExecutor)
	            throws  SQLException {
					return processFind(sqlExecutor, sql, filter, sorter, page);
				}
		});
		
		if(log.isDebugEnabled()){
			long endTime = System.currentTimeMillis();
			log.debug("Query  use:" + (endTime - startTime) + "ms");
		}
		
        if( clazz == null)
        	return sqlResult;
        
        //将sql返回的结果集封装为对象集合
        String[] propertyNamesArray;
        for (Iterator iter = sqlResult.iterator(); iter.hasNext();) {
        	Object bean = null;
			bean = BeanUtil.CreateObject(clazz.getName());
			
			Map<String, Object> resultRow = (Map<String, Object>)iter.next();
			
			if(propertyNames == null){
				for (Map.Entry<String, Object> entry : resultRow.entrySet())
					BeanUtil.ognlPropertyValue(bean, entry.getKey(),entry.getValue());		//通过OGNL对树型对象深层赋值
		    }
			else{
				propertyNamesArray = StringUtils.strToStrArray(propertyNames);
				int _step = 0;
				for (Map.Entry<String, Object> entry : resultRow.entrySet()){
					BeanUtil.ognlPropertyValue(bean, propertyNamesArray[_step], entry.getValue());		//通过OGNL对树型对象深层赋值
					_step++;
				}
			}
			result.add(bean);
        }
    	return result;
  	}
  	
  	List<Object> processFind(SqlMapExecutor sqlExecutor, String sql, Filter filter, Sorter sorter, Page page) throws SQLException{
		Query[] querys = setupQuery(sqlExecutor, sql, filter, sorter, page);
		Query selectQuery = querys[0];
		Query countQuery = querys[1];
		if(sessionFactory.isSqlShow()){
			System.out.println(selectQuery);
			if(countQuery != null)
				System.out.println(countQuery);
		}
		int skip =0;
		int max = 0;
		if(page != null && countQuery != null){
			int count = 0;
			String name = "countCommon";
			List countResult = (List) sqlExecutor.queryForList(name,countQuery);
			if(countResult != null && countResult.size() != 0){
				if (countResult.size() > 1 ) 
					count = countResult.size();
				else{
					Object result = countResult.get(0);
   					if (result instanceof Integer) 
						count = ((Integer)result).intValue();
					else if (result instanceof Long) 
						count = ((Long) result).intValue();
					else if(result instanceof BigDecimal)
						count = ((BigDecimal) result).intValue();
					else if(result instanceof BigInteger)
						count = ((BigInteger) result).intValue();
					else
						count = ((Number) result).intValue();
				}
				
				//如果真实记录数最大限记录数就取最大限记录数
				count = page.getMaxRecords() != 0 && count > page.getMaxRecords() ? page.getMaxRecords() : count;
					
				page.setTotalRecords(count);		//设置查询结果的总记录数
				
				int totoalPage = 0;
				totoalPage= count%page.getPageSize() > 0 ? count/page.getPageSize() + 1  : count/page.getPageSize();
				page.setTotalPage(totoalPage);						//设置查询结果的总页数
			}
			
			skip =page.getStartRowPosition(); 	//设置返回的第一条记录的位置
			
			if(page.getMaxRecords() != 0 && (page.getStartRowPosition() + page.getPageSize()) > page.getMaxRecords())
				max =page.getMaxRecords() - page.getStartRowPosition();
			else
				max =page.getPageSize();			//设置返回的记录数
		}
		String name = "listCommon";
		if(page == null)
			return (List) sqlExecutor.queryForList(name,selectQuery);
		return (List) sqlExecutor.queryForList(name,selectQuery, skip, max);
	}
  	
    private Query[] setupQuery(SqlMapExecutor sqlExecutor, String sql, Filter filter, Sorter sorter, Page page){
		Query selectSb = new Query(); //主SQL语句
		Query countSb = new Query(); //统计记录数的SQL语句
		String orderSt = "";	//排序的字符串
		
		selectSb.append(sql);
		
		countSb.append("select count(*) ");
		if(!StringUtils.trimLeft(sql).startsWith("from"))
			countSb.append("from ");
		
		/*SQL的过滤部分*/
		if(filter != null && filter.getConditions().size() > 0){
			
			if(StringUtils.isInclude(sql, "where"))
				selectSb.append(" and ");
			else
				selectSb.append(" where ");
			
			List<FilterBean> filterBeans = filter.getConditions();
			
			List<List<FilterBean>> filterGroup = filter.getFilterGroup();
			
			String aliasName = null;
			if(filter.getAliasName() != null && !filter.getAliasName().trim().equals(""))
				aliasName = filter.getAliasName();
			
			if(filterGroup.size() < 2) //如果filter组中只有它自己，没有通过addFilter方法连接的
				setupConditions(selectSb, filterBeans, aliasName, null);
			else{
				for(int i = 0; i < filterGroup.size(); i++){
					List<FilterBean> filtergroup = filterGroup.get(i);
					setupConditions(selectSb, filtergroup, aliasName, i);
					selectSb.append(") ");
				}
			}

		}
		
		/*SQL的排序部分*/
		if(sorter != null && !sorter.getSorts().isEmpty()){
			orderSt = " order by "; 
			
			if(filter != null && filter.getAliasName() != null)
				orderSt+=filter.getAliasName() + "." ;
			
			orderSt+=sorter.toString();
		}
		
		
		/*创建统计返回查询记录数与需要查询的Query实例*/
		if (page != null) {
			String selectString = selectSb.toString();
			if(!StringUtils.trimLeft(sql).startsWith("from"))
				countSb = countSb.append(selectString.substring(selectString.indexOf("from") + 4));
		}
		selectSb.append(orderSt);
		
		/*向过滤条件的引用占位符中添加相应的值*/
		if(filter != null  && filter.getConditions().size() > 0){
			List<FilterBean> filterBeans = filter.getConditions();
			for (Iterator i = filterBeans.iterator(); i.hasNext();) {
				FilterBean filterBean = (FilterBean) i.next();
				String operater = filterBean.getOperater();
				
				/*如果是值的类型是字符串，并且操作符是like则在值的两端加百分号（%）*/
				if(operater.equals(Filter.OPERATOR_LIKE) && filterBean.getValue() instanceof String ){
					String val = (String)filterBean.getValue();
					//判断like的控制符
					if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_LEFT)
						val = "%" + val;
					else if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_RIGHT)
						val =  val + "%";
					else if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_ALL)
						val =  "%" + val + "%";	
					else
						val =  "%" + val + "%";
					
					filterBean.setValue(val);
				}
				
				setParameter(selectSb, filterBean.getFieldName(), filterBean.getValue());  //为SQL的Query对象,设置引用占位符的值
				if(page != null)
					setParameter(countSb,filterBean.getFieldName(), filterBean.getValue());
			}
		}
		
		Query[] querys = {selectSb, countSb};
		return querys;
	}
    
    private void setupConditions(Query mainSb, List<FilterBean> filterBeans, String aliasName, Integer groupIndex){
		/*为SQL条件部分设置引用占位符*/
		for (int i = 0; i<filterBeans.size(); i++) {
			FilterBean filterBean = (FilterBean) filterBeans.get(i);
			String operater = filterBean.getOperater();
			if(groupIndex !=null && groupIndex == 0 && i ==0)  //如果是第一个条件组,则在最前面加个括号
				mainSb.append("( ");
			
			if(groupIndex !=null && groupIndex != 0 && i == 0)  //如果不是第一个条件组,则在关系符后面加括号
				mainSb.append(filterBean.getRelations()).append(" ( ");
			
			if(i > 0 )
				mainSb.append(" ").append(filterBean.getRelations()).append(" ");			//添加两个条件之间的关系符
			
			if(aliasName != null && !aliasName.trim().equals(""))
				mainSb.append(aliasName + ".");

			mainSb.append(filterBean.getFieldName()).append(" ");				//添加查询的字段名
			
			Object val = filterBean.getValue();
			if(val == null){
				if (operater.equals(Filter.OPERATOR_EQ))
					mainSb.append("IS NULL ");
				else
					mainSb.append("IS NOT NULL ");
				continue;
			}
			
			mainSb.append(operater).append(" "); 				//添加操作符

			if(filterBean.isNot())					
				mainSb.append("NOT ");							//添加NOT操作符
			
			/*如果是值的类型是字符串，并且操作符是like则在值的两端加百分号（%）*/
			if(operater.equals(Filter.OPERATOR_LIKE) && filterBean.getValue() instanceof String ){
				val = (String)filterBean.getValue();
				//判断like的控制符
				if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_LEFT)
					val = "%" + val;
				if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_RIGHT)
					val =  val + "%";
				if(filterBean.getLikeControler() == LikeFilter.LIKE_CONTROLER_ALL)
					val =  "%" + val + "%";
				filterBean.setValue(val);
			}			
			if(operater.equals(Filter.OPERATOR_IN)){		//	如果操作符是IN，则每一个值对应一个引用占位符
				mainSb.append("(");
				Collection coll = (Collection)filterBean.getValue();
				for(int j = 0; j < coll.size(); j++){
					if(j > 0)
						mainSb.append(",");
					mainSb.append("?");
				}
				mainSb.append(") ");
			}
			else
				mainSb.append("? ");								//以坐标位置作为引用占位符
			
		}
	}
	

	/**
	 * 根据给定的SQL语句从数据库中返回与SQL相一致的结果集
	 * <p>参数page与pageInfo的区别在于pageInfo是对filter/sorter/page的又一层封装
	 * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
	 * @param clazz 待封装的类型
	 * @param pageInfo 待查询的页面信息
     * @return 返回指定类型对象的<code>List</code>集合
     * @see org.hi.framework.paging.PageInfo
	 * @see org.hi.framework.dao.Filter
	 * @see org.hi.framework.dao.Sorter
	 * @ses org.hi.framework.paging.Page
	 * @see #getObjects(Class, PageInfo)
	 * @see #getSQLObjects(String, String, Class, PageInfo)
	 */	
	protected List getSQLObjects(String sql, PageInfo pageInfo){
		return getSQLObjects(sql, null, null, pageInfo);
	}
	
	/**
	 * 根据给定的SQL语句及属性名列表从数据库中返回指定类型结果集，其基本的操作原理与<code>getObjects(clazz, page)</code>
	 * 基本相同
	 * <p>参数page与pageInfo的区别在于pageInfo是对filter/sorter/page的又一层封装
	 * @param SQL SQL语句,注意该SQL必须有select中要查询的结果集列表
	 * @param propertyNames 属性名列表的字符串,以逗号分隔.对于对象树属性名可以通过.(点号)逐级设置。
	 * 注意：属性名的关系与给定类型的属性相一致
	 * @param clazz 待封装的类型
	 * @param pageInfo 待查询的页面信息
	 * @return 返回指定类型对象的<code>List</code>集合
	 * @see org.hi.framework.paging.PageInfo
	 * @see org.hi.framework.dao.Filter
	 * @see org.hi.framework.dao.Sorter
	 * @ses org.hi.framework.paging.Page
	 * @see #getObjects(Class, PageInfo)
	 */	
	protected List getSQLObjects(String sql, String propertyNames, Class clazz, PageInfo pageInfo){
		if(pageInfo == null)
			return new ArrayList();
		
		Filter filter = null;
		Sorter sorter = null;
		Page page = null;
		filter = pageInfo.getFilter();
		sorter = pageInfo.getSorter();
		page = pageInfo.getPage();
		return getSQLObjects(sql, propertyNames, clazz, filter, sorter, page);
    }


	public HiDialect getDialect() {
		if(sessionFactory.getDialect() instanceof IbatisHiDialect) {
			return (IbatisHiDialect)sessionFactory.getDialect();
		}
		return null;
	}
}
