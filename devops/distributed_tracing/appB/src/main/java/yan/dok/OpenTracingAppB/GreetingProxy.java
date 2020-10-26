package yan.dok.OpenTracingAppB;

import feign.RequestLine;


public interface GreetingProxy  {

    @RequestLine("GET /greeting")

   Greeting greeting();


}