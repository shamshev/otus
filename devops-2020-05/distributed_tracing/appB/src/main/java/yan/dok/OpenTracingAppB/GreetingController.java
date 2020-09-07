package yan.dok.OpenTracingAppB;

import feign.Client;
import feign.Feign;
import feign.auth.BasicAuthRequestInterceptor;
import feign.codec.Decoder;
import feign.codec.Encoder;
import feign.opentracing.TracingClient;
import io.opentracing.Tracer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.concurrent.atomic.AtomicLong;

@RestController
public class GreetingController {

    private static final String template = "Hello, %s!";
    private final AtomicLong counter = new AtomicLong();

    private GreetingProxy greetingFeignClient;

    @Autowired
    public GreetingController(
            Decoder decoder, Encoder encoder, Client client, Tracer tracer) {
        this.greetingFeignClient = Feign.builder().client(new TracingClient(client, tracer))
                .encoder(encoder)
                .decoder(decoder)
                .requestInterceptor(new BasicAuthRequestInterceptor("user", "user"))
                .target(GreetingProxy.class, "http://localhost:8080");
    }

    @RequestMapping("/greeting")
    public Greeting greeting(@RequestParam(value="name", defaultValue="World") String name) {
        greetingFeignClient.greeting();
        return new Greeting(counter.incrementAndGet(),
                String.format(template, name));
    }
}