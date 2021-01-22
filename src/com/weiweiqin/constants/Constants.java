package com.weiweiqin.constants;

/**
 * 常量
 * 
 * @author weiweiqin
 * 
 */
public interface Constants {
	
	interface Order{
		
		/**
		 * 货到付款交易
		 */
		int PAY_HUODAOFUKUAN = 0;
		
		/**
		 * 支付宝交易
		 */
		int PAY_ZHIFUBAO = 1;
	}
	
	interface Customer{
		/**
		 * 未激活
		 */
		int MARK_INACTIVE = 0;
		
		/**
		 * 删除
		 */
		int MARK_DEL = -1;
		
		/**
		 * 激活
		 */
		int MARK_ACTIVE = 1;
		
	}
	interface GoodsInfo{
		/**
		 * 最新案例
		 */
		int GRADE_NEW = 1;
		/**
		 * 经典案例
		 */
		int GRADE_CLASSIC = 2;
		/**
		 * 最受欢迎案例
		 */
		int GRADE_MORE_WELCOME = 3;
		
		/**
		 * 常用案例
		 */
		int GRADE_COMMON = 4;
	}

	/**
	 * 文件上传信息
	 * 
	 * @author weiweiqin
	 * 
	 */
	interface FileInfo {
		/**
		 * 用户头像
		 */
		String FILE_PATH = "pic";
		/**
		 * 用户头像压缩图
		 */
		String COMPRESS_FILE_PATH = "compressPic";
	}

}
