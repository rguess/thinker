package ${packageName}.${moduleName}.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import ${packageName}.${moduleName}.dao.${ClassName}Dao;
import ${packageName}.${moduleName}.model.${ClassName};
import org.springframework.stereotype.Repository;

/**
* 
* @ClassName: ${ClassName}
* @Description: ${ClassName}daoImpl
* @author renzp
* @date 2014-8-5 下午02:04:46
*
*/
@Repository
public class ${ClassName}DaoImpl extends HibernateDao<${ClassName},Long> implements ${ClassName}Dao {

}
