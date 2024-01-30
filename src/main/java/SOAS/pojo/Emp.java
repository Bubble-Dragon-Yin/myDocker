package SOAS.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Emp {
    private int id;
    private String username;
    private String name;
    private String password;
    private String gender;
    private float salary;
    private String profilePhoto;
    private String wtrStatus;
    private String eleStatus;
    private String rcyStatus;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate registerDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate updateDate;
    private String role;

    private int attendance;
    private String workStatus;
    private String sportStatus;
    private String partyStatus;
    private String skillCompStatus;

}

