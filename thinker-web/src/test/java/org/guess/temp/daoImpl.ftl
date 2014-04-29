package ${packageName}.${moduleName}.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import ${packageName}.${moduleName}.dao.${ClassName}Dao;
import ${packageName}.${moduleName}.model.${ClassName};
import org.springframework.stereotype.Repository;

/**
 * ${functionName}Entity
 * @author ${classAuthor}
 * @version ${classVersion}
 */
@Repository
public class ${ClassName}DaoImpl extends HibernateDao<${ClassName},Long> implements ${ClassName}Dao {

}
