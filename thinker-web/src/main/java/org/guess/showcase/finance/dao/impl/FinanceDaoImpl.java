package org.guess.showcase.finance.dao.impl;

import org.guess.core.orm.hibernate.HibernateDao;
import org.guess.showcase.finance.dao.FinanceDao;
import org.guess.showcase.finance.model.Finance;
import org.springframework.stereotype.Repository;

@Repository
public class FinanceDaoImpl extends HibernateDao<Finance,Long> implements FinanceDao {

}
