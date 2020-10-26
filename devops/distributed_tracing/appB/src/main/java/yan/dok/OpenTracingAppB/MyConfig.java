package yan.dok.OpenTracingAppB;

import okhttp3.OkHttpClient;
import org.springframework.cloud.openfeign.FeignClientsConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import(FeignClientsConfiguration.class)
public class MyConfig {
    @Bean
    public OkHttpClient client() {
        return new OkHttpClient();
    }
}