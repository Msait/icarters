package com.icarters.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.thymeleaf.extras.springsecurity4.dialect.SpringSecurityDialect;

/**
 * Created by Kostiantyn Bondar.
 */
@Configuration
public class ThymeleafTemplateConfiguration {

    @Bean
    public SpringSecurityDialect conditionalCommentDialect() {
        return new SpringSecurityDialect();
    }
}
