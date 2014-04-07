package org.guess.showcase.finance.service.impl;

import org.guess.core.service.BaseServiceImpl;
import org.guess.showcase.finance.dao.FinanceDao;
import org.guess.showcase.finance.model.Finance;
import org.guess.showcase.finance.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FinanceServiceImpl extends BaseServiceImpl<Finance, Long, FinanceDao> implements FinanceService {

	@Autowired
	public FinanceDao FinanceDao;

}