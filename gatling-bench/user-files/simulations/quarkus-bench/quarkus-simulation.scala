package quarkus.bench
import io.gatling.core.Predef._
import io.gatling.http.Predef._
import scala.concurrent.duration._

class QuarkusSimulation extends Simulation {

object Get {
    val get = exec( http("Root").get("/api/public"))
}
  val httpProtocol = http
    .baseUrl("http://127.0.0.1:8080")
    .acceptHeader("text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8")
    .doNotTrackHeader("1")
    .acceptLanguageHeader("en-US,en;q=0.5")
    .acceptEncodingHeader("gzip, deflate")
    .userAgentHeader("Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:16.0) Gecko/20100101 Firefox/16.0")
 
  // Now, we can write the scenario as a composition
  val scn = scenario("Quarkus bench").exec(Get.get)

  setUp(scn.inject(constantUsersPerSec(10000) during(2 minutes)))
  .protocols(httpProtocol)
  .throttle(
  reachRps(10000) in (1 minute),
  holdFor(9 minute)
)
}
