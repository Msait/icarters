package com.icarters.config;

import org.flywaydb.core.Flyway;
import org.springframework.boot.autoconfigure.flyway.FlywayMigrationStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Created by Kostiantyn Bondar.
 */
@Configuration
public class FlyWayMigrationConfig {

    @Bean
    public FlywayMigrationStrategy cleanMigrationStrategy() {
        return new FlywayMigrationStrategy() {
            @Override
            public void migrate(Flyway flyway) {
                flyway.clean();
                flyway.migrate();
            }
        };
    }

}
