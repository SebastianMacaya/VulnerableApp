package org.sasanlabs.configuration;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.Arrays;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class H2ConsoleExposureIntegrationTest {

    @Autowired private Environment environment;
    @Autowired private TestRestTemplate client;
    @LocalServerPort private int port;

    @Test
    void defaultPublicAndUnsafeProfilesDoNotServeTheH2Console() {
        assertTrue(
                Arrays.asList(environment.getActiveProfiles())
                        .containsAll(List.of("public", "unsafe")));

        for (String path : List.of("/h2/", "/h2/login.jsp")) {
            assertEquals(
                    HttpStatus.NOT_FOUND,
                    client.getForEntity(
                                    "http://localhost:" + port + "/VulnerableApp" + path,
                                    String.class)
                            .getStatusCode());
        }
    }
}
