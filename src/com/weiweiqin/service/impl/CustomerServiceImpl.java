package com.weiweiqin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weiweiqin.constants.Constants;
import com.weiweiqin.dao.CustomerDao;
import com.weiweiqin.model.Customer;
import com.weiweiqin.model.CustomerAddr;
import com.weiweiqin.service.CustomerAddrService;
import com.weiweiqin.service.CustomerService;
import com.weiweiqin.utils.GenUniqueIDUtil;
import com.weiweiqin.vo.common.Page;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao customerDao;

	@Autowired
	private CustomerAddrService customerAddrService;

	public void update(Customer order) {
		customerDao.update(order);
	}

	public Customer get(int id) {
		return customerDao.get(id);
	}

	public List<Customer> pageList(Page page, Map<String, Object> conditions) {
		return customerDao.pageList(page, conditions);
	}

	public int totalCount(Map<String, Object> conditions) {
		return customerDao.totalCount(conditions);
	}

	public List<CustomerAddr> getCustomerAddrs(int customerId) {
		return customerAddrService.getByCustomerId(customerId);
	}

	/**
	 * 
	 亲爱的13666067037@163.com： 您距离成功注册只差一步了。请点击下面的按钮，完成注册。 完成注册
	 * 如果点击无效，请复制下方网页地址，到浏览器地址栏打开：
	 * https://passport.alipay.com/register/confirm.htm
	 * ?code=gb0AVK3Sa8Yww3tCNn7nDrMIKykOIVWg&random=8415324090745478&fromSite=6
	 * 此为系统邮件，请勿回复； ©阿里云 2009-2013 All Right Reserved
	 */
	@Transactional
	public void save(Customer customer, String href) {
		String genUUID = GenUniqueIDUtil.genUUID();
		String password = customer.getPassword();
		customer.setPassword(password);
		//默认激活，暂时去除激活注册步骤
		customer.setMark(Constants.Customer.MARK_ACTIVE);
		customer.setActiveCode(genUUID);
		customerDao.insert(customer);
//		SendMailUtil.send(
//				customer.getEmail(),
//				"【竹的家】账户激活通知",
//				"请将以下链接复制并在你的浏览器中打开完成激活操作：" + href + "?activeCode=" + genUUID
//						+ "&ub=" + GenUniqueIDUtil.genUUID()
//						+ System.currentTimeMillis());
	}

	public Customer getByActiveCode(String activeCode) {
		return customerDao.getByActiveCode(activeCode);
	}

	public void activeAccount(String activeCode) {
		Customer customer = getByActiveCode(activeCode);
		customer.setMark(Constants.Customer.MARK_ACTIVE);
		customerDao.update(customer);
	}

	public Customer getByUsername(String username) {
		return customerDao.getByUsername(username);
	}

	public void addCustomerAddr(CustomerAddr customerAddr) {
		customerAddrService.save(customerAddr);
	}

	public void updateCustomerAddr(CustomerAddr customerAddr) {
		customerAddrService.update(customerAddr);
	}

	@Transactional
	public void delCustomerAddr(int id,int customerId) {
		CustomerAddr customerAddr = customerAddrService.get(id);
		//如果删除的地址是默认地址，则随机选择一个已经存在的地址作为默认地址
		if(customerAddr.getDefaultAddr() == 0){
			List<CustomerAddr> customerAddrs = customerAddrService.getByCustomerId(customerId);
			if(null != customerAddrs && !customerAddrs.isEmpty()){
				CustomerAddr customerAddr2 = customerAddrs.get(0);
				customerAddr2.setDefaultAddr(0);
				customerAddrService.update(customerAddr2);
			}
		}
		customerAddrService.del(id);
	}

	@Transactional
	public void setDefaultAddr(int id, int customerId) {
		CustomerAddr customerAddr = customerAddrService.get(id);
		//取消原来的默认地址
		List<CustomerAddr> customerAddrs = customerAddrService.getByCustomerId(customerId);
		if(null != customerAddrs && !customerAddrs.isEmpty()){
			for (CustomerAddr customerAddr2 : customerAddrs) {
				if(customerAddr2.getDefaultAddr() == 0){
					customerAddr2.setDefaultAddr(1);
					customerAddrService.update(customerAddr2);
					break;
				}
			}
		}
		//设置为默认地址,0:默认，1：非默认
		customerAddr.setDefaultAddr(0);
		customerAddrService.update(customerAddr);
		
	}
}