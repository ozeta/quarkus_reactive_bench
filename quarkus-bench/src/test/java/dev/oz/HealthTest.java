package dev.oz;

import io.quarkus.test.junit.QuarkusTest;
import org.junit.jupiter.api.Test;

import static io.restassured.RestAssured.given;
import static org.hamcrest.CoreMatchers.equalTo;

@QuarkusTest
public class HealthTest {

    @Test
    public void testHelloEndpoint() {
        given()
          .when().get("health/ready")
          .then()
             .statusCode(200)
             .body("ready", equalTo("ok"));
    }

}