package SOAS;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("SOAS.mapper")
public class SuperiorOASApplication {

    public static void main(String[] args) {
        SpringApplication.run(SuperiorOASApplication.class, args);
    }

}
