package com.kh.khis.login_join_mypage;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

@Configuration
public class MemberConfiguration {
	@Bean
	public RestTemplate restTemplate() {
		RestTemplate restTemplate = new RestTemplate();
		DefaultUriBuilderFactory handler = (DefaultUriBuilderFactory) restTemplate.getUriTemplateHandler();
		handler.setEncodingMode(EncodingMode.VALUES_ONLY); // Prevent encode URL
		return restTemplate;
	}
}
