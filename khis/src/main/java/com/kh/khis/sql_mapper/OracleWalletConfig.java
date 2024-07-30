package com.kh.khis.sql_mapper;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import java.io.IOException;
import java.nio.file.Paths;

@Configuration
public class OracleWalletConfig {

	private static final Logger logger = LoggerFactory.getLogger(OracleWalletConfig.class);

    @Value("${datasource.url}")
    private String jdbcUrl;

    @PostConstruct
    public void setTnsAdmin() {
    	try {
    		// Oracle Wallet 경로 설정
	    	Resource resource = new ClassPathResource("mapper/sql_mapper/Wallet_khFinalProejct2");
	        String walletPath = resource.getFile().getAbsolutePath();
	        System.setProperty("oracle.net.tns_admin", walletPath);
	        
	        // JDBC URL에 TNS_ADMIN 경로 추가
	        jdbcUrl = jdbcUrl + "?TNS_ADMIN=" + walletPath;
	        System.setProperty("spring.datasource.url", jdbcUrl);

    	}catch (IOException e) {
            logger.error("지갑 파일을 읽는 데 오류가 발생했습니다.", e);
    	}
    }
}