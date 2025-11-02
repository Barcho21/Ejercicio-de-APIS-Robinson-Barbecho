package runners;

import com.intuit.karate.junit5.Karate;

public class PetStoreRunner {
    @Karate.Test
    Karate testPetStore() {
        return Karate.run("classpath:petstore/SuiteE2E.feature");
    }
}
